COMPILER	:= gcc

MAIN		:= src/main.c
LEXER 		:= src/json.l
PARSER		:= src/json.y
OUTPUT		:= build/json

INPUTS		:= build/main.c build/json.c build/json.lex.c
ARTIFACTS	:= build/main.c build/json.c build/json.h build/json.lex.c

build: build-folder
	cp $(MAIN) build
	bison -d $(PARSER) -o build/json.c
	flex -o build/json.lex.c $(LEXER)
	$(COMPILER) $(INPUTS) -o $(OUTPUT)
	rm $(ARTIFACTS)

build-folder:
	rm -rf build
	mkdir build

clean:
	rm -rf build
