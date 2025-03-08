<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $processed_data = array_map(function($item) {
        return [
            'id' => $item['id'],
            'value' => $item['value'] * 2
        ];
    }, $data);
    echo json_encode($processed_data);
}
?>
