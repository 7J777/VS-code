# Nom de l'exécutable
TARGET = data_generator

# Compilateur et options
CXX = g++
CXXFLAGS = -Wall -std=c++11

# Fichiers source et objets
SRCS = data_generator.cpp
OBJS = $(SRCS:.cpp=.o)

# Règle par défaut
all: $(TARGET)

# Règle pour créer l'exécutable
$(TARGET): $(OBJS)
    $(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Règle pour compiler les fichiers source
%.o: %.cpp
    $(CXX) $(CXXFLAGS) -c $< -o $@

# Règle pour nettoyer les fichiers générés
clean:
    rm -f $(TARGET) $(OBJS)