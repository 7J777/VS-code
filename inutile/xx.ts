import * as fs from 'fs';

interface DataItem {
    id: number;
    value: number;
}

const data: DataItem[] = [];

for (let i = 0; i < 10; i++) {
    data.push({ id: i, value: Math.floor(Math.random() * 100) });
}

const jsonData = JSON.stringify(data, null, 4);
fs.writeFileSync('data.json', jsonData);

console.log('Data generated and saved to data.json');