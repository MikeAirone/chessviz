#define CTEST_MAIN
#include <board.h>
#include <board_print.h>
#include <board_print_plain.h>
#include <input.h>
#include <ctest.h>

CTEST(Syntax, Correct) 
{
	int result = input_check("a2a8");
	int expected = 0;
	ASSERT_EQUAL(expected, result);
}

CTEST(Syntax, Incorrect) 
{
    	int result = input_check("a2a9"); 
	int expected = 1; 
	ASSERT_EQUAL(expected, result);
}

int main(int argc, const char** argv) 
{
    	return ctest_main(argc, argv);
}
