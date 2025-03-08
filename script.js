document.addEventListener('DOMContentLoaded', () => {
    fetch('data_generator.py')
        .then(response => response.json())
        .then(data => {
            fetch('data_processor.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(processedData => {
                const dataContainer = document.getElementById('data-container');
                processedData.forEach(item => {
                    const div = document.createElement('div');
                    div.textContent = `ID: ${item.id}, Value: ${item.value}`;
                    dataContainer.appendChild(div);
                });
            });
        });
});
