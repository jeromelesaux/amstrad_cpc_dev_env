#include <cpcrslib.h>



char main (void) {
	unsigned char z=0;


	cpc_DisableFirmware();		//Now, I don't gonna use any firmware routine so I modify interrupts jump to nothing
	cpc_ClrScr();				//fills scr with ink 0
	cpc_SetMode(1);				//hardware call to set mode 1

    cpc_SetColour(0,20);        //set background = black
    cpc_SetColour(16,20);       //set border = black

	cpc_PrintGphStrStd(1,"THIS IS A SMALL DEMO", 0xc050);	//parameters: pen, text, adress
	cpc_PrintGphStrStd(2,"OF MODE 1 TEXT WITH",0xc0a0);
	cpc_PrintGphStrStd(3,"8x8 CHARS WITHOUT FIRMWARE",0xc0f0);
	cpc_PrintGphStrStdXY(3,"AND A SMALL SOFT SCROLL DEMO",8,70);
	cpc_PrintGphStrStdXY(2,"CPCRSLIB (C) 2015",19,80);
	cpc_PrintGphStrStdXY(1, "-- FONT BY ANJUEL  2009  --",2,160);
	cpc_PrintGphStrStdXY(1,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",2,174);

    //while (cpc_AnyKeyPressed()==0){}
	while (cpc_AnyKeyPressed()==0) {			//Small scrolling effect
	   z = !z;
	   if (z) {
	      cpc_RRI (0xe000, 40, 79);
	      cpc_RRI (0xe4b0, 32, 79);
	   }
	   //cpc_RRI (0xe5f0, 12, 79);
	   cpc_RLI (0xe5f0+0x50+0x50+79, 12, 79);


	}


while (cpc_AnyKeyPressed()==0){}
	cpc_EnableFirmware();	//before exit, firmware jump is restored
	return 0;
}


