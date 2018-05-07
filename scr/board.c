#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "board_print.h"
#include "board_print_plain.h"
void check (char deck [8][8])
{
	char move[4];
	scanf("%s", move);
	//printf ("%d %d", move[3] - '0',move[2] - 'a' + 1);
	if ((deck[move[3] - '0'][move[2] - 'a' + 1] == ' ') && (move[0] == move[2]) && ((move[0] - 'a' + 1)>0) && ((move[0] - 'a' + 1)<10) && ((move[1] - '0')>0) && ((move[1] - '0')<10) && ((move[2] - 'a' + 1)>0) && ((move[2] - 'a' + 1)<10) && ((move[3] - '0')>0) && ((move[3] - '0')<10))
	{
		if ((deck[move[1] - '0'][move[0] - 'a' + 1] == 'p') && (((move[3] - move[1]) == 1) || ((move[3] - move[1]) == 2)))
		{
			deck[move[3] - '0'][move[2] - 'a' + 1] = 'p';
			deck[move[1] - '0'][move[0] - 'a' + 1] = ' ';
		}
		if ((deck[move[1] - '0'][move[0] - 'a' + 1] == 'P') && (((move[1] - move[3]) == 1) || ((move[1] - move[3]) == 2)))
		{
			deck[move[3] - '0'][move[2] - 'a' + 1] = 'P';
			deck[move[1] - '0'][move[0] - 'a' + 1] = ' ';
		}
	}
}
