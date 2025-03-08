import Foundation

struct DataItem: Codable {
    let id: Int
    let value: Int
}

let data = (0..<10).map { DataItem(id: $0, value: Int.random(in: 0..<100)) }

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

if let jsonData = try? encoder.encode(data) {
    let jsonString = String(data: jsonData, encoding: .utf8)!
    let fileURL = URL(fileURLWithPath: "data.json")
    try? jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
}