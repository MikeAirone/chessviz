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

build/main.o: scr/main.c scr/board.h scr/board_print.h scr/board_print_plain.h scr/input.h
	$(CXX) $(CFLAGS) scr/main.c -o build/main.o 

build/board.o: scr/board.c scr/board.h scr/board_print.h scr/board_print_plain.h scr/input.h
	$(CXX) $(CFLAGS) scr/board.c -o build/board.o 

build/board_print_plain.o: scr/board_print_plain.c scr/board.h scr/board_print.h scr/board_print_plain.h scr/input.h
	$(CXX) $(CFLAGS) scr/board_print_plain.c -o build/board_print_plain.o

build/board_print.o: scr/board_print.c scr/board.h scr/board_print.h scr/board_print_plain.h scr/input.h
	$(CXX) $(CFLAGS) scr/board_print.c -o build/board_print.o

build/input.o: scr/input.c scr/input.h scr/board.h
	$(CXX) $(CFLAGS) scr/input.c -o build/input.o

bin/prog_test: $(OB) 
	$(CXX) $(FLAGS) $(OB) -o bin/prog_test


build/main_test.o: test/main.c thirdparty/ctest.h scr/board.h scr/input.h 
	$(CXX) $(CFLAGS) -I thirdparty -I scr -c test/main.c -o build/main_test.o

build:
	mkdir  build
bin:
	mkdir  bin 
clean:
	-rm -rf build bin

