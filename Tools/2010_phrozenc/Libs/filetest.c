
/* 
	EXAMPLE2.C

	Demonstrate the FILE library features
*/

#include "PRINT.C"
#include "FILE.C"

#define TXTFILENAME "TESTTEXT.BIN"
#define BINFILENAME "TESTDATA.BIN"

static char readbuffer[ 2048 ];
static char writebuffer[ 2048 ];

main()
{
	initamsdos();
	/* write an ASCII file containing the alphabet */
	printstrln("** TEST 1/4 : WRITE ASCII FILE");
	writeText();	
	
	/* read the ASCII file and display it to screen */
	printstrln("");
	printstrln("** TEST 2/4 : READ ASCII FILE");
	readText();	

	initBinData();

	/* write a BINARY file containing the alphabet */
	printstrln("");
	printstrln("** TEST 3/4 : WRITE BINARY FILE");
	writeBinary();

	/* read the BINARY file and check that result is OK */
	printstrln("");
	printstrln("** TEST 4/4 : READ BINARY FILE");
	readBinary();
}

writeText()
{
	int i;

	if ( openwrite( TXTFILENAME, writebuffer ) == 0 )
	{
		return;
	}

	putstrln("This is the alphabet :");

	for ( i = 'A'; i <= 'Z'; i++ )
	{
		putchar(i);
	}
	putstrln("");

	closewrite();
}

readText()
{
	if ( openread( TXTFILENAME, readbuffer ) == 0 )
	{
		return;
	}

	while ( iseof() == 0 )
	{
		printchar( getchar() );
	}

	closeread();
}

#define BINARYSIZE 100
static char binWriteData[ BINARYSIZE ];
static char binReadData[ BINARYSIZE ];
static int checksum;

initBinData()
{
	int i;

	checksum = 0;

	for ( i = 0; i < BINARYSIZE; i++ )
	{
		binWriteData[ i ] = i;

		checksum += binWriteData[ i ];
	}
}

writeBinary()
{
	if ( openwrite( BINFILENAME, writebuffer ) == 0 )
	{
		return;
	}

	putbinary( binWriteData, BINARYSIZE, 0 );

	closewrite();
}

readBinary()
{
	int i;
	int readcs;

	if ( openread( BINFILENAME, readbuffer ) == 0 )
	{
		return;
	}

	getbinary( binReadData );

	readcs = 0;
	for ( i = 0; i < BINARYSIZE; i++ )
	{
		readcs += binReadData[ i ];
	}

	closeread();

	if ( readcs == checksum )
	{
		printstrln("Checksum OK !");
	}
	else
	{
		printstrln("Checksum FAILED !");
	}
}
