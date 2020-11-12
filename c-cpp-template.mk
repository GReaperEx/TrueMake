# The invoked C/C++ compiler
COMPILER 	   := gcc
# General arguments passed to the compiler
COMPILER_FLAGS := -Wall
# Additional arguments for generating dependency files
COMPILER_FLAGS += -MMD -MP
# Include paths
COMPILER_INCS  :=

# The invoked C/C++ linker
LINKER       := gcc
# General arguments passed to the linker
LINKER_FLAGS := -lm
# Library paths
LINKER_INCS  :=

# Final binaries are placed here
BIN := bin
# Intermediate/object binaries are placed here (including dep files)
OBJ := .obj

# Source files are found here (and only here, not in subdirectories)
# *** Unlike other paths, these need slashes at their ends ***
SRC := ./
# Source files' extension (can't be more than one)
SRC_EXT := .c

# The target's name (without directory paths)
TARGET := a.out

SOURCES := $(wildcard $(addsuffix *$(SRC_EXT),$(SRC)))
OBJECTS := $(patsubst %$(SRC_EXT),$(OBJ)/%.o,$(SOURCES))
DEPENDS := $(OBJECTS:.o=.d)

INC_PATHS := $(addprefix -I,$(COMPILER_INCS))
LIB_PATHS := $(addprefix -L,$(LINKER_INCS))

.PHONY: all clean run

all : $(BIN)/$(TARGET)

$(BIN)/$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	@echo Linking $@
	@$(LINKER) $(LINKER_FLAGS) $(LIB_PATHS) -o $@ $^

$(OBJ)/%.o : %$(SRC_EXT)
	@mkdir -p $(@D)
	@echo Compiling $<
	@$(COMPILER) $(COMPILER_FLAGS) $(INC_PATHS) -c -o $@ $<

clean :
	@-rm -f $(BIN)/$(TARGET) $(OBJECTS) $(DEPENDS)

run : $(BIN)/$(TARGET)
	@./$(BIN)/$(TARGET) $(ARGS)

-include $(DEPENDS)