
/* GRAPHIC.C */
/* Version 1.0 */

mode(mode) 
	char mode;
{
#asm
	pop bc
	pop hl
	push hl
	push bc
	
	ld a, l
	call &bc0e
#endasm
}

cls()
{
#asm
	call &bc14
#endasm
}

pen(pen) 
	char pen;
{
#asm
	pop bc
	pop hl
	push hl
	push bc
	
	ld a, l
	call &bbde
#endasm
}

ink(pen, color) 
	char pen;
	char color;
{
#asm
	pop de
	pop bc
	pop hl
	push hl
	push bc
	push de
	
	ld b, c
	ld a, l
	
	call &bc32
#endasm
}

border(color) 
	char color;
{
#asm
	pop hl
	pop bc
	push bc
	push hl
	
	ld b, c
	
	call &bc38
#endasm
}

move(x,y) 
	int x; 
	int y;
{
#asm
	pop bc
	pop hl
	pop de
	push de
	push hl
	push bc
	
	call &bbc0
#endasm
}

test(x,y) 
	int x; 
	int y;
{
#asm
	pop bc
	pop hl
	pop de
	push de
	push hl
	push bc
	
	call &bbf0

	ld h, 0
	ld l, a
#endasm
}

plot(x,y) 
	int x; 
	int y;
{
#asm
	pop bc
	pop hl
	pop de
	push de
	push hl
	push bc
	
	call &bbea
#endasm
}

draw(x, y)
	int x; 
	int y;
{
#asm
	pop bc
	pop hl
	pop de
	push de
	push hl
	push bc
	
	call &bbf6
#endasm
}