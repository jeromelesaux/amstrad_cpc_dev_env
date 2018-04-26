;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW64)
; This file was generated Tue Sep 15 21:04:30 2015
;--------------------------------------------------------
	.module code
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _print_credits
	.globl _draw_tilemap
	.globl _collide
	.globl _pause
	.globl _set_colours
	.globl _initPointers
	.globl _data
	.globl _cpc_SuperbufferAddress
	.globl _cpc_PutMaskSpTileMap2b
	.globl _cpc_UpdScr
	.globl _cpc_PutSpTileMap
	.globl _cpc_ResetTouchedTiles
	.globl _cpc_ShowTileMap2
	.globl _cpc_ShowTileMap
	.globl _cpc_SetTile
	.globl _cpc_TestKey
	.globl _cpc_SetInkGphStr
	.globl _cpc_PrintGphStrXY
	.globl _cpc_CollSp
	.globl _cpc_DisableFirmware
	.globl _cpc_SetBorder
	.globl _cpc_SetInk
	.globl _cpc_SetColour
	.globl _cpc_SetModo
	.globl _p_sprites
	.globl _sprite02
	.globl _sprite01
	.globl _sprite00
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprite00::
	.ds 14
_sprite01::
	.ds 14
_sprite02::
	.ds 14
_p_sprites::
	.ds 14
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;code.c:25: void data(void)
;	---------------------------------
; Function data
; ---------------------------------
_data::
;code.c:80: __endasm;
	_buffer:
	.db #30
	_sp_1:
	.db #4,#16
	.db #0xFF,#0x00,#0x00,#0xCF,#0x00,#0xCF,#0xFF,#0x00
	.db #0xAA,#0x45,#0x00,#0x3C,#0x00,#0x3C,#0x55,#0x8A
	.db #0x00,#0x8A,#0x00,#0x55,#0x00,#0xAA,#0x00,#0x45
	.db #0x00,#0x8A,#0x00,#0x20,#0x00,#0x00,#0x00,#0x65
	.db #0x00,#0x28,#0x00,#0x55,#0x00,#0xAA,#0x00,#0x14
	.db #0x00,#0x7D,#0x00,#0xBE,#0x00,#0xFF,#0x00,#0xBE
	.db #0xAA,#0x14,#0x00,#0xFF,#0x00,#0xBE,#0x55,#0x28
	.db #0xAA,#0x00,#0x00,#0x3C,#0x00,#0x79,#0x55,#0x00
	.db #0x00,#0x51,#0x00,#0x51,#0x00,#0xA2,#0x55,#0xA2
	.db #0x00,#0xF3,#0x00,#0x10,#0x00,#0x20,#0x00,#0xF3
	.db #0x00,#0xF3,#0x00,#0x51,#0x00,#0xA2,#0x00,#0xF3
	.db #0x55,#0x28,#0x00,#0x0F,#0x00,#0x0F,#0xAA,#0x14
	.db #0xFF,#0x00,#0x55,#0x0A,#0xAA,#0x05,#0xFF,#0x00
	.db #0x55,#0x02,#0x55,#0x28,#0xAA,#0x14,#0xAA,#0x01
	.db #0x00,#0x03,#0x55,#0x02,#0xAA,#0x01,#0x00,#0x03
	.db #0xFF,#0x00,#0xFF,#0x00,#0xFF,#0x00,#0xFF,#0x00
	_sp_2:
	.db #4,#22
	.db #0xFF,#0x00,#0xFF,#0x00,#0xFF,#0x00,#0xFF,#0x00
	.db #0xFF,#0x00,#0x00,#0xCC,#0x00,#0xCC,#0xFF,#0x00
	.db #0xFF,#0x00,#0xAA,#0x44,#0x55,#0x88,#0xFF,#0x00
	.db #0xFF,#0x00,#0xAA,#0x44,#0x55,#0x88,#0xFF,#0x00
	.db #0xFF,#0x00,#0xAA,#0x44,#0x55,#0x88,#0xFF,#0x00
	.db #0xFF,#0x00,#0x00,#0xCF,#0x00,#0xCF,#0xFF,#0x00
	.db #0xAA,#0x45,#0x00,#0xCF,#0x00,#0xCF,#0x55,#0x8A
	.db #0xAA,#0x45,#0x00,#0xE5,#0x00,#0xDA,#0x55,#0x8A
	.db #0xAA,#0x45,#0x00,#0xCF,#0x00,#0xCF,#0x55,#0x8A
	.db #0xAA,#0x45,#0x00,#0xCF,#0x00,#0xCF,#0x55,#0x8A
	.db #0xAA,#0x45,#0x00,#0xCF,#0x00,#0xCF,#0x55,#0x8A
	.db #0xAA,#0x45,#0x00,#0xCF,#0x00,#0xCF,#0x55,#0x8A
	.db #0xFF,#0x00,#0x00,#0xCF,#0x00,#0xCF,#0xFF,#0x00
	.db #0xAA,#0x01,#0x00,#0x03,#0x00,#0x03,#0x55,#0x02
	.db #0x00,#0xA9,#0x00,#0x03,#0x00,#0x03,#0x00,#0x56
	.db #0x00,#0xA9,#0x00,#0x03,#0x00,#0x03,#0x00,#0x56
	.db #0xAA,#0x01,#0x00,#0x03,#0x00,#0x03,#0x55,#0x02
	.db #0xAA,#0x01,#0x00,#0x03,#0x00,#0x03,#0x55,#0x02
	.db #0xAA,#0x01,#0x00,#0x06,#0x00,#0x09,#0x55,#0x02
	.db #0xFF,#0x00,#0x00,#0x0C,#0x00,#0x0C,#0xFF,#0x00
	.db #0xFF,#0x00,#0x00,#0x0C,#0x00,#0x0C,#0xFF,#0x00
	.db #0xFF,#0x00,#0x00,#0x0C,#0x00,#0x0C,#0xFF,#0x00
	_tintas:
	.db #0,#13,#1,#6,#26,#24,#15,#8,#10,#22,#14,#3,#18,#4,#11,#25
	ret
