require 'json'
require 'securerandom'

data = 10.times.map do |i|
  { id: i, value: SecureRandom.random_number(100) }
end

File.open('data.json', 'w') do |f|
  f.write(JSON.pretty_generate(data))
end