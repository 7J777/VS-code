import json
import random

def generate_data(filename):
    data = [{"id": i, "value": random.randint(0, 99)} for i in range(10)]
    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)
    print(f"Data generated and saved to {filename}")

if __name__ == "__main__":
    generate_data("data.json")