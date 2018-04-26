;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW64)
; This file was generated Tue Sep 15 21:15:58 2015
;--------------------------------------------------------
	.module code
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _data
	.globl _cpc_AnyKeyPressed
	.globl _cpc_PrintGphStrXYM1
	.globl _cpc_GetSp
	.globl _cpc_PutSpXOR
	.globl _cpc_PutSp
	.globl _cpc_GetScrAddress
	.globl _cpc_SetModo
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;code.c:5: void data(void){
;	---------------------------------
; Function data
; ---------------------------------
_data::
;code.c:32: __endasm;
	_sprite:
	.db #0x00,#0x60,#0x00
	.db #0x00,#0xF0,#0x00
	.db #0x10,#0xD0,#0xC0
	.db #0x10,#0xF0,#0xE0
	.db #0x10,#0xF0,#0xE0
	.db #0x22,#0xE4,#0xC0
	.db #0x33,#0x66,#0x00
	.db #0x33,#0x77,#0x00
	.db #0x33,#0x77,#0x00
	.db #0x33,#0xCC,#0x00
	.db #0x11,#0xEE,#0x00
	.db #0x00,#0xFF,#0x00
	.db #0x1F,#0x33,#0x00
	.db #0x0D,#0x03,#0x0E
	.db #0x0E,#0x0B,#0x0D
	.db #0x05,#0x09,#0x0A
	_buffer:
	.db #0,#0,#0,#0,#0,#0,#0,#0
	.db #0,#0,#0,#0,#0,#0,#0,#0
	.db #0,#0,#0,#0,#0,#0,#0,#0
	.db #0,#0,#0,#0,#0,#0,#0,#0
	.db #0,#0,#0,#0,#0,#0,#0,#0
	.db #0,#0,#0,#0,#0,#0,#0,#0
	ret
;code.c:36: main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-48
	add	hl,sp
	ld	sp,hl
;code.c:38: cpc_SetModo(1); //rutina hardware, se restaura la situación anterior al terminar la ejecución del programa
	ld	l,#0x01
	call	_cpc_SetModo
;code.c:40: cpc_PrintGphStrXYM1("1;PUTS;A;SPRITE;IN;THE;SCREEN",0,8*23);
	ld	de,#___str_0
	ld	hl,#0xB800
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:41: cpc_PrintGphStrXYM1("PRESS;ANY;KEY",0,8*24);
	ld	de,#___str_1
	ld	hl,#0xC000
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:42: while (!cpc_AnyKeyPressed()){}
00101$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00101$
;code.c:43: cpc_PutSp(sprite,16,3,0xc19b);
	ld	de,#_sprite
	ld	hl,#0xC19B
	push	hl
	ld	hl,#0x0310
	push	hl
	push	de
	call	_cpc_PutSp
;code.c:45: cpc_PrintGphStrXYM1("2;CAPTURES;A;SCREEN;AREA;;;;;",0,8*23);
	ld	de,#___str_2
	ld	hl,#0xB800
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:46: cpc_PrintGphStrXYM1("PRESS;ANY;KEY",0,8*24);
	ld	de,#___str_1
	ld	hl,#0xC000
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:47: while (!cpc_AnyKeyPressed()){}
00104$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00104$
;code.c:48: cpc_GetSp(buffer,16,3,0xc19c);
	ld	hl,#0x0000
	add	hl,sp
	ex	de,hl
	ld	c, e
	ld	b, d
	push	de
	ld	hl,#0xC19C
	push	hl
	ld	hl,#0x0310
	push	hl
	push	bc
	call	_cpc_GetSp
	pop	de
;code.c:49: cpc_PrintGphStrXYM1("3;PRINTS;CAPTURED;AREA",0,8*23);
	ld	bc,#___str_3
	push	de
	ld	hl,#0xB800
	push	hl
	push	bc
	call	_cpc_PrintGphStrXYM1
	pop	de
;code.c:50: cpc_PrintGphStrXYM1("PRESS;ANY;KEY",0,8*24);
	ld	bc,#___str_1
	push	de
	ld	hl,#0xC000
	push	hl
	push	bc
	call	_cpc_PrintGphStrXYM1
	pop	de
;code.c:51: while (!cpc_AnyKeyPressed()){}
00107$:
	push	de
	call	_cpc_AnyKeyPressed
	pop	de
	ld	a,h
	or	a,l
	jr	Z,00107$
;code.c:53: cpc_PutSp(buffer,16,3,0xc19f);
	ld	hl,#0xC19F
	push	hl
	ld	hl,#0x0310
	push	hl
	push	de
	call	_cpc_PutSp
;code.c:55: cpc_PrintGphStrXYM1("4;PUTS;A SPRITE;IN;XOR;MODE",0,8*23);
	ld	de,#___str_4
	ld	hl,#0xB800
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:56: cpc_PrintGphStrXYM1("PRESS;ANY;KEY",0,8*24);
	ld	de,#___str_1
	ld	hl,#0xC000
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:57: while (!cpc_AnyKeyPressed()){}
00110$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00110$
;code.c:58: cpc_PutSpXOR(sprite,16,3,cpc_GetScrAddress(100,50));
	ld	hl,#0x3264
	push	hl
	call	_cpc_GetScrAddress
	ld	de,#_sprite
	push	hl
	ld	hl,#0x0310
	push	hl
	push	de
	call	_cpc_PutSpXOR
;code.c:59: cpc_PrintGphStrXYM1("5;SPRITE;PRINTED;AGAIN;IN;XOR;MODE",0,8*23);
	ld	de,#___str_5
	ld	hl,#0xB800
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:60: cpc_PrintGphStrXYM1("PRESS;ANY;KEY",0,8*24);
	ld	de,#___str_1
	ld	hl,#0xC000
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:61: while (!cpc_AnyKeyPressed()){}
00113$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00113$
;code.c:62: cpc_PutSpXOR(sprite,16,3,cpc_GetScrAddress(100,50));
	ld	hl,#0x3264
	push	hl
	call	_cpc_GetScrAddress
	ld	de,#_sprite
	push	hl
	ld	hl,#0x0310
	push	hl
	push	de
	call	_cpc_PutSpXOR
;code.c:64: cpc_PrintGphStrXYM1(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;",0,8*23);
	ld	de,#___str_6
	ld	hl,#0xB800
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:65: cpc_PrintGphStrXYM1("THE;END;;;;;;",0,8*24);
	ld	de,#___str_7
	ld	hl,#0xC000
	push	hl
	push	de
	call	_cpc_PrintGphStrXYM1
;code.c:66: while(!(cpc_AnyKeyPressed())){}
00116$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00116$
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "1;PUTS;A;SPRITE;IN;THE;SCREEN"
	.db 0x00
___str_1:
	.ascii "PRESS;ANY;KEY"
	.db 0x00
___str_2:
	.ascii "2;CAPTURES;A;SCREEN;AREA;;;;;"
	.db 0x00
___str_3:
	.ascii "3;PRINTS;CAPTURED;AREA"
	.db 0x00
___str_4:
	.ascii "4;PUTS;A SPRITE;IN;XOR;MODE"
	.db 0x00
___str_5:
	.ascii "5;SPRITE;PRINTED;AGAIN;IN;XOR;MODE"
	.db 0x00
___str_6:
	.ascii ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
	.db 0x00
___str_7:
	.ascii "THE;END;;;;;;"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
