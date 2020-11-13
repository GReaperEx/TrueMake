# The invoked C/C++ compiler/linker
COMPILER       := gcc
# General arguments passed to the compiler
COMPILER_FLAGS := -Wall
# Libraries you might want to link
LINKER_FLAGS   := -lm

# Executables are stored in the same folder as the source

# Sources are found only in these folders (not in subdirectories)
SRC := ./

# Source files' extension (can't be more than one)
SRC_EXT := .c
# Target files' extension (can't be more than one)
BIN_EXT :=

SOURCES := $(wildcard $(addsuffix *$(SRC_EXT),$(SRC)))
TARGETS := $(patsubst %$(SRC_EXT),%$(BIN_EXT),$(SOURCES))

.PHONY: all clean

all : $(TARGETS)

% : %$(SRC_EXT)
	@echo Building $@
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $< $(LINKER_FLAGS)

clean :
	@-rm -f $(TARGETS)
