<?php
$data = [];
for ($i = 0; $i < 10; $i++) {
    $data[] = ["id" => $i, "value" => rand(0, 99)];
}

$json_data = json_encode($data, JSON_PRETTY_PRINT);
file_put_contents('data.json', $json_data);

echo "Data generated and saved to data.json\n";
?>