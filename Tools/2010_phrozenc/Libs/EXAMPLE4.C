
/* 
	EXAMPLE4.C

	Demonstrate the STRING library features
*/

#include "PRINT.C"
#include "STRING.C"

static char bigString[ 64 ];

main()
{
	char *ptr1;
	char *ptr2;
	int len;
	int aNumber;

	/* strlen */
	ptr1 = "ABCD1234";
	len = strlen( ptr1 );
	printstr(ptr1);
	printstr(" = ");
	printdec(len);
	printstrln(" characters");

	/* strcpy */
	strcpy( bigString, "I'm a copy !");
	printstrln( bigString );

	/* strcat */
	strcpy( bigString, "This is a ");
	strcat( bigString, "string concatenation");
	printstrln( bigString );

	/* itoa */
	aNumber = 32;
	itoa(aNumber, bigString, 10);
	printstr(bigString);
	printstr(" = &");
	itoa(aNumber, bigString, 16);
	printstrln(bigString);
}
