#include "cpcrslib.h"
#include "datos.h"
#include "estructuras.h"
#include "scroll_engine.h"

const int ANCHO_PANTALLA_SC = 900;
extern const unsigned char sp_1[];	//masked sprite data
extern const unsigned char sp_2[];	//masked sprite data
extern const unsigned char tintas[];	//inks
extern unsigned char buffer[];	//inks

const unsigned char TILES_ANCHO_TOT = 240;


int pointerH=0;


// Para el control del scroll:
unsigned char sc;
unsigned char d;		// para ver si el sprite controlado por el usuario sigue la misma direcci�n o ha habido cambio
unsigned char e, f;		// para controlar si el scroll cambia de direcci�n
unsigned char vs1, vs2; // Controlan si habr� scroll total o medio

unsigned int col,colMax;		// Columna izquierda actual del scroll


void *p_nave;
//void *p_enemigo[3];
void *p_sprite[10];
void *p_disparo[10];
//void *p_edisparo[10];

unsigned char pilaEnemigos[60]; //[4*MAX_PILA_ENEMIGOS];
unsigned char nPila;

void *p_sprites[7];


void initPointers()
{

    p_sprites[0] = &sprite00;
    p_sprites[1] = &sprite01;
    p_sprites[2] = &sprite02;

}

void setScreen(void)
{
    __asm

    ld hl,#registros
    xor a
buc_reg:
    ld b,#0xbc
    ld c,a
    out (c),c
    ld b,#0xbd
    ld c,(hl)
    out (c),c
    inc hl
    inc a
    cp #16
    jr nz,buc_reg
    ret

registros:
    .db #0x3f,#0x20,#0x2b,#0x8e,#0x26,#0x04,#0x14,#0x1d,#0x00,#0x07,#0x00,#0x00,#0x30,#0x00,#0x00,#0x00
    __endasm;

}

void ScrClr(void)
{
    __asm

    ld hl,#0xc000
    ld de,#0xc001
    ld bc,#0x3fff
    xor a
    ld (hl),a
    ldir
    __endasm;
}
void set_colours(void)
{
    unsigned char i;
    for (i=0; i<17; i++)
        cpc_SetColour(i,paleta[i]);
}

void pause(void)
{
    __asm
    ld b,#80
pause_loop:
    halt
    djnz pause_loop
    __endasm;
}
void collide(void)
{
    cpc_SetColour(16,1);
    pause();
    cpc_SetColour(16,9);
}


void draw_bloque(unsigned char x, unsigned char y, unsigned char b)
{
    unsigned char tx, ty;
    int tb;
    tx = 2*x;
    ty = 2*y;
    tb = b*4;

    cpc_SetTile(tx,ty,bloques[tb]);
    cpc_SetTile(tx+1,ty,bloques[tb+1]);
    cpc_SetTile(tx,ty+1,bloques[tb+2]);
    cpc_SetTile(tx+1,ty+1,bloques[tb+3]);
}



void draw_tilemap(void)
{
    unsigned char x,y;
    unsigned char t;
    int tt;
    for(y=0; y<7; y++)
    {
        for(x=0; x<14; x++)
        {
            tt=TILES_ANCHO_TOT*y+x;
            t=test_map2[tt];
            draw_bloque(x,y,t);
        }
    }

}



void print_credits(void)
{

    cpc_PrintGphStrXY("SMALL;SCROLL;SPRITE;DEMO",7*2+2,20*8);
    cpc_PrintGphStrXY("SDCC;;;CPCRSLIB",12*2+1,21*8);
    cpc_PrintGphStrXY("BY;ARTABURU;2015",12*2+1-1,22*8);
    cpc_PrintGphStrXY("ESPSOFT<AMSTRAD<ES",12*2+1-3,24*8);
	
}





