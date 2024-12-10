# Nombre del ejecutable final
EXEC = programa

# Compilador
CXX = g++

# Flags de compilación
CXXFLAGS = -Wall -Wextra -std=c++17 -O2

# Archivos fuente y objeto
SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)
ASM_FILES = $(SRCS:.cpp=.s)

# Regla por defecto (primera que se ejecuta)
all: $(EXEC)

# Regla para enlazar los archivos objeto y crear el ejecutable
$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Regla para compilar archivos fuente a objeto
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regla para generar archivos ensamblador de los archivos fuente
assembler: $(ASM_FILES)

%.s: %.cpp
	$(CXX) -S $(CXXFLAGS) $< -o $@

# Regla para limpiar archivos generados
clean:
	rm -f $(OBJS) $(EXEC)

# Regla para limpiar todo, incluyendo otros archivos temporales
clean-all:
	rm -f $(OBJS) $(EXEC) $(ASM_FILES) *.out
