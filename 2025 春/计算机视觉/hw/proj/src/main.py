import argparse
import sys
from train import train, parse_args as train_args
from evaluate import evaluate, parse_args as eval_args

def main():
    parser = argparse.ArgumentParser(description='PASCAL VOC 2012 Semantic Segmentation with UNet')
    parser.add_argument('--mode', type=str, choices=['train', 'eval'], default='train',
                      help='Run mode: train or evaluate')
    
    # 解析模式参数
    args, remaining = parser.parse_known_args()
    
    # 将剩余参数重新设置为sys.argv，以便子解析器能够处理
    sys.argv = [sys.argv[0]] + remaining
    
    # 根据模式执行相应功能
    if args.mode == 'train':
        train_arguments = train_args()
        train(train_arguments)
    else:
        eval_arguments = eval_args()
        evaluate(eval_arguments)

if __name__ == '__main__':
    main()