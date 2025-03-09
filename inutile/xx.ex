defmodule DataGenerator do
  def generate_data do
    data = for i <- 0..9 do
      %{"id" => i, "value" => :rand.uniform(100) - 1}
    end

    json = Jason.encode!(data, pretty: true)
    File.write!("data.json", json)
  end
end

DataGenerator.generate_data()