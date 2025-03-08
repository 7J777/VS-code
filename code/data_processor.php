<?php
header('Content-Type: application/json');

$input = json_decode(file_get_contents('php://input'), true);
$output = array_map(function($item) {
    return [
        'id' => $item['id'],
        'value' => $item['value'] * 2
    ];
}, $input);

echo json_encode($output);
?>