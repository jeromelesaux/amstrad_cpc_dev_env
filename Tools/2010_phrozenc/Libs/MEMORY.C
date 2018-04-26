
/* MEMORY.C */
/* Version 1.0 */

memcpy( src, dest, length )
	char *src;
	char *dest;
	int length;
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

	ldir
#endasm
}

bankSwitch( bank )
	char bank;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc

	ld a, l
	
	call &bd5b

	ld h, 0
	ld l, a
#endasm
}
