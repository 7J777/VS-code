using System;
using System.IO;
using System.Text.Json;
using System.Text.Json.Serialization;

class Program
{
    static void Main()
    {
        var random = new Random();
        var data = new object[10];

        for (int i = 0; i < 10; i++)
        {
            data[i] = new { id = i, value = random.Next(100) };
        }

        var options = new JsonSerializerOptions { WriteIndented = true };
        var json = JsonSerializer.Serialize(data, options);

        File.WriteAllText("data.json", json);
    }
}