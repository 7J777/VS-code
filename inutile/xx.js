const fs = require('fs');

function generateData(filename) {
    const data = [];
    for (let i = 0; i < 10; i++) {
        data.push({ id: i, value: Math.floor(Math.random() * 100) });
    }

    fs.writeFileSync(filename, JSON.stringify(data, null, 4));
    console.log(`Data generated and saved to ${filename}`);
}

generateData('data.json');