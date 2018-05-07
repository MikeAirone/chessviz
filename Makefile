CXX=gcc
CFLAGS =  -c -Wall -Werror -std=c99
.PHONY: all clean
OBJECTS =  build/board.o build/board_print_plain.o build/board_print.o build/main.o

all: bin build bin/prog

bin/prog: $(OBJECTS)
	$(CXX) $(OBJECTS) -o bin/prog

build/main.o: scr/main.c
	$(CXX) $(CFLAGS) scr/main.c -o build/main.o 

build/board.o: scr/board.c scr/board.h
	$(CXX) $(CFLAGS) scr/board.c -o build/board.o

build/board_print_plain.o: scr/board_print_plain.c scr/board_print_plain.h
	$(CXX) $(CFLAGS) scr/board_print_plain.c -o build/board_print_plain.o

build/board_print.o: scr/board_print.c scr/board_print.h
	$(CXX) $(CFLAGS) scr/board_print.c -o build/board_print.o
build:
	mkdir build
bin:
	mkdir bin 
clean:
	rm build/*.o
	rm bin/*
