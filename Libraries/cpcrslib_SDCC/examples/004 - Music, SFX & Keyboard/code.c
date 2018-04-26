#include "cpcrslib.h"
#include "cpcwyzlib.h"	//Music & Sound library
#include "datos.h"

extern char texto00[];
extern char texto01[];
extern char texto02[];
extern char texto03[];
extern char texto04[];
extern char texto05[];
extern char texto06[];
extern char texto07[];
extern char texto08[];
extern char texto09[];
extern char texto10[];
extern char texto11[];


const  char  pelota[] = {
 0x01,0x0E,0x00,
 0x03,0x0F,0x00,
 0x07,0x2D,0x08,
 0x0F,0x1E,0x0C,
 0x0F,0x0F,0x0C,
 0x0F,0x1E,0x0C,
 0x0F,0x07,0x0C,
 0x0F,0x0B,0x0C,
 0x07,0x0F,0x08,
 0x03,0x0F,0x00,
 0x01,0x0E,0x00,


};

void datos(void) {
	__asm

	_texto04:
	.asciz "RED;ALERT"
	_texto05:
	.asciz "CANCION;NUEVA"
	_texto06:
	.asciz "GOTHIC"
	_texto07:
	.asciz "MARYJANE"
	_texto08:
	.asciz "MIDNIGHT;XPRES"
	_texto09:
	.asciz ";;;;;;;;;;;;;;;"
	_texto10:
	.asciz "AHORA;SONANDO:"

__endasm;
}


void pause(void){
	__asm

	ld b,#10
	kolo:
		halt
	djnz kolo

	__endasm;
}



