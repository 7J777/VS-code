from flask import Flask, jsonify
import subprocess
import json

app = Flask(__name__)

@app.route('/generate-data', methods=['GET'])
def generate_data():
    subprocess.run(['python3', 'data_generator.py'])
    with open('data.json', 'r') as f:
        data = json.load(f)
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)