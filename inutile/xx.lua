local json = require("dkjson")

math.randomseed(os.time())

local data = {}
for i = 0, 9 do
    table.insert(data, {id = i, value = math.random(0, 99)})
end

local json_data = json.encode(data, {indent = true})

local file = io.open("data.json", "w")
file:write(json_data)
file:close()

print("Data generated and saved to data.json")