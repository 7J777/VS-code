#!/bin/bash

# Générer des données aléatoires et les enregistrer dans un fichier JSON
data="["

for i in {0..9}; do
    value=$((RANDOM % 100))
    data+="{\"id\": $i, \"value\": $value}"
    if [ $i -lt 9 ]; then
        data+=","
    fi
done

data+="]"

echo $data | jq '.' > data.json

echo "Data generated and saved to data.json"