#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>

int main() {
    std::ofstream file("data.json");
    if (!file.is_open()) {
        std::cerr << "Error opening file!" << std::endl;
        return 1;
    }

    std::srand(std::time(nullptr));

    file << "[\n";
    for (int i = 0; i < 10; ++i) {
        int value = std::rand() % 100;
        file << "  { \"id\": " << i << ", \"value\": " << value << " }" << (i < 9 ? "," : "") << "\n";
    }
    file << "]\n";

    file.close();
    return 0;
}