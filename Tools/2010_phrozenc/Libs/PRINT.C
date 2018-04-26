
/* PRINT.C */
/* Version 1.0 */

printstr( text )
	char *text;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc
	
printstrloop:
	ld a, ( hl )
	or a
	ret z
	call &bb5a
	inc hl
	jp printstrloop
#endasm
}

printstrln( text )
	char *text;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc

printstrlnloop:
	ld a, ( hl )
	or a
	jp z, printstrlnend
	call &bb5a
	inc hl
	jp printstrlnloop

printstrlnend:
	ld a, 13
	call &bb5a
	ld a, 10
	call &bb5a
#endasm
}

printchar( c )
	char c;
{	
#asm
	pop bc
	pop hl
	push hl
	push bc

	ld a, l
	call &bb5a
#endasm
}

printdec(number)
	int	number;
{
	int	k, zs;
	char	c;

	zs = 0;
	k = 10000;
	if (number < 0) {
		number = (-number);
		printchar('-');
	}
	while (k >= 1) {
		c = number / k + '0';
		if ((c != '0' | (k == 1) | zs)) {
			zs = 1;
			printchar(c);
		}
		number = number % k;
		k = k / 10;
	}
}

printhex(number)
	int	number;
{
	int k;	
	char c;
	
	k = 16;

	if (number < 0) number = 256 + number;

	while (k >= 1)
	{
		c = number / k + '0';
		if (c > '9') c += 39;
		printchar(c);
		number = number % k;
		k = k / 16;
   }
}