main(){
	unsigned char tema=0;
	unsigned char nuevotema=0;

   	char MinX,MinY,MaxX, MaxY,HorzSpd,VertSpd;
   	char cx,cy;

   	MaxX=60;
   	MaxY=110;
   	MinX=0;
   	MinY=5;
	VertSpd=1;
	HorzSpd=1;
	


	cpc_SetModo(1);

	// Text writting using firmware:
	//cpc_PrintStr();

	cpc_PrintStr("SFX & MUSIC DEMO. CPCRSLIB 2012-15");
	cpc_PrintStr("PSG PROPLAYER BY WYZ 2010");
	cpc_PrintStr("Press keys 1 to 4 to play SFX");
	cpc_PrintStr("Up & Down to change song");
	cpc_PrintStr("ESC to Quit");


	cpc_DisableFirmware();
	// Assign keys to key number (not numberpad keys)
	cpc_AssignKey(0,0x4801);		// key "1" assigned to 0
	cpc_AssignKey(1,0x4802);		// key "2"
	cpc_AssignKey(2,0x4702);		// key "3"
	cpc_AssignKey(3,0x4701);		// key "4"
	cpc_AssignKey(4,0x4804);		// key "ESC"
	cpc_AssignKey(5,0x4001);		// key "Up"
	cpc_AssignKey(6,0x4004);		// key "Down"

	cpc_SetColour(0,20);        //set background = black
    cpc_SetColour(16,20);       //set border = black

	cpc_SetInkGphStrM1(0,0);
	cpc_SetInkGphStrM1(1,8);
	cpc_SetInkGphStrM1(2,128);
	cpc_SetInkGphStrM1(3,136);


	cpc_WyzInitPlayer(SOUND_TABLE_0, RULE_TABLE_0, EFFECT_TABLE, SONG_TABLE_0);		//initialize data
	cpc_WyzLoadSong(0);	//Select song to play (uncompress it and the start to play)
	cpc_WyzSetPlayerOn();		//start music and sound effects (SFX)
	nuevotema=1;


  	cx=28;
   	cy=20;

	cpc_PutSpXOR(pelota, 11, 3, cpc_GetScrAddress(cx,cy));

	cpc_ScanKeyboard();			//Reads whole keyboard. It's requiered in order to use cpc_TestKeyF
	while (!cpc_TestKeyF(4)) {	//cpc_TestKeyF is faster when more than 3 keys gonna be tested

			pause();

            if (cx >= MaxX)
            {
                HorzSpd = -HorzSpd;
                cx = MaxX;
            }
            else if (cx <= MinX)
            {
                HorzSpd = -HorzSpd;
                cx = MinX;
            }

            if (cy >= MaxY)
            {
                VertSpd = -VertSpd;
                cy = MaxY;
            }
            else if (cy <= MinY)
            {
                VertSpd = -VertSpd;
                cy = MinY;
            }



            cpc_PutSpXOR(pelota, 11, 3, cpc_GetScrAddress(cx,cy));
            cx += HorzSpd;
            cy += VertSpd;
			cpc_PutSpXOR(pelota, 11, 3, cpc_GetScrAddress(cx,cy));


		cpc_ScanKeyboard();
		if ((cpc_WyzTestPlayer()&8)==0) {	//test if bit 3 is 0 in order to allow another effect.
			// When a  1-4 key is pressed, a SFX is played
			if (cpc_TestKeyF(0)==1) 	cpc_WyzStartEffect(0,0);	//(Channel, SFX #)
			if (cpc_TestKeyF(1)==1) 	cpc_WyzStartEffect(1,1);
			if (cpc_TestKeyF(2)==1) 	cpc_WyzStartEffect(2,2);
			if (cpc_TestKeyF(3)==1) 	cpc_WyzStartEffect(1,3);
			if (cpc_TestKeyF(5)==1)	{
				if (tema>0) {
					tema--;
					nuevotema=1;
				}
			}
			if (cpc_TestKeyF(6)==1)	{
				if (tema<4) {
					tema++;
					nuevotema=1;
				}
			}
			if (nuevotema==1){
				cpc_WyzSetPlayerOff();
				cpc_PrintGphStrXYM1("NOW;PLAYING:",1,112);
				switch (tema) {
					case 0:
						cpc_WyzInitPlayer(SOUND_TABLE_0, RULE_TABLE_0, EFFECT_TABLE, SONG_TABLE_0);	//initialize data
						cpc_PrintGphStrXYM12X(texto09,1,120);
						cpc_PrintGphStrXYM12X(texto04,1,120);
						break;
					case 1:
						cpc_WyzInitPlayer(SOUND_TABLE_1, RULE_TABLE_1, EFFECT_TABLE, SONG_TABLE_1);		//initialize data
						cpc_PrintGphStrXYM12X(texto09,1,120);
						cpc_PrintGphStrXYM12X(texto05,1,120);
						break;
					case 2:
						cpc_WyzInitPlayer(SOUND_TABLE_2, RULE_TABLE_2, EFFECT_TABLE, SONG_TABLE_2);		//initialize data
						cpc_PrintGphStrXYM12X(texto09,1,120);
						cpc_PrintGphStrXYM12X(texto06,1,120);
						break;
					case 3:
						cpc_WyzInitPlayer(SOUND_TABLE_3, RULE_TABLE_3, EFFECT_TABLE, SONG_TABLE_3);		//initialize data
						cpc_PrintGphStrXYM12X(texto09,1,120);
						cpc_PrintGphStrXYM12X(texto07,1,120);
						break;
					case 4:
						cpc_WyzInitPlayer(SOUND_TABLE_4, RULE_TABLE_4, EFFECT_TABLE, SONG_TABLE_4);		//initialize data
						cpc_PrintGphStrXYM12X(texto09,1,120);
						cpc_PrintGphStrXYM12X(texto08,1,120);
						break;
				}
				cpc_WyzLoadSong(0);			//Select song to play
				cpc_WyzSetPlayerOn();		//start music and sound effects (SFX)
				nuevotema=0;


			   	MaxX=60;
			   	MaxY=110;
			   	MinX=0;
			   	MinY=5;
				VertSpd=1;
				HorzSpd=1;

				cpc_PutSpXOR(pelota, 11, 3, cpc_GetScrAddress(cx,cy));
				cx=28;
				cy=20;
				cpc_PutSpXOR(pelota, 11, 3, cpc_GetScrAddress(cx,cy));
			}
		}
	}
	//while(1);
	cpc_WyzSetPlayerOff();	//stop music and SFX
	cpc_EnableFirmware();
	return 0;

}




