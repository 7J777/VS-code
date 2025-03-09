require "json"

struct DataItem
  include JSON::Serializable
  property id : Int32
  property value : Int32
end

data = Array(DataItem).new

10.times do |i|
  data << DataItem.new(id: i, value: rand(100))
end

File.write("data.json", data.to_json(pretty: true))