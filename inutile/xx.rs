use rand::Rng;
use serde::Serialize;
use std::fs::File;
use std::io::Write;

#[derive(Serialize)]
struct DataItem {
    id: u32,
    value: u32,
}

fn main() {
    let mut rng = rand::thread_rng();
    let data: Vec<DataItem> = (0..10)
        .map(|i| DataItem {
            id: i,
            value: rng.gen_range(0..100),
        })
        .collect();

    let json_data = serde_json::to_string_pretty(&data).unwrap();
    let mut file = File::create("data.json").unwrap();
    file.write_all(json_data.as_bytes()).unwrap();

    println!("Data generated and saved to data.json");
}