;code.c:88: void initPointers()
;	---------------------------------
; Function initPointers
; ---------------------------------
_initPointers::
;code.c:91: p_sprites[0] = &sprite00;
	ld	hl,#_sprite00
	ld	(_p_sprites), hl
;code.c:92: p_sprites[1] = &sprite01;
	ld	hl,#_sprite01
	ld	((_p_sprites + 0x0002)), hl
;code.c:93: p_sprites[2] = &sprite02;
	ld	hl,#_sprite02
	ld	((_p_sprites + 0x0004)), hl
	ret
;code.c:97: void set_colours(void)
;	---------------------------------
; Function set_colours
; ---------------------------------
_set_colours::
;code.c:100: for (x=0; x<16; x++)
	ld	d,#0x00
00102$:
;code.c:102: cpc_SetInk(x,tintas[x]);
	ld	iy,#_tintas
	ld	c,d
	ld	b,#0x00
	add	iy, bc
	ld	h, 0 (iy)
	push	de
	push	hl
	inc	sp
	push	de
	inc	sp
	call	_cpc_SetInk
	pop	de
;code.c:100: for (x=0; x<16; x++)
	inc	d
	ld	a,d
	sub	a, #0x10
	jr	C,00102$
;code.c:104: cpc_SetBorder(0);
	ld	l,#0x00
	call	_cpc_SetBorder
	ret
;code.c:106: void pause(void)
;	---------------------------------
; Function pause
; ---------------------------------
_pause::
;code.c:113: __endasm;
	ld b,#80
	pause_loop:
	halt
	djnz pause_loop
	ret
;code.c:115: void collide(void)
;	---------------------------------
; Function collide
; ---------------------------------
_collide::
;code.c:117: cpc_SetColour(16,1);
	ld	hl,#0x0110
	push	hl
	call	_cpc_SetColour
;code.c:118: pause();
	call	_pause
