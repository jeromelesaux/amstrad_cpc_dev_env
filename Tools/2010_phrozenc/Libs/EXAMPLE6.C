
/* 
	EXAMPLE^.C

	Demonstrate the INPUT library features
*/

#include "PRINT.C"
#include "INPUT.C"

#define MAXNAMESIZE 10
static char name[ MAXNAMESIZE ];
	
main()
{
	printstr("Enter your name : ");
	getstr(name);

	printstrln("");
	printstr("Your name is ");
	printstrln(name);
}
