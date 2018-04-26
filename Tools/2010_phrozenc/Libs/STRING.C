
/* STRING.C */
/* Version 1.0 */

strlen( text )
	char *text;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc

	ld e, 0
strlenloop:
	ld a, (hl)
	or a
	jp z, strlenend
	inc hl
	inc e
	jp strlenloop

strlenend:
	ld h, 0
	ld l, e
#endasm
}

strcpy( dest, src )
	char *dest;
	char *src;
{
#asm
	pop bc
	pop hl
	pop de
	push de
	push hl
	push bc
	
strcpyloop:
	ld a, (hl)
	ld (de), a
	or a
	ret z
	ld (de), a
	inc hl
	inc de
	jp strcpyloop
#endasm
}

strcat( dest, src )
	char *dest;
	char *src;
{
#asm
	pop bc
	pop hl
	pop de
	push de
	push hl
	push bc
	
strcatloop:
	ld a, (de)
	or a
	jp z, strcatloopend
	inc de
	jp strcatloop

strcatloopend:	
strcatloop2:
	ld a, (hl)
	ld (de), a
	or a
	ret z
	inc hl
	inc de
	jp strcatloop2
#endasm
}

itoa( intvalue, dest, base )
	char base;
	char *dest;
	int intvalue;
{
	int	k, zs;
	char	c;

	if ( base == 10 )
	{
		zs = 0;
		k = 10000;
		if (intvalue < 0) {
			intvalue = (-intvalue);
			*(dest++) = '-';
		}
		while (k >= 1) {
			c = intvalue / k + '0';
			if ((c != '0' | (k == 1) | zs)) {
				zs = 1;
				*(dest++) = c;
			}
			intvalue = intvalue % k;
			k = k / 10;
		}
	}
	else
	if ( base == 16 )
	{
		k = 16;

		if (intvalue < 0) intvalue = 256 + intvalue;

		while (k >= 1)
		{
			c = intvalue / k + '0';
			if (c > '9') c += 39;
			*(dest++) = c;
			intvalue = intvalue % k;
			k = k / 16;
	   }
	}

	*(dest++) = 0;
}
