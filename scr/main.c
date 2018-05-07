#include "board.h"
#include "board_print.h"
#include "board_print_plain.h"
int main()
{
	char deck[8][8];
	board_print(deck);
	//printDeck(deck);
	while (1)
	{
		printDeck(deck);
		check(deck);
	}	
	return 0;

}
