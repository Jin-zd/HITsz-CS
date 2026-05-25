import jieba
import math
from collections import defaultdict
import time

class NaiveBayesClassifier:
    def __init__(self, alpha=1.0):
        """
        alpha: 拉普拉斯平滑系数，默认为1.0，避免零概率问题。
        """
        self.alpha = alpha
        self.class_priors = {}       # 存储每个类别的先验概率 P(c)
        self.conditional_probs = {}  # 存储每个类别下，每个词的条件概率 P(w|c)
        self.vocabulary = set()      # 存储训练集中出现的所有词汇

    def fit(self, X_train, y_train):
        print("开始训练模型...")
        start_time = time.time()

        # 1. 计算类别总数和每个类别的文档数
        num_docs = len(y_train)
        class_counts = defaultdict(int)
        for label in y_train:
            class_counts[label] += 1

        # 2. 计算每个类别的先验概率 P(c) 并取对数
        self.class_priors = {label: math.log(count / num_docs) for label, count in class_counts.items()}

        # 3. 按类别组织文档，并统计词频
        docs_by_class = defaultdict(list)
        for i, doc in enumerate(X_train):
            docs_by_class[y_train[i]].extend(doc)
            for word in doc:
                self.vocabulary.add(word)

        vocab_size = len(self.vocabulary)
        
        # 4. 计算每个类别下词语的条件概率 P(w|c)
        #    P(w|c) = (c类下w词出现的次数 + alpha) / (c类下所有词的总数 + alpha * |V|)
        for label, docs in docs_by_class.items():
            word_counts_in_class = defaultdict(int)
            for word in docs:
                word_counts_in_class[word] += 1
            
            total_words_in_class = len(docs)
            
            self.conditional_probs[label] = {}
            
            denominator = total_words_in_class + self.alpha * vocab_size
            for word in self.vocabulary:
                numerator = word_counts_in_class[word] + self.alpha
                self.conditional_probs[label][word] = math.log(numerator / denominator)
            
            self.conditional_probs[label]['<unk>'] = math.log(self.alpha / denominator)

        end_time = time.time()
        print(f"模型训练完成，耗时: {end_time - start_time:.2f} 秒")

    def predict(self, X_data):
        print("开始预测...")
        start_time = time.time()
        predictions = []
        
        for doc in X_data:
            class_scores = {label: prior for label, prior in self.class_priors.items()}
            
            for word in doc:
                if word in self.vocabulary:
                    for label in class_scores:
                        class_scores[label] += self.conditional_probs[label][word]
                else:
                    for label in class_scores:
                        class_scores[label] += self.conditional_probs[label]['<unk>']

            best_class = max(class_scores, key=class_scores.get)
            predictions.append(best_class)
            
        end_time = time.time()
        print(f"预测完成，耗时: {end_time - start_time:.2f} 秒")
        return predictions

def load_data(filepath):
    print(f"正在加载数据: {filepath}...")
    texts, labels = [], []
    with open(filepath, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            parts = line.split()
            texts.append(' '.join(parts[:-1]))
            labels.append(parts[-1])
    return texts, labels

def preprocess_text(texts):
    print("正在进行文本预处理（分词）...")
    processed_texts = []
    for text in texts:
        words = jieba.lcut(text)
        processed_texts.append(words)
    return processed_texts

def evaluate(y_true, y_pred, dataset_name="测试集"):
    correct_predictions = 0
    for true, pred in zip(y_true, y_pred):
        if true == pred:
            correct_predictions += 1
    
    accuracy = correct_predictions / len(y_true)
    print(f"模型在【{dataset_name}】上的准确率: {accuracy:.4f}")
    return accuracy

if __name__ == "__main__":
    # 1. 定义文件路径 (请根据您的实际文件名修改)
    train_file = 'data/train.txt'
    val_file = 'data/dev.txt'  
    test_file = 'data/test.txt'
    
    # 2. 加载和预处理数据
    X_train_raw, y_train = load_data(train_file)
    X_val_raw, y_val = load_data(val_file)   
    X_test_raw, y_test = load_data(test_file)

    X_train_processed = preprocess_text(X_train_raw)
    X_val_processed = preprocess_text(X_val_raw)
    X_test_processed = preprocess_text(X_test_raw)

    # 3. 创建并训练模型
    model = NaiveBayesClassifier(alpha=1.0)
    model.fit(X_train_processed, y_train)

    # 4. 在验证集上进行评估 
    print("\n--- 在验证集上进行评估 ---")
    val_predictions = model.predict(X_val_processed)
    evaluate(y_val, val_predictions, dataset_name="验证集")

    # 5. 在测试集上进行最终评估
    print("\n--- 在测试集上进行评估 ---")
    test_predictions = model.predict(X_test_processed)
    evaluate(y_test, test_predictions, dataset_name="测试集")

    # 6. 打印一些测试集上的预测示例
    print("\n--- 测试集预测示例 ---")
    for i in range(5):
        print(f"新闻标题: {X_test_raw[i]}")
        print(f"真实类别: {y_test[i]}")
        print(f"预测类别: {test_predictions[i]}\n")