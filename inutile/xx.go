package main

import (
    "encoding/json"
    "fmt"
    "math/rand"
    "os"
    "time"
)

type DataItem struct {
    ID    int `json:"id"`
    Value int `json:"value"`
}

func main() {
    rand.Seed(time.Now().UnixNano())
    data := make([]DataItem, 10)
    for i := 0; i < 10; i++ {
        data[i] = DataItem{ID: i, Value: rand.Intn(100)}
    }

    file, err := os.Create("data.json")
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()

    encoder := json.NewEncoder(file)
    encoder.SetIndent("", "  ")
    if err := encoder.Encode(data); err != nil {
        fmt.Println("Error encoding JSON:", err)
    }

    fmt.Println("Data generated and saved to data.json")
}