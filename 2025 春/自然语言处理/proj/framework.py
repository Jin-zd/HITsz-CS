from openai import OpenAI
from experience_pool import ExperiencePool
from tqdm import tqdm
from time import sleep


class MemoryAgent:
    def __init__(self):
        self.client = OpenAI(api_key="sk-8eb46427963644fd90b92d47394ad4f8", base_url="https://api.deepseek.com/v1")
        self.ex_pool = ExperiencePool()

    def get_response(self, chat_prompt, sys_prompt=None):
        response = self.client.chat.completions.create(
            model="deepseek-chat",
            messages=[
                {"role": "system", "content": sys_prompt},
                {"role": "user", "content": chat_prompt}
            ],
        )
        return response.choices[0].message.content
    
    def get_prompt(self, input_text, experience_text):
        prompt = f"""
任务的输入为社交媒体文本，输出为仇恨四元组，顺序依次为Target、Argument、Targeted Group、Hateful。
四元组介绍：
- 评论对象（Target）：帖子的评述对象，如一个人或一个群体，目标只能从实例中提取。
- 论点（Argument）：评论中目标关键论点的主要信息片段，不要太长。
- 目标群体（Targeted Group）：指包含仇恨信息的评论对象-论点对涉及的目标群体。标注的目标群体包括“Region”、“Racism”、“Sexism”、“LGBTQ”、“others”共5类。
- 是否仇恨（Hateful）：评论对象-论点对是否构成了对某些群体的仇恨言论。结果为hate或者non-hate。

如果是否仇恨标记为non-hate，则目标群体标记为non-hate。
每个四元组中各元素之间用" | "分割，并利用[END]结尾；
如果一条样本中包含多个主要评述对象, 不同四元组之间利用[SEP]分割。只有在必要的时候使用多个，不要盲目使用。
请严格按照顺序和格式输出，不能省略空格，只输出四元组内容。

下面是之前一些经验：
{experience_text}

示例：
输入：把中国当成他们的殖民地。
输出：他们 | 把中国当成他们的殖民地 | Racism | hate [END]

**按照下面的格式给出答案，严格按照要求进行回复，利用之前的经验进行输出的生成**：
输入：{input_text}
输出：
"""
        return prompt
    
    def reflect(self, model_output, label):
        prompt = f"""
请对以下仇恨言论识别任务的预测结果进行分析和反思：

模型输出：{model_output}
正确答案：{label}

请从以下几个方面进行反思分析：
1. 对于评论对象（Target）、论点（Argument）、目标群体（Targeted Group）的分类、仇恨程度（Hateful）的判断是否准确？
2. 这类错误的可能原因是什么？针对这类问题，应该注意哪些关键点？

请总结出具体的经验教训，用于指导后续类似文本的分析。格式要求：
- 简洁明了，突出重点
- 包含具体的识别要点和注意事项
- 可以作为经验指导应用到类似案例中

反思总结（**不超过5句话**）：
"""
        reflection = self.get_response(prompt, sys_prompt="你是一个细粒度中文仇恨言论识别任务反思专家")
        return reflection
    
    def train(self, data_loader):
            for data in tqdm(data_loader, desc="Training"):
                input_text = data['content']
                label = data['output']
                experiences = self.ex_pool.search(input_text, top_k=3, threshold=0.7)
                experiences = [exp['experience'] for exp in experiences]

                if experiences:
                    experience_text = "\n".join([exp for exp in experiences])
                else:
                    experience_text = "没有相关经验。"

                prompt = self.get_prompt(input_text, experience_text)

                response = self.get_response(prompt, sys_prompt="你是一个细粒度中文仇恨言论识别任务专家")

                reflection = self.reflect(response, label)
                self.ex_pool.add_experience(reflection, input_text)

                sleep(0.2)
           
    
    def evaluate(self, data_loader):
        with open('result.txt', 'w', encoding='utf-8') as f:
            for data in tqdm(data_loader, desc="Evaluating"):
                input_text = data['content']
                experiences = self.ex_pool.search(input_text, top_k=3, threshold=0.7)
                experiences = [exp['experience'] for exp in experiences]
                if experiences:
                    experience_text = "\n".join([exp for exp in experiences])
                else:
                    experience_text = "没有相关经验。"

                prompt = self.get_prompt(input_text, experience_text)
                response = self.get_response(prompt, sys_prompt="你是一个细粒度中文仇恨言论识别任务专家")
                f.write(response + "\n")
                f.flush()
                sleep(0.2)


        