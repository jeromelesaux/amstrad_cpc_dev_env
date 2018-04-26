
/* 
	EXAMPLE3.C

	Demonstrate the GRAPHIC library features
*/

#include "GRAPHIC.C"

#define STEP 10

main()
{
	int x;
	int y;
	
	mode(1);

	border(7);
	ink(2,26);
	ink(3,15);

	for ( x = 0; x < 200; x += STEP )
	{
		for ( y = 0; y < 200; y += STEP )
		{
			pen(2);

			plot(x, y);
			draw(x+STEP, y+STEP);

			pen(3);
			
			plot(x+STEP, y);
			draw(x, y+STEP);
		}
	}
}
