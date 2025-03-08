import random
import time

class ComplexAlgorithm:
    def __init__(self):
        self.data = [random.randint(1, 100) for _ in range(10)]

    def process(self):
        for i in range(len(self.data)):
            self.data[i] = self.data[i] ** 2
            time.sleep(0.1)  # Simulate time-consuming task

    def display(self):
        print("Processed Data:", self.data)

def run():
    algo = ComplexAlgorithm()
    algo.process()
    algo.display()
