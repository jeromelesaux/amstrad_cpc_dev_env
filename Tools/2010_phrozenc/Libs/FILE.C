
/* FILE.C */
/* add get current drive in memory */ 
/* Version 1.1 */

initamsdos() {
#asm
	ld hl,(&be7d); recup du numero de lecteur dans a
	ld a,(hl)
	push af
	ld c,7 ; init rom 7
	ld de,&40
	ld hl,&abff
	call &bcce
	pop af
	ld hl,(&be7d) ; restit du numero de lecteur
	ld (hl),a
#endasm
}

openread(filename,readbuffer) 
	char *filename;
	char *readbuffer;
{
#asm
	pop bc
	pop de
	pop hl
	push hl
	push de
	push bc

	call getfilenamesize
	
	call &bc77
	jr nc, openreadfail

	ld hl, 1
	ret

openreadfail:
	ld hl, 0
	ret
#endasm
}

getchar()
{
#asm
	call &bc80
	ld h, 0
	ld l, a
	ret
#endasm
}

iseof()
{
#asm
	call &bc89
	jr nc, iseoftrue

	ld hl, 0
	ret
	
iseoftrue:
	ld hl, 1
	ret
#endasm
}

closeread()
{
#asm
	call &bc7a
#endasm
}

openwrite(filename,writebuffer) 
	char *filename;
	char *writebuffer;
{
#asm
	pop bc
	pop de
	pop hl
	push hl
	push de
	push bc

	call getfilenamesize

	call &bc8c
	jr nc, openwritefail

	ld hl, 1
	ret

openwritefail:
	ld hl, 0
	ret
#endasm
}

putchar(c) 
	char c;
{
#asm
	pop bc
	pop hl
	push hl
	push bc

	ld a, l
	call &bc95
#endasm
}

getbinary(ptr)
	char *ptr;
{
#asm
	pop bc
	pop hl
	push hl
	push bc

	call &bc83
#endasm
}

putstr( text )
	char *text;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc
	
putstrloop:
	ld a, ( hl )
	or a
	ret z
	call &bc95
	inc hl
	jp putstrloop
#endasm
}

putstrln( text )
	char *text;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc

putstrlnloop:
	ld a, ( hl )
	or a
	jp z, putstrlnend
	call &bc95
	inc hl
	jp putstrlnloop

putstrlnend:
	ld a, 13
	call &bc95
	ld a, 10
	call &bc95
#endasm
}

putbinary(ptr,length,execPtr)
	char *ptr;
	int length;
	char *execPtr;
{
#asm
	pop ix
	pop bc
	pop de
	pop hl
	push hl
	push de
	push bc
	push ix

	ld a, 2 ; binary
	call &bc98
#endasm
}

closewrite()
{
#asm
	call &bc8f
#endasm
}

#asm
getfilenamesize:
	push de
	push hl
	ld e, 0
getfilenamesizeloop:
	ld a, (hl)
	or a
	jp z, getfilenamesizeend
	inc hl
	inc e
	jp getfilenamesizeloop
getfilenamesizeend:
	pop hl
	ld b, e
	pop de
	ret
#endasm
