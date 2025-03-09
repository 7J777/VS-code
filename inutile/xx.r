# Charger les bibliothèques nécessaires
install.packages("jsonlite")
library(jsonlite)

# Générer des données aléatoires
set.seed(123)
data <- data.frame(id = 0:9, value = sample(0:99, 10, replace = TRUE))

# Convertir les données en JSON
json_data <- toJSON(data, pretty = TRUE)

# Enregistrer les données JSON dans un fichier
write(json_data, file = "data.json")

cat("Data generated and saved to data.json\n")