void actualizaPantalla(void)
{
    unsigned char i,o;

	cpc_ResetTouchedTiles();
    switch (sc)
    {
    case 0:		
		// NO SCROLL THIS TIME
        

        cpc_PutSpTileMap(p_nave);
        if (sprite00.visible==1 || sprite00.visible==2) cpc_PutSpTileMap(p_sprites[0]);
        if (sprite01.visible==1 || sprite01.visible==2) cpc_PutSpTileMap(p_sprites[1]);

        cpc_UpdScr();							// restaura los tiles actualizados

     /*  cpc_PutMaskSpTileMap2b(p_nave);// Ahora se dibuja el sprite
        if (sprite00.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[0]);
        if (sprite01.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[1]);
		
        cpc_ShowTileMap2(); */

        break;

    case 1:
        // SCROLL TILE MAP 1: 	PSEUDO SCROLL --> SCREEN START POSITION -1
        cpc_ScrollLeft00();		


        // SPRITE PRINTING:
        
        cpc_PutSpTileMap(p_nave); // Para actualizar los tiles q toca el sprite
        if (sprite00.visible==1 || sprite00.visible==2) cpc_PutSpTileMap(p_sprites[0]);
        if (sprite01.visible==1 || sprite01.visible==2) cpc_PutSpTileMap(p_sprites[1]);

        cpc_UpdScr();							// restaura los tiles actualizados
		
     /*   cpc_PutMaskSpTileMap2b(p_nave);// Ahora se dibuja el sprite
        if (sprite00.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[0]);
        if (sprite01.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[1]);

        cpc_ShowTileMap2(); */



        // SCROLL CONTROL PARAMETERS:
        vs1=1;
        e=1;
        f=0;
        break;


    case 2:
        // SCROLL TILE MAP 1: 	PSEUDO SCROLL --> SCREEN START POSITION +1
        cpc_ScrollRight00();


        // SPRITE PRINTING:
        
		
        cpc_PutSpTileMap(p_nave); // Para actualizar los tiles q toca el sprite
        if (sprite00.visible==1 || sprite00.visible==2) cpc_PutSpTileMap(p_sprites[0]);
        if (sprite01.visible==1 || sprite01.visible==2) cpc_PutSpTileMap(p_sprites[1]);

        cpc_UpdScr();							// restaura los tiles actualizados
		
      /*  cpc_PutMaskSpTileMap2b(p_nave);// Ahora se dibuja el sprite
        if (sprite00.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[0]);
        if (sprite01.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[1]);
		
        cpc_ShowTileMap2(); */



        // SCROLL CONTROL PARAMETERS:
        vs1=2;
        f=1;
        e=0;

        break;
    case 3:											// si ha habido scroll hacia la izquierda
		// 1. CLEAR ALL THE SPRITES IN THE SCREEN
        
        
		if (sprite00.visible==1 || sprite00.visible==2) cpc_PutSpTileMap(p_sprites[0]);
        if (sprite01.visible==1 || sprite01.visible==2) cpc_PutSpTileMap(p_sprites[1]);
		
		cpc_PutSpTileMap(p_nave); // Para actualizar los tiles q toca el sprite
		
        cpc_UpdScr();
        
		// 2. UPDATE COORDINATES OF THE SPRITES IN THE SCREEN
		
		if (sprite00.visible==1)
        {
            sprite00.cx-=2;
            sprite00.ox-=2;
        }
        if (sprite01.visible==1)
        {
            sprite01.cx-=2;
            sprite01.ox-=2;
        }


        // SCROLL TILE MAP AND SCREEN START POSITION:
        cpc_ScrollLeft01();						// scroll area tiles

        // SPRITE UPDATING:
        nave.cx-=2;
        nave.ox-=2;




        // SPRITE PRINTING:
     //   cpc_ResetTouchedTiles();
        

        drawColumnD();							// actualiza area tiles nueva columna
     //   cpc_UpdScr();							// restaura los tiles actualizados
        cpc_PutMaskSpTileMap2b(p_nave);// Ahora se dibuja el sprite
     /*   if (sprite00.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[0]);
        if (sprite01.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[1]);
        cpc_ShowTileMap2(); */

        // SCROLL CONTROL PARAMETERS:
        vs1=3;
        e=0;
        col+=2;
        if (colMax<col) colMax=col;


        break;
    case 4:											// si ha habido scroll hacia la izquierda
        // SCROLL TILE MAP AND SCREEN START POSITION:
        
        
		if (sprite00.visible==1 || sprite00.visible==2) cpc_PutSpTileMap(p_sprites[0]);
        if (sprite01.visible==1 || sprite01.visible==2) cpc_PutSpTileMap(p_sprites[1]);
		cpc_PutSpTileMap(p_nave); // Para actualizar los tiles q toca el sprite
		
        cpc_UpdScr();
		
        if (sprite00.visible==1)
        {

            sprite00.cx+=2;
            sprite00.ox+=2;
        }
        if (sprite01.visible==1)
        {

            sprite01.cx+=2;
            sprite01.ox+=2;
        }

        cpc_ScrollRight01();						// scroll area tiles

        // SPRITE UPDATING:
        nave.cx+=2;
        nave.ox+=2;


        // SPRITE PRINTING:
      //  cpc_ResetTouchedTiles();
        

        drawColumnI();							// actualiza area tiles nueva columna
       // cpc_UpdScr();							// restaura los tiles actualizados

	   /* cpc_PutMaskSpTileMap2b(p_nave);// Ahora se dibuja el sprite
        if (sprite00.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[0]);
        if (sprite01.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[1]);
        cpc_ShowTileMap2();
		*/
        // SCROLL CONTROL PARAMETERS:
        vs1=4;
        f=0;
        col-=2;
        break;

    }
	
	    cpc_PutMaskSpTileMap2b(p_nave);// Ahora se dibuja el sprite
        if (sprite00.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[0]);
        if (sprite01.visible==1)cpc_PutMaskSpTileMap2b(p_sprites[1]);
        cpc_ShowTileMap2();
	
	
	
	
    if (sprite00.visible==2) {
        sprite00.visible=3;
        //sprite00.cx=0;
       // sprite00.ox=sprite00.cx;

        }
    if (sprite01.visible==2) {
        sprite01.visible=3;
        //sprite00.cx=0;
       // sprite00.ox=sprite00.cx;

        }

}

