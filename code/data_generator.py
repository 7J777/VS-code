import json
import random

data = [{'id': i, 'value': random.randint(1, 100)} for i in range(10)]

with open('data.json', 'w') as f:
    json.dump(data, f)