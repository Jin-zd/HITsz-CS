import json
import random
from framework import MemoryAgent


with open('train.json', 'r', encoding='utf-8') as f:
    train_data = json.load(f)

with open('test.json', 'r', encoding='utf-8') as f:
    test_data = json.load(f)


agnet = MemoryAgent()
agnet.train(train_data)
agnet.evaluate(test_data)

