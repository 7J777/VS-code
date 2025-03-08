# Data Display Project

This project is designed to generate and display processed data using Flask, PHP, and JavaScript. The data is generated using Python, processed using PHP, and displayed in a web interface.

## Features

- **Data Generation**: Python script generates random data.
- **Data Processing**: PHP script processes the generated data.
- **Web Interface**: JavaScript fetches and displays the processed data.

## Getting Started

To get started with this project, follow these steps:

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
   ```

2. **Set up the environment**:
   - Ensure you have Python and Flask installed.
   - Ensure you have a web server capable of running PHP.

3. **Run the Flask server**:
   ```sh
   python3 code/server.py
   ```

4. **Open the web interface**:
   - Navigate to `docs/index.html` in your web browser.

## Project Structure

- `code/`: Contains the source code for the project.
  - `data_generator.py`: Generates random data.
  - `data_processor.php`: Processes the generated data.
  - `script.js`: Fetches and displays the processed data.
  - `server.py`: Flask server to serve the data.
  - `Setup and Run Flask Server.yaml`: GitHub Actions workflow to deploy the project.

- `docs/`: Contains the documentation and the web interface.
  - `index.html`: The main HTML file for the web interface.

## Contributing

Contributions are welcome! Please follow the guidelines in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
