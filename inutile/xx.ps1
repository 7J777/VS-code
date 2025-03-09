# Générer des données aléatoires et les enregistrer dans un fichier JSON
$data = @()
for ($i = 0; $i -lt 10; $i++) {
    $data += [PSCustomObject]@{id=$i; value=(Get-Random -Maximum 100)}
}

$json = $data | ConvertTo-Json -Depth 3
$json | Out-File -FilePath data.json -Encoding utf8 -Force

Write-Output "Data generated and saved to data.json"