// viaible
// 0: no se restaura ni se dibuja el sprite
// 1: se dibuja y se restaura el sprite
// 2: se restaura pero no se dibuja. El siguiente paso es visible = 3
// 3: no se restaura ni se dibuja el sprite.


void act_visible(void)              // dependiendo del scroll y de la posici�n del sprite, se activa o desactiva
{
    char vpointerH;

        sprite00.cx=sprite00.vx-2*pointerH;
        sprite01.cx=sprite01.vx-2*pointerH;

        switch (sc)
        {
            case 3:
                if (sprite00.cx>2 && sprite00.cx<50) sprite00.visible = 1; else
                    {
                        if (sprite00.visible==1)
                        {
                            sprite00.visible = 2;
                        }

                    }
                if (sprite01.cx>2 && sprite01.cx<50) sprite01.visible = 1; else
                    {
                        if (sprite01.visible==1)
                        {
                            sprite01.visible = 2;
                        }

                    }
                break;
            case 4:
                if (sprite00.cx>0 && sprite00.cx<48) sprite00.visible = 1; else
                    {
                        if (sprite00.visible==1)
                        {
                            sprite00.visible = 2;
                        }

                    }
                if (sprite01.cx>2 && sprite01.cx<48) sprite01.visible = 1; else
                    {
                        if (sprite01.visible==1)
                        {
                            sprite01.visible = 2;
                        }

                    }
                break;
            default:
                if (sprite00.cx>0 && sprite00.cx<50) sprite00.visible = 1; else
                {
                    if (sprite00.visible==1)
                    {
                        sprite00.visible = 2;
                    }
                }
                if (sprite01.cx>0 && sprite01.cx<50) sprite01.visible = 1; else
                    {
                        if (sprite01.visible==1)
                        {
                            sprite01.visible = 2;
                        }

                    }
                break;

        }

}