;code.c:119: cpc_SetColour(16,9);
	ld	hl,#0x0910
	push	hl
	call	_cpc_SetColour
	ret
;code.c:122: void draw_tilemap(void)
;	---------------------------------
; Function draw_tilemap
; ---------------------------------
_draw_tilemap::
;code.c:129: for(x=0; x<32; x++)
	ld	d,#0x00
00105$:
;code.c:131: cpc_SetTile(x,y,1);
	push	de
	ld	hl,#0x0100
	push	hl
	push	de
	inc	sp
	call	_cpc_SetTile
	pop	af
	inc	sp
	pop	de
;code.c:129: for(x=0; x<32; x++)
	inc	d
	ld	a,d
	sub	a, #0x20
	jr	C,00105$
;code.c:133: for(y=1; y<15; y++)
	ld	d,#0x01
;code.c:135: for (x=0; x<32; x++)
00117$:
	ld	e,#0x00
00107$:
;code.c:137: cpc_SetTile(x,y,0);
	push	de
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpc_SetTile
	pop	af
	inc	sp
	pop	de
;code.c:135: for (x=0; x<32; x++)
	inc	e
	ld	a,e
	sub	a, #0x20
	jr	C,00107$
;code.c:133: for(y=1; y<15; y++)
	inc	d
	ld	a,d
	sub	a, #0x0F
	jr	C,00117$
;code.c:141: for (x=0; x<32; x++)
	ld	d,#0x00
00111$:
;code.c:143: cpc_SetTile(x,y,2);
	push	de
	ld	hl,#0x020F
	push	hl
	push	de
	inc	sp
	call	_cpc_SetTile
	pop	af
	inc	sp
	pop	de
;code.c:141: for (x=0; x<32; x++)
	inc	d
	ld	a,d
	sub	a, #0x20
	jr	C,00111$
	ret
;code.c:147: void print_credits(void)
;	---------------------------------
; Function print_credits
; ---------------------------------
_print_credits::
;code.c:149: cpc_PrintGphStrXY("SMALL;SPRITE;DEMO",9*2+3,20*8);
	ld	de,#___str_0
	ld	hl,#0xA015
	push	hl
	push	de
	call	_cpc_PrintGphStrXY
;code.c:150: cpc_PrintGphStrXY("SDCC;;;CPCRSLIB",10*2+3,21*8);
	ld	de,#___str_1
	ld	hl,#0xA817
	push	hl
	push	de
	call	_cpc_PrintGphStrXY
;code.c:151: cpc_PrintGphStrXY("BY;ARTABURU;2015",10*2+2,22*8);
	ld	de,#___str_2
	ld	hl,#0xB016
	push	hl
	push	de
	call	_cpc_PrintGphStrXY
;code.c:152: cpc_PrintGphStrXY("ESPSOFT<AMSTRAD<ES",10*2+3-3,24*8);
	ld	de,#___str_3
	ld	hl,#0xC014
	push	hl
	push	de
	call	_cpc_PrintGphStrXY
	ret
___str_0:
	.ascii "SMALL;SPRITE;DEMO"
	.db 0x00
___str_1:
	.ascii "SDCC;;;CPCRSLIB"
	.db 0x00
___str_2:
	.ascii "BY;ARTABURU;2015"
	.db 0x00
___str_3:
	.ascii "ESPSOFT<AMSTRAD<ES"
	.db 0x00
;code.c:155: main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;code.c:159: initPointers();
	call	_initPointers
;code.c:162: set_colours();
	call	_set_colours
;code.c:163: cpc_SetInkGphStr(0,0);
	ld	hl,#0x0000
	push	hl
	call	_cpc_SetInkGphStr
;code.c:164: cpc_SetModo(0);
	ld	l,#0x00
	call	_cpc_SetModo
;code.c:166: cpc_DisableFirmware();
	call	_cpc_DisableFirmware
;code.c:168: sprite00.sp1=sp_1;
	ld	hl,#_sp_1
	ld	((_sprite00 + 0x0002)), hl
;code.c:169: sprite00.sp0=sp_1;
	ld	(_sprite00), hl
