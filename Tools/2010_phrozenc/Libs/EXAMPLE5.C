
/* 
	EXAMPLE5.C

	Demonstrate the MEMORY library features
*/

/* after compilation, don't forget to override ORG position
	to a value different from 0x4000 to 0x7FFF ! */

#include "PRINT.C"
#include "MEMORY.C"
#include "GRAPHIC.C"
#include "INPUT.C"

main()
{
	int i;
	int bankList[ 5 ];

	bankList[ 0 ] = 0xc0;
	bankList[ 1 ] = 0xc4;
	bankList[ 2 ] = 0xc5;
	bankList[ 3 ] = 0xc6;
	bankList[ 4 ] = 0xc7;

	for ( i = 0; i < 5; i++ )
	{
		mode( 2 );
		
		bankSwitch( bankList[ i ] );
		memcpy( 0x4000, 0xc000, 0x4000 );

		printstr("this is bank &");
		printhex(bankList[ i ]);
		printstr(" ..");

		waitKey();
	}

	bankSwitch( 0xc0 );
}
