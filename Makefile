CXX=gcc
CFLAGS = -c -Wall -Werror -std=c99
FLAGS  =  -Wall -Werror -std=c99
OBJECTS = build/main.o build/board.o build/board_print_plain.o build/board_print.o build/input.o 

OB = build/main_test.o build/board.o build/board_print_plain.o build/board_print.o build/input.o 

.PHONY: clean all bin build default test

all: bin build default test

default: bin/prog

test: bin/prog_test
	bin/prog_test

bin/prog: $(OBJECTS)
	$(CXX) $(FLAGS) $(OBJECTS) -o bin/prog

build/main.o: src/main.c src/board.h src/board_print.h src/board_print_plain.h src/input.h
	$(CXX) $(CFLAGS) src/main.c -o build/main.o 

build/board.o: src/board.c src/board.h src/board_print.h src/board_print_plain.h src/input.h
	$(CXX) $(CFLAGS) src/board.c -o build/board.o 

build/board_print_plain.o: src/board_print_plain.c src/board.h src/board_print.h src/board_print_plain.h src/input.h
	$(CXX) $(CFLAGS) src/board_print_plain.c -o build/board_print_plain.o

build/board_print.o: src/board_print.c src/board.h src/board_print.h src/board_print_plain.h src/input.h
	$(CXX) $(CFLAGS) src/board_print.c -o build/board_print.o

build/input.o: src/input.c src/input.h src/board.h
	$(CXX) $(CFLAGS) src/input.c -o build/input.o

bin/prog_test: $(OB) 
	$(CXX) $(FLAGS) $(OB) -o bin/prog_test


build/main_test.o: test/main.c thirdparty/ctest.h src/board.h src/input.h 
	$(CXX) $(CFLAGS) -I thirdparty -I src -c test/main.c -o build/main_test.o

build:
	mkdir  build
bin:
	mkdir  bin 
clean:
	-rm -rf build bin