;code.c:170: sprite00.ox=50;
	ld	hl,#_sprite00 + 10
	ld	(hl),#0x32
;code.c:171: sprite00.oy=70;
	ld	hl,#_sprite00 + 11
	ld	(hl),#0x46
;code.c:172: sprite00.cx=50;
	ld	hl,#(_sprite00 + 0x0008)
	ld	(hl),#0x32
;code.c:173: sprite00.cy=70;
	ld	hl,#(_sprite00 + 0x0009)
	ld	(hl),#0x46
;code.c:174: sprite00.move1=3;
	ld	hl,#(_sprite00 + 0x000c)
	ld	(hl),#0x03
;code.c:175: cpc_SuperbufferAddress(p_sprites[0]); //first time it's important to do this
	ld	hl, #_p_sprites + 0
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	pop	hl
	push	hl
	push	hl
	call	_cpc_SuperbufferAddress
	pop	af
;code.c:177: sprite01.sp1=sp_2;
	ld	hl,#_sp_2
	ld	((_sprite01 + 0x0002)), hl
;code.c:178: sprite01.sp0=sp_2;
	ld	(_sprite01), hl
;code.c:179: sprite01.ox=50;
	ld	hl,#(_sprite01 + 0x000a)
	ld	(hl),#0x32
;code.c:180: sprite01.oy=106;
	ld	hl,#(_sprite01 + 0x000b)
	ld	(hl),#0x6A
;code.c:181: sprite01.cx=50;
	ld	hl,#(_sprite01 + 0x0008)
	ld	(hl),#0x32
;code.c:182: sprite01.cy=106;
	ld	hl,#(_sprite01 + 0x0009)
	ld	(hl),#0x6A
;code.c:183: sprite01.move=1;
	ld	hl,#(_sprite01 + 0x000d)
	ld	(hl),#0x01
;code.c:184: sprite01.move1=3;
	ld	hl,#(_sprite01 + 0x000c)
	ld	(hl),#0x03
;code.c:185: cpc_SuperbufferAddress(p_sprites[1]);
	ld	hl, #(_p_sprites + 0x0002) + 0
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	pop	hl
	push	hl
	push	hl
	call	_cpc_SuperbufferAddress
	pop	af
;code.c:187: sprite02.sp1=sp_2;
	ld	hl,#_sp_2
	ld	((_sprite02 + 0x0002)), hl
;code.c:188: sprite02.sp0=sp_2;
	ld	(_sprite02), hl
;code.c:189: sprite02.ox=20;
	ld	hl,#_sprite02 + 10
	ld	(hl),#0x14
;code.c:190: sprite02.oy=100;
	ld	hl,#_sprite02 + 11
	ld	(hl),#0x64
;code.c:191: sprite02.cx=20;
	ld	hl,#_sprite02 + 8
	ld	(hl),#0x14
;code.c:192: sprite02.cy=100;
	ld	hl,#(_sprite02 + 0x0009)
	ld	(hl),#0x64
;code.c:193: sprite02.move=2;
	ld	hl,#(_sprite02 + 0x000d)
	ld	(hl),#0x02
;code.c:194: sprite02.move1=3;
	ld	hl,#_sprite02 + 12
	ld	(hl),#0x03
;code.c:195: cpc_SuperbufferAddress(p_sprites[2]);
	ld	hl, #(_p_sprites + 0x0004) + 0
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	pop	hl
	push	hl
	push	hl
	call	_cpc_SuperbufferAddress
	pop	af
;code.c:200: draw_tilemap();
	call	_draw_tilemap
;code.c:201: cpc_ShowTileMap();		//Show entire tile map in the screen
	call	_cpc_ShowTileMap
;code.c:202: print_credits();
	call	_print_credits
;code.c:203: cpc_SetTile(0,1,2);
	ld	hl,#0x0201
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_cpc_SetTile
	pop	af
	inc	sp
;code.c:210: cpc_ShowTileMap();		//Show entire tile map in the screen
	call	_cpc_ShowTileMap
