;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW64)
; This file was generated Tue Sep 15 18:58:08 2015
;--------------------------------------------------------
	.module code
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _cpc_AnyKeyPressed
	.globl _cpc_PrintGphStrStdXY
	.globl _cpc_PrintGphStrStd
	.globl _cpc_RLI
	.globl _cpc_RRI
	.globl _cpc_DisableFirmware
	.globl _cpc_EnableFirmware
	.globl _cpc_ClrScr
	.globl _cpc_SetColour
	.globl _cpc_SetMode
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
;code.c:5: char main (void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;code.c:6: unsigned char z=0;
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),#0x00
;code.c:9: cpc_DisableFirmware();		//Now, I don't gonna use any firmware routine so I modify interrupts jump to nothing
	call	_cpc_DisableFirmware
;code.c:10: cpc_ClrScr();				//fills scr with ink 0
	call	_cpc_ClrScr
;code.c:11: cpc_SetMode(1);				//hardware call to set mode 1
	ld	l,#0x01
	call	_cpc_SetMode
;code.c:13: cpc_SetColour(0,20);        //set background = black
	ld	hl,#0x1400
	push	hl
	call	_cpc_SetColour
;code.c:14: cpc_SetColour(16,20);       //set border = black
	ld	hl,#0x1410
	push	hl
	call	_cpc_SetColour
;code.c:16: cpc_PrintGphStrStd(1,"THIS IS A SMALL DEMO", 0xc050);	//parameters: pen, text, adress
	ld	hl,#___str_0
	ld	bc,#0xC050
	push	bc
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_cpc_PrintGphStrStd
	pop	af
	pop	af
	inc	sp
;code.c:17: cpc_PrintGphStrStd(2,"OF MODE 1 TEXT WITH",0xc0a0);
	ld	hl,#___str_1
	ld	bc,#0xC0A0
	push	bc
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_cpc_PrintGphStrStd
	pop	af
	pop	af
	inc	sp
;code.c:18: cpc_PrintGphStrStd(3,"8x8 CHARS WITHOUT FIRMWARE",0xc0f0);
	ld	hl,#___str_2
	ld	bc,#0xC0F0
	push	bc
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_cpc_PrintGphStrStd
	pop	af
	pop	af
	inc	sp
;code.c:19: cpc_PrintGphStrStdXY(3,"AND A SMALL SOFT SCROLL DEMO",8,70);
	ld	de,#___str_3
	ld	hl,#0x4608
	push	hl
	push	de
	ld	a,#0x03
	push	af
	inc	sp
	call	_cpc_PrintGphStrStdXY
	pop	af
	pop	af
	inc	sp
;code.c:20: cpc_PrintGphStrStdXY(2,"CPCRSLIB (C) 2015",19,80);
	ld	de,#___str_4
	ld	hl,#0x5013
	push	hl
	push	de
	ld	a,#0x02
	push	af
	inc	sp
	call	_cpc_PrintGphStrStdXY
	pop	af
	pop	af
	inc	sp
;code.c:21: cpc_PrintGphStrStdXY(1, "-- FONT BY ANJUEL  2009  --",2,160);
	ld	de,#___str_5
	ld	hl,#0xA002
	push	hl
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_cpc_PrintGphStrStdXY
	pop	af
	pop	af
	inc	sp
;code.c:22: cpc_PrintGphStrStdXY(1,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",2,174);
	ld	de,#___str_6
	ld	hl,#0xAE02
	push	hl
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_cpc_PrintGphStrStdXY
	pop	af
	pop	af
	inc	sp
;code.c:25: while (cpc_AnyKeyPressed()==0) {			//Small scrolling effect
00103$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	NZ,00106$
;code.c:26: z = !z;
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	d,a
	inc	sp
	push	de
	inc	sp
;code.c:27: if (z) {
	ld	a,d
	or	a, a
	jr	Z,00102$
;code.c:28: cpc_RRI (0xe000, 40, 79);
	ld	hl,#0x4F28
	push	hl
	ld	hl,#0xE000
	push	hl
	call	_cpc_RRI
;code.c:29: cpc_RRI (0xe4b0, 32, 79);
	ld	hl,#0x4F20
	push	hl
	ld	hl,#0xE4B0
	push	hl
	call	_cpc_RRI
00102$:
;code.c:32: cpc_RLI (0xe5f0+0x50+0x50+79, 12, 79);
	ld	hl,#0x4F0C
	push	hl
	ld	hl,#0xE6DF
	push	hl
	call	_cpc_RLI
	jr	00103$
;code.c:38: while (cpc_AnyKeyPressed()==0){}
00106$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00106$
;code.c:39: cpc_EnableFirmware();	//before exit, firmware jump is restored
	call	_cpc_EnableFirmware
;code.c:40: return 0;
	ld	l,#0x00
	inc	sp
	ret
___str_0:
	.ascii "THIS IS A SMALL DEMO"
	.db 0x00
___str_1:
	.ascii "OF MODE 1 TEXT WITH"
	.db 0x00
___str_2:
	.ascii "8x8 CHARS WITHOUT FIRMWARE"
	.db 0x00
___str_3:
	.ascii "AND A SMALL SOFT SCROLL DEMO"
	.db 0x00
___str_4:
	.ascii "CPCRSLIB (C) 2015"
	.db 0x00
___str_5:
	.ascii "-- FONT BY ANJUEL  2009  --"
	.db 0x00
___str_6:
	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
