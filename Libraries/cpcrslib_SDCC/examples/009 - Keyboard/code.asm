;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW64)
; This file was generated Tue Sep 15 21:10:42 2015
;--------------------------------------------------------
	.module code
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _wait
	.globl _cpc_RedefineKey
	.globl _cpc_TestKey
	.globl _cpc_AssignKey
	.globl _cpc_AnyKeyPressed
	.globl _cpc_PrintStr
	.globl _cpc_SetBorder
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
;code.c:5: void wait(void){
;	---------------------------------
; Function wait
; ---------------------------------
_wait::
;code.c:13: __endasm;
	 _kkk:
	ld b,#100
	 llll:
	halt
	djnz llll
	ret
;code.c:16: main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;code.c:18: cpc_SetModo(1);
	ld	l,#0x01
	call	_cpc_SetModo
;code.c:20: cpc_AssignKey(4,0x4804);		// key "ESC"
	ld	hl,#0x4804
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_cpc_AssignKey
	pop	af
	inc	sp
;code.c:22: cpc_PrintStr("Welcome to cpcrslib keyboard utilities.");
	ld	hl,#___str_0
	call	_cpc_PrintStr
;code.c:23: cpc_PrintStr("Press a Key to redefine as #1");
	ld	hl,#___str_1
	call	_cpc_PrintStr
;code.c:24: cpc_RedefineKey(0);		//redefine key. There are 12 available keys (0..11)
	ld	l,#0x00
	call	_cpc_RedefineKey
;code.c:25: cpc_PrintStr("Done!");
	ld	hl,#___str_2
	call	_cpc_PrintStr
;code.c:28: cpc_PrintStr("Now, press any key to continue");
	ld	hl,#___str_3
	call	_cpc_PrintStr
;code.c:29: while(!(cpc_AnyKeyPressed())){}
00101$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00101$
;code.c:31: cpc_PrintStr("Well done! Let's do it again");
	ld	hl,#___str_4
	call	_cpc_PrintStr
;code.c:33: cpc_PrintStr("Press any key to continue");
	ld	hl,#___str_5
	call	_cpc_PrintStr
;code.c:34: while(!(cpc_AnyKeyPressed())){}
00104$:
	call	_cpc_AnyKeyPressed
	ld	a,h
	or	a,l
	jr	Z,00104$
;code.c:37: cpc_PrintStr("Press a Key to redefine as #3");
	ld	hl,#___str_6
	call	_cpc_PrintStr
;code.c:38: cpc_RedefineKey(3);		//redefine key. There are 12 available keys (0..11)
	ld	l,#0x03
	call	_cpc_RedefineKey
;code.c:39: cpc_PrintStr("Done!");
	ld	hl,#___str_2
	call	_cpc_PrintStr
;code.c:42: wait();
	call	_wait
;code.c:43: cpc_SetModo(1);
	ld	l,#0x01
	call	_cpc_SetModo
;code.c:45: cpc_SetBorder(3);
	ld	l,#0x03
	call	_cpc_SetBorder
;code.c:47: cpc_PrintStr("Now let's test the selected keys. Press ESC to EXIT");
	ld	hl,#___str_7
	call	_cpc_PrintStr
;code.c:49: cpc_PrintStr("Press a Key to test it..");
	ld	hl,#___str_8
	call	_cpc_PrintStr
;code.c:50: while (!cpc_TestKey(4)) { // IF NOT ESC is pressed
00111$:
	ld	l,#0x04
	call	_cpc_TestKey
	ld	a,l
;code.c:52: if (cpc_TestKey(0)) {	//test if the key has been pressed.
	or	a,a
	jr	NZ,00113$
	ld	l,a
	call	_cpc_TestKey
	ld	a,l
	or	a, a
	jr	Z,00108$
;code.c:53: cpc_PrintStr("OK Key #1");
	ld	hl,#___str_9
	call	_cpc_PrintStr
00108$:
;code.c:55: if (cpc_TestKey(3)) {	//test if the key has been pressed.
	ld	l,#0x03
	call	_cpc_TestKey
	ld	a,l
	or	a, a
	jr	Z,00111$
;code.c:56: cpc_PrintStr("OK Key #2");
	ld	hl,#___str_10
	call	_cpc_PrintStr
	jr	00111$
00113$:
;code.c:60: return 0;
	ld	hl,#0x0000
	ret
___str_0:
	.ascii "Welcome to cpcrslib keyboard utilities."
	.db 0x00
___str_1:
	.ascii "Press a Key to redefine as #1"
	.db 0x00
___str_2:
	.ascii "Done!"
	.db 0x00
___str_3:
	.ascii "Now, press any key to continue"
	.db 0x00
___str_4:
	.ascii "Well done! Let's do it again"
	.db 0x00
___str_5:
	.ascii "Press any key to continue"
	.db 0x00
___str_6:
	.ascii "Press a Key to redefine as #3"
	.db 0x00
___str_7:
	.ascii "Now let's test the selected keys. Press ESC to EXIT"
	.db 0x00
___str_8:
	.ascii "Press a Key to test it.."
	.db 0x00
___str_9:
	.ascii "OK Key #1"
	.db 0x00
___str_10:
	.ascii "OK Key #2"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