;code.c:211: while(1)
00138$:
;code.c:223: if (cpc_TestKey(0)==1 && sprite00.cx<60) sprite00.cx++;
	ld	l,#0x00
	call	_cpc_TestKey
	dec	l
	jr	NZ,00102$
	ld	hl, #(_sprite00 + 0x0008) + 0
	ld	d,(hl)
	ld	a,d
	sub	a, #0x3C
	jr	NC,00102$
	inc	d
	ld	hl,#(_sprite00 + 0x0008)
	ld	(hl),d
00102$:
;code.c:224: if (cpc_TestKey(1)==1 && sprite00.cx>0) sprite00.cx--;
	ld	l,#0x01
	call	_cpc_TestKey
	dec	l
	jr	NZ,00105$
;code.c:223: if (cpc_TestKey(0)==1 && sprite00.cx<60) sprite00.cx++;
	ld	a, (#(_sprite00 + 0x0008) + 0)
;code.c:224: if (cpc_TestKey(1)==1 && sprite00.cx>0) sprite00.cx--;
	or	a, a
	jr	Z,00105$
	add	a,#0xFF
	ld	hl,#(_sprite00 + 0x0008)
	ld	(hl),a
00105$:
;code.c:225: if (cpc_TestKey(2)==1 && sprite00.cy>0) sprite00.cy-=2;
	ld	l,#0x02
	call	_cpc_TestKey
	dec	l
	jr	NZ,00108$
	ld	a, (#(_sprite00 + 0x0009) + 0)
	or	a, a
	jr	Z,00108$
	add	a,#0xFE
	ld	hl,#(_sprite00 + 0x0009)
	ld	(hl),a
00108$:
;code.c:226: if (cpc_TestKey(3)==1 && sprite00.cy<112) sprite00.cy+=2;
	ld	l,#0x03
	call	_cpc_TestKey
	dec	l
	jr	NZ,00111$
;code.c:225: if (cpc_TestKey(2)==1 && sprite00.cy>0) sprite00.cy-=2;
	ld	hl, #(_sprite00 + 0x0009) + 0
	ld	d,(hl)
;code.c:226: if (cpc_TestKey(3)==1 && sprite00.cy<112) sprite00.cy+=2;
	ld	a,d
	sub	a, #0x70
	jr	NC,00111$
	inc	d
	inc	d
	ld	hl,#(_sprite00 + 0x0009)
	ld	(hl),d
00111$:
;code.c:230: if (sprite01.move==0)   //0 = left, 1 = right
	ld	hl, #(_sprite01 + 0x000d) + 0
	ld	a,(hl)
	ld	-2 (ix), a
	or	a, a
	jr	NZ,00117$
;code.c:232: if (sprite01.cx>0) sprite01.cx--;
	ld	a,(#(_sprite01 + 0x0008) + 0)
	ld	-2 (ix), a
	or	a, a
	jr	Z,00114$
	ld	d,-2 (ix)
	dec	d
	ld	hl,#(_sprite01 + 0x0008)
	ld	(hl),d
	jr	00117$
00114$:
;code.c:233: else sprite01.move=1;
	ld	hl,#(_sprite01 + 0x000d)
	ld	(hl),#0x01
00117$:
;code.c:235: if (sprite01.move==1)   //0 = left, 1 = right
	ld	a, (#(_sprite01 + 0x000d) + 0)
	dec	a
	jr	NZ,00122$
;code.c:232: if (sprite01.cx>0) sprite01.cx--;
	ld	hl, #(_sprite01 + 0x0008) + 0
	ld	d,(hl)
;code.c:237: if (sprite01.cx<60) sprite01.cx++;
	ld	a,d
	sub	a, #0x3C
	jr	NC,00119$
	inc	d
	ld	hl,#(_sprite01 + 0x0008)
	ld	(hl),d
	jr	00122$
00119$:
;code.c:238: else sprite01.move=0;
	ld	hl,#(_sprite01 + 0x000d)
	ld	(hl),#0x00
00122$:
;code.c:241: if (sprite02.move==2)   //2 = up, 3 = down
	ld	a, (#(_sprite02 + 0x000d) + 0)
	sub	a, #0x02
	jr	NZ,00127$
;code.c:243: if (sprite02.cy>0) sprite02.cy-=2;
	ld	a, (#(_sprite02 + 0x0009) + 0)
	or	a, a
	jr	Z,00124$
	add	a,#0xFE
	ld	hl,#(_sprite02 + 0x0009)
	ld	(hl),a
	jr	00127$
00124$:
;code.c:244: else sprite02.move=3;
	ld	hl,#(_sprite02 + 0x000d)
	ld	(hl),#0x03
00127$:
;code.c:246: if (sprite02.move==3)    //2 = up, 3 = down
	ld	a, (#(_sprite02 + 0x000d) + 0)
	sub	a, #0x03
	jr	NZ,00132$
;code.c:243: if (sprite02.cy>0) sprite02.cy-=2;
	ld	hl, #(_sprite02 + 0x0009) + 0
	ld	d,(hl)
;code.c:248: if (sprite02.cy<106) sprite02.cy+=2;
	ld	a,d
	sub	a, #0x6A
	jr	NC,00129$
	inc	d
	inc	d
	ld	hl,#(_sprite02 + 0x0009)
	ld	(hl),d
	jr	00132$
00129$:
;code.c:249: else sprite02.move=2;
	ld	hl,#(_sprite02 + 0x000d)
	ld	(hl),#0x02
00132$:
;code.c:253: cpc_ResetTouchedTiles();		//clear touched tile table
	call	_cpc_ResetTouchedTiles
;code.c:258: cpc_PutSpTileMap(p_sprites[0]);		//search the tiles where is and was the sprite
	ld	hl, (#_p_sprites + 0)
	call	_cpc_PutSpTileMap
;code.c:259: cpc_PutSpTileMap(p_sprites[1]);
	ld	hl, (#(_p_sprites + 0x0002) + 0)
	call	_cpc_PutSpTileMap
;code.c:260: cpc_PutSpTileMap(p_sprites[2]);
	ld	hl, (#(_p_sprites + 0x0004) + 0)
	call	_cpc_PutSpTileMap
;code.c:263: cpc_UpdScr(); 					//Update the screen to new situatio (show the touched tiles)
	call	_cpc_UpdScr
;code.c:266: cpc_PutMaskSpTileMap2b(p_sprites[0]);	//Requires to move sprite with cpc_SpUpdX or cpc_SpUpdY
	ld	hl, (#_p_sprites + 0)
	call	_cpc_PutMaskSpTileMap2b
;code.c:267: cpc_PutMaskSpTileMap2b(p_sprites[1]);
	ld	hl, (#(_p_sprites + 0x0002) + 0)
	call	_cpc_PutMaskSpTileMap2b
;code.c:268: cpc_PutMaskSpTileMap2b(p_sprites[2]);
	ld	hl, (#(_p_sprites + 0x0004) + 0)
	call	_cpc_PutMaskSpTileMap2b
;code.c:270: cpc_ShowTileMap2();			//Show the touched tiles-> show the new sprite situatuion
	call	_cpc_ShowTileMap2
;code.c:274: if (cpc_CollSp(p_sprites[0],p_sprites[1])) collide();  //test if there is collision between sprite00 and sprite01
	ld	de, (#(_p_sprites + 0x0002) + 0)
	ld	hl, (#_p_sprites + 0)
	push	de
	push	hl
	call	_cpc_CollSp
	ld	a,l
	or	a, a
	jr	Z,00134$
	call	_collide
00134$:
;code.c:275: if (cpc_CollSp(p_sprites[0],p_sprites[2])) collide();
	ld	de, (#(_p_sprites + 0x0004) + 0)
	ld	hl, (#_p_sprites + 0)
	push	de
	push	hl
	call	_cpc_CollSp
	ld	a,l
	or	a, a
	jp	Z,00138$
	call	_collide
	jp	00138$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
