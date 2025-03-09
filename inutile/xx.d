import std.stdio;
import std.file;
import std.json;
import std.random;
import std.conv;

void main() {
    auto data = [];
    foreach (i; 0 .. 10) {
        data ~= ["id": i, "value": uniform(0, 100)];
    }

    string json = toJSON(data, pretty: true);
    write("data.json", json);

    writeln("Data generated and saved to data.json");
}