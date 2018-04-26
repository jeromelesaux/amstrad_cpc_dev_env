
/* 
	EXAMPLE1.C

	Demonstrate the PRINT library features
*/

#include "PRINT.C"

main()
{
	char c;
	int i;
	
	printstrln("Now displaying the alphabet...");

	i = 0;
	for ( c = 'A'; c <= 'Z'; c++ )
	{
		printchar( c );
		i++;		
	}
	printstrln("");

	printstr("Letter count : ");
	printdec(i);
	printstrln("");
}
