
/* INPUT.C */
/* Version 1.0 */

waitKey()
{	
#asm
	call &bb06

	ld h, 0
	ld l, a
#endasm
}

getstr( dest )
	char *dest;
{
#asm
	call &bb81 ; txt cur on
		
	pop bc
	pop de
	push de
	push bc
	
inputText:
	call &bb06
	
	cp &fc ; break
	jp z, inputText

	cp &7f ; del
	jp z, inputText
	
	cp 13
	jp z, doReturn
	
	ld (de), a
	inc de
	
	call &bb5a	
	jp inputText
	
doReturn:
	xor a
	ld (de),a
	inc de

	call &bb84 ; txt cur off
#endasm
}