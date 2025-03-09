@echo off
setlocal

REM Générer des données aléatoires et les enregistrer dans un fichier JSON
powershell -Command ^
$Data = @(); ^
for ($i = 0; $i -lt 10; $i++) { ^
    $Data += [PSCustomObject]@{id=$i; value=(Get-Random -Maximum 100)}; ^
} ^
$Json = $Data | ConvertTo-Json -Depth 3; ^
$Json | Out-File -FilePath data.json -Encoding utf8 -Force

echo Data generated and saved to data.json

endlocal