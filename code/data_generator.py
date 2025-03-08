import json
import random

def generate_data():
    data = []
    for _ in range(10):
        data.append({
            'id': random.randint(1, 100),
            'value': random.uniform(1.0, 100.0)
        })
    return data

if __name__ == "__main__":
    data = generate_data()
    with open('data.json', 'w') as f:
        json.dump(data, f)