main()
{
    unsigned char a;
    unsigned char i,j,z,tt,rt,o;
    unsigned char tmp2 = 0;
    unsigned char tmp = 0;
    unsigned char gravedad = 1;
    unsigned char psalto = 0;
    unsigned char suelo=0;
    unsigned char enEscalera=0;


    cpc_DisableFirmware();

    cpc_SetMode(0);
    ScrClr();
    //setScreen();
    initPointers();
	
    cpc_SetInkGphStr(0,0);
    cpc_SetInkGphStr(1,2);
    cpc_SetInkGphStr(2,8);
    cpc_SetInkGphStr(3,42);
	
    d=0;
    vs1=0;
    vs2=0;
    e=0;
    f=0;
    rt=0;
    col=0;
    colMax=0;
    //while(1){}
    p_nave=&nave;
    p_sprites[0] = &sprite00;
    p_sprites[1] = &sprite01;
    //Drawing the tile map
    draw_tilemap();

    print_credits();


	
	
    cpc_ShowTileMap();		//Show entire tile map in the screen
    cpc_ShowTileMap2();
    set_colours();

    // Definiendo los protas del juego
    nave.sp1=prota;
    nave.sp0=prota;
    nave.ox=12;
    nave.oy=87;
    nave.cx=12;
    nave.cy=87;
    nave.visible=3;
    nave.move=0;
    nave.posicion=0;
    nave.modo=0;


    sprite00.sp1=spnave;
    sprite00.sp0=spnave;
    sprite00.ox=20;
    sprite00.oy=40;
    sprite00.cx=20;
    sprite00.cy=40;

    sprite00.move=0;
    sprite00.posicion=0;
    sprite00.visible=0;
    sprite00.vx=20;
    sprite00.tipo=3;
    sprite00.frame=0;
    sprite00.num=1; // num=0 mosca, num=1 rat�n
    sprite00.dir=0;

    sprite01.sp1=spnave;
    sprite01.sp0=spnave;
    sprite01.ox=20;
    sprite01.oy=45;
    sprite01.cx=20;
    sprite01.cy=45;

    sprite01.move=0;
    sprite01.posicion=0;
    sprite01.visible=0;
    sprite01.vx=120;
    sprite01.tipo=3;
    sprite01.frame=0;
    sprite01.num=1; // num=0 mosca, num=1 rat�n
    sprite01.dir=0;



    while(1)
    {

        //Default number keys for moving one of the sprites:
        // 0: cursor right
        // 1: cursor left




        sc=0;


        if (cpc_TestKey(0)==1 && nave.cx<=40)   // DERECHA
        {
            nave.cx++;
            nave.move =0;

            if (rt==1)
            {
                nave.sp0 = prota;
             }
            else
            {
                nave.sp0 = prota0;
             }

            rt = !rt;

            if (col<ANCHO_PANTALLA_SC)
            {
                {
                    if (nave.cx>=(40+e))  // se comprueba para ver si hay que hacer scroll al cambiar la direcci�n
                    {
                        vs2=1;
                        sc=1;				// SCROLL (<-)
                    }
                }
            }
        }
        if (cpc_TestKey(1)==1 && nave.cx>0)   // IZQUIERDA
        {
            nave.cx--;
            nave.move =1;

            if (rt==1)
            {
                nave.sp0 = protai;
            }
            else
            {
                nave.sp0 = protai0;
            }
            rt = !rt;

            //if (col>1 && (colMax-col)<10)
            if (col>4 )
            {
                {
                    if (nave.cx<=(10-f))  // se comprueba para ver si hay que hacer scroll al cambiar la direcci�n
                    {
                        vs2=2;
                        sc=1;				// SCROLL (->)
                    }
                }
            }
        }




        if (sc!=0)  	// Tipo de scroll que se realizar� (medio=solo se cambia el punto de lectura de pantalla o total=cambio de coordenadas)
        {

                if (vs1==1 && vs2==1) sc=3;  // scroll
                if (vs1==1 && vs2==2) sc=2;  // 1/2 scroll

                if (vs1==2 && vs2==2) sc=4;  // scroll
                if (vs1==2 && vs2==1) sc=1;  // 1/2 scroll

                if (vs1==3 && vs2==2) sc=4;  // scroll
                if (vs1==3 && vs2==1) sc=1;  // 1/2 scroll

                if (vs1==4 && vs2==1) sc=3;  // scroll
                if (vs1==4 && vs2==2) sc=2;  // 1/2 scroll

       }


        // The other sprites are automatically moved
        if (sprite00.move==0)   //0 = left, 1 = right
        {
            if (sprite00.vx>0) sprite00.vx--;
            else sprite00.move=1;
        } else {
            if (sprite00.move==1)   //0 = left, 1 = right
            {
                if (sprite00.vx<90) sprite00.vx++;
                else sprite00.move=0;
            }
        }


        if (sprite01.move==0)   //0 = left, 1 = right
        {
            if (sprite01.vx>100) sprite01.vx--;
            else sprite01.move=1;
        } else {
            if (sprite01.move==1)   //0 = left, 1 = right
            {
                if (sprite01.vx<220) sprite01.vx++;
                else sprite01.move=0;
            }
        }




       // sprite00.visible = 1;

/*        if (sprite02.move==2)   //2 = up, 3 = down
        {
            if (sprite02.cy>0) sprite02.cy-=2;
            else sprite02.move=3;
        }
        if (sprite02.move==3)    //2 = up, 3 = down
        {
            if (sprite02.cy<106) sprite02.cy+=2;
            else sprite02.move=2;
        }
*/
        act_visible();
        actualizaPantalla();
    }
}




