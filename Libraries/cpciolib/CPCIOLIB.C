/*
 
   CPCIOLIB - I/O library for CPC - AMSDOS

   To use with the Small-C compiler
 
   Adapted from CP/M to amsdos by Juergen Weber
 
 
   Amsdos 1993 by JGW
   CP/M   1984 by JRVZ


compile:

   cc -M cpciolib
   zmac cpciolib=cpciolib

cpciolib should be linked as FIRST object file

NOTE: cpciolib supports only a small subset of the
      CPC operating system calls. But it should be
      easy to append some more.
 
*/
 
#include cpciolib.h
 

#asm
global qmain
call qcpcstart
call qmain
call qbyebye
rst 0

#endasm

int regs[4];
int stdin,stdout;

char *cas_outbuf;
char *cas_inbuf;
char *cas_catbuf;

ccgo() { /* dummy, in case -M was forgotten */ }


cpcstart()
{
#asm
global qcpcstart
pop hl
ld (retsto),hl
#endasm

stdin=STDIN;
stdout=STDOUT;

#asm
    LD HL,CPCSTRT
    LD C,0FFH
    JP 0BD16H  ; MC START PROGRAM
CPCSTRT:

    CALL 0BCCBH ; KL ROM WALK
 
    LD SP,HL    ; AMSDOS STACK IS NOT ENOUGH FOR RECURSIVE C PROGS
    ld de,-(2*1024)
    add hl,de
    ld (heapend),hl
#endasm
/* allocate cas buffers */
    cas_outbuf=alloc(2048);
    cas_inbuf=alloc(2048);
#asm
 
ld hl,(retsto)
jp (hl)
retsto: db 0,0
#endasm

}

byebye()
{
 puts("\nPress any key to reset to Amsdos.\n");
 getchar();
}

oscall(adr,regpack)
int adr;
int *regpack; /* af,hl,de,bc */
{
#asm
 pop bc  ; ret
 pop de  ; regs
 pop hl  ; adr
 push hl
 push de
 push bc

 ld (031h),hl  ; rst 30h: user
 ld a,0c3h
 ld (030h),a

 push de
 ex (sp),ix

 ld l,(ix+0)
 ld h,(ix+1)
 push hl
 pop af

 ld l,(ix+2)
 ld h,(ix+3)
 ld e,(ix+4)
 ld d,(ix+5)
 ld c,(ix+6)
 ld b,(ix+7)

 ex (sp),ix

 rst 30h      ; execute os-call

 ex (sp),ix

 ld (ix+2),l
 ld (ix+3),h
 push af
 pop  hl
 ld (ix+0),l
 ld (ix+1),h
 ld (ix+4),e
 ld (ix+5),d
 ld (ix+6),c
 ld (ix+7),b

 pop de
 JP  CCSXT   ;move A to HL & sign extend

#endasm
}

/* CPC specific functions */


mode(n) int n;
{
 regs[0]=n << 8;
 oscall(SET_MODE_SCR,regs);
}

cls()
{
 oscall(CLR_WIN_TXT,regs);
}

window(left,right,top,bottom) int left,right,top,bottom;
{
 regs[1]=(right-- << 8) + bottom--;
 regs[2]=(left-- << 8) + top--;
 oscall(WIN_ENA_TXT,regs);
}
 
wr_graph(c) int c;
{
 regs[0]=c<<8;
 oscall(WR_CHAR_GRA,regs);
}
 
graph_pen(n) int n;
{
 regs[0]=n<<8;
 oscall(SET_PEN_GRA,regs);
}
 
move(x,y) int x,y;
{
 regs[1]=y;
 regs[2]=x;
 oscall(MOVE_ABS_GRA,regs);
}
 
 
draw(x,y) int x,y;
{
 regs[1]=y;
 regs[2]=x;
 oscall(LINE_ABS_GRA,regs);
}
 
set_time(l,h) int h,l;
{  
 regs[1]=l; /* hl */
 regs[2]=h; /* de */
 oscall(TIME_SET_KL,regs);
}

 
get_time(l,h) int *h,*l;
{  
 oscall(TIME_GET_KL,regs);
 *l=regs[1];
 *h=regs[2];
}


openout(s) char *s;
{
 regs[3]=strlen(s) << 8; /* B */
 regs[1]=s;              /* HL */
 regs[2]=cas_outbuf;     /* DE */
 oscall(OUT_OPEN_CAS,regs);
 if (regs[0] & 1) /* Cy */
    return(OUTHANDLE);
 else
    return(EOF);
}

openin(s) char *s;
{
 regs[3]=strlen(s) << 8; /* B */
 regs[1]=s;              /* HL */
 regs[2]=cas_outbuf;     /* DE */
 oscall(IN_OPEN_CAS,regs);
 if (regs[0] & 1) /* Cy */
    return(INHANDLE);
 else
    return(EOF);
}

closein()
{
 oscall(IN_CLOSE_CAS,regs);
}

cat()  /* do it only if there's enough heap */
{
  int n;
 
  n=avail();
 
  if ((n<0) /* > 32768 */
     | (n>2047)) {
        cas_catbuf=alloc(2048);
        regs[2]=cas_catbuf;     /* DE */
        oscall(CATALOG_CAS,regs);
        free(cas_catbuf);
  }
  else
     err("Not enough heap.");
}
 
err(s) char *s;
{
 puts("ERR:");
 puts(s);
}


putchar(c) char c;
{	putc(c,stdout);
	return c;
}

putc(c,unit) char c; int unit;  /* write a character to a file */
{	putb(c,unit);
	if(c=='\n')putb(LF,unit);	/* add LF after CR */
	return c;
}

putb(c,unit) char c; int unit;  /* write a byte to a file */
{
    regs[0]=c << 8;
    if(unit==STDOUT)
        {
        oscall(OUTPUT_TXT,regs);
		return c;
		}
    else {
        oscall(OUT_CHAR_CAS,regs);
        if ((regs[0] & 1)==0)
           return(EOF);
    }
    return(c);
}

gets(s) char *s;
{
 int n;
  char *b,*b1;

 n=avail();

 if ((n<0) /* > 32768 */
     | (n>255)) {
        b=b1=alloc(255);
        if (b1<16384) b1=16384; /* should not be below rom */
        *b1='\0';  /* clear buffer first */
        basedit(b1);
        strncpy(s,b1,80); /* only copy 80 bytes */
        free(b);
  }
  else
     err("Not enough heap.");
}
    
basedit(b) char *b;
{
#asm

CLIN: CALL       0BB09H  ; CLEAR INPUT
JR	C,CLIN

CALL	0B915H	; KL PROBE ROM
LD	A,H	; VERSION

 pop de
 pop hl
 push hl
 push de

RRA	; BIT 0 => CY
JP	C,0BD5BH	; 664
RRA	; BIT 1 => CY
JP	C,0BD5EH	; 6128
JP      0BD3AH  ; 464
#endasm
}

getchar()
{	return getc(stdin);
}

getc(unit) int unit;	/* get character from file  */
{
    int c;
	while((c=getb(unit))==LF);	/* discard LF */
	if (c==26)	/* CP/M EOF? */
           return(EOF);
	return c;
}


getb(unit) int unit;    /* get byte from file */
{
    if(unit==STDIN)

        oscall(WAIT_CHAR_KM,regs);

    else {
        oscall(IN_CHAR_CAS,regs);
        if ((regs[0] & 1)==0)
           return(EOF);
    }
    return (regs[0]>>8);
}


#asm

; heap grows upwards (jgw)
;
;	/* return address of a block of memory */
;	alloc(b)
;	int b;		/* # bytes desired */
;
QALLOC: POP HL  ;return addr
	POP	DE	;block size
	PUSH	DE
	PUSH	HL
	LD	HL,(HEAPTOP) ;current top of heap
	EX	DE,HL
	ADD	HL,DE	;hl=new top of heap
	LD	(HEAPTOP),HL
	EX	DE,HL	;hl=old top of heap
	RET

HEAPTOP: DEFW   _END
heapend: defw 0
;
;	/* reset the top of heap pointer to addr* */
;
;	free(addr)
;	int addr;
;
QFREE:	POP	DE
	POP	HL	;addr
	PUSH	HL
	PUSH	DE
	LD	(HEAPTOP),HL
	RET
;
;	/* return number of bytes between top of heap
;	and end of TPA.  Remember that this includes
;	the stack! */
;
;	avail()
;
    QAVAIL: LD  HL,(heapend)  ;end of TPA
	PUSH	HL
	LD	HL,(HEAPTOP)	;top of heap
    CALL    CCSUB   ;find (heapend)-HEAPTOP
    RET ; j.w.89
#endasm

puts(buf) char *buf;	/* print a null-terminated string */
{	char c;
	while(c=*buf++) putchar(c);
}

upper(c) int c;		/* converts to upper case */
{	if(c>='a')return c-32;
	return c;
}

exit()
{
#asm
    RST  0
#endasm
}
#asm
 
;Fetch a single byte from the address in HL and
; sign extend into HL
CCGCHAR: LD	A,(HL)
QARGC:
CCSXT:	LD	L,A
	RLCA	
	SBC	A,A
	LD	H,A
	RET	
;Fetch integer from (HL+2)
CCCDR:	INC	HL
	INC	HL
;Fetch a full 16-bit integer from the address in HL
CCCAR:
CCGINT:	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	RET	
;Store a 16-bit integer in HL at the address in TOS
CCPINT:	POP	BC
	POP	DE
	PUSH	BC
	LD	A,L
	LD	(DE),A
	INC	DE
	LD	A,H
	LD	(DE),A
	RET	
;Inclusive "or" HL and TOS into HL
CCOR:	POP	BC
	POP	DE
	PUSH	BC
	LD	A,L
	OR	E
	LD	L,A
	LD	A,H
	OR	D
	LD	H,A
	RET	
;Exclusive "or" HL and TOS into HL
CCXOR:	POP	BC
	POP	DE
	PUSH	BC
	LD	A,L
	XOR	E
	LD	L,A
	LD	A,H
	XOR	D
	LD	H,A
	RET	
;"And" HL and TOS into HL
CCAND:	POP	BC
	POP	DE
	PUSH	BC
	LD	A,L
	AND	E
	LD	L,A
	LD	A,H
	AND	D
	LD	H,A
	RET	
;Test if HL = TOS and set HL = 1 if true else 0
CCEQ:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCCMP
	RET	Z
	DEC	HL
	RET	
;Test if TOS ~= HL
CCNE:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCCMP
	RET	NZ
	DEC	HL
	RET	
;Test if TOS > HL (signed)
CCGT:	POP	BC
	POP	DE
	PUSH	BC
	EX	DE,HL
	CALL	CCCMP
	RET	C
	DEC	HL
	RET	
;Test if TOS <= HL (signed)
CCLE:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCCMP
	RET	Z
	RET	C
	DEC	HL
	RET	
;Test if TOS >= HL (signed)
CCGE:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCCMP
	RET	NC
	DEC	HL
	RET	
;Test if TOS < HL (signed)
CCLT:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCCMP
	RET	C
	DEC	HL
	RET	
;Common routine to perform a signed compare
; of DE and HL
;This routine performs DE - HL and sets the conditions:
;	Carry reflects sign of difference (set means DE < HL)
;	Zero/non-zero set according to equality.
CCCMP:	LD	A,E
	SUB	L
	LD	E,A
	LD	A,D
	SBC	A,H
	LD	HL,1	     ;preset true condition
	JP	M,CCCMP1
	OR	E	     ;"OR" resets carry
	RET	
CCCMP1:	OR	E
	SCF		     ;set carry to signal minus
	RET	
;
;Test if TOS >= HL (unsigned)
CCUGE:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCUCMP
	RET	NC
	DEC	HL
	RET	
;
;Test if TOS < HL (unsigned)
CCULT:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCUCMP
	RET	C
	DEC	HL
	RET	
;
;Test if TOS > HL (unsigned)
CCUGT:	POP	BC
	POP	DE
	PUSH	BC
	EX	DE,HL
	CALL	CCUCMP
	RET	C
	DEC	HL
	RET	
;
;Test if TOS <= HL (unsigned)
CCULE:	POP	BC
	POP	DE
	PUSH	BC
	CALL	CCUCMP
	RET	Z
	RET	C
	DEC	HL
	RET	
;
;Common routine to perform unsigned compare
;carry set if DE < HL
;zero/nonzero set accordingly
CCUCMP:	LD	A,D
	CP	H
	JP	NZ,CUCMP1
	LD	A,E
	CP	L
CUCMP1:	LD	HL,1
	RET	
;
;Shift DE arithmetically right by HL and return in HL
CCASR:	EX	DE,HL
	DEC	E
	RET	M	     ;			7/2/82  jrvz
	LD	A,H
	RLA	
	LD	A,H
	RRA	
	LD	H,A
	LD	A,L
	RRA	
	LD	L,A
	JP	CCASR+1
;Shift TOS arithmetically left by HL and return in HL
CCASL:	POP	BC
	POP	DE
	PUSH	BC
	EX	DE,HL
CCASL4:	DEC	E
	RET	M	     ;		jrvz 7/2/82
	ADD	HL,HL
	JP	CCASL4
;Subtract HL from TOS and return in HL
CCSUB:	POP	BC
	POP	DE
	PUSH	BC
	LD	A,E
	SUB	L
	LD	L,A
	LD	A,D
	SBC	A,H
	LD	H,A
	RET	
;Form the two's complement of HL
CCNEG:	CALL	CCCOM
	INC	HL
	RET	
;Form the one's complement of HL
CCCOM:	LD	A,H
	CPL	
	LD	H,A
	LD	A,L
	CPL	
	LD	L,A
	RET	
;Multiply TOS by HL and return in HL
CCMULT:	POP	BC
	POP	DE
	PUSH	BC
	LD	B,H
	LD	C,L
	LD	HL,0
CCMLT1:	LD	A,C
	RRCA	
	JP	NC,CMLT2
	ADD	HL,DE
CMLT2:	XOR	A
	LD	A,B
	RRA	
	LD	B,A
	LD	A,C
	RRA	
	LD	C,A
	OR	B
	RET	Z
	XOR	A
	LD	A,E
	RLA	
	LD	E,A
	LD	A,D
	RLA	
	LD	D,A
	OR	E
	RET	Z
	JP	CCMLT1
;Divide DE by HL and return quotient in HL, remainder in DE
CCDIV:	LD	B,H
	LD	C,L
	LD	A,D
	XOR	B
	PUSH	AF
	LD	A,D
	OR	A
	CALL	M,CCDENEG
	LD	A,B
	OR	A
	CALL	M,CCBCNEG
	LD	A,16
	PUSH	AF
	EX	DE,HL
	LD	DE,0
CCDIV1:	ADD	HL,HL
	CALL	CCRDEL
	JP	Z,CCDIV2
	CALL	CCPBCDE
	JP	M,CCDIV2
	LD	A,L
	OR	1
	LD	L,A
	LD	A,E
	SUB	C
	LD	E,A
	LD	A,D
	SBC	A,B
	LD	D,A
CCDIV2:	POP	AF
	DEC	A
	JP	Z,CCDIV3
	PUSH	AF
	JP	CCDIV1
CCDIV3:	POP	AF
	RET	P
	CALL	CCDENEG
	EX	DE,HL
	CALL	CCDENEG
	EX	DE,HL
	RET	
CCDENEG: LD	A,D
	CPL	
	LD	D,A
	LD	A,E
	CPL	
	LD	E,A
	INC	DE
	RET	
CCBCNEG: LD	A,B
	CPL	
	LD	B,A
	LD	A,C
	CPL	
	LD	C,A
	INC	BC
	RET	
CCRDEL:	LD	A,E
	RLA	
	LD	E,A
	LD	A,D
	RLA	
	LD	D,A
	OR	E
	RET	
CCPBCDE: LD	A,E
	SUB	C
	LD	A,D
	SBC	A,B
	RET	
#endasm

hex(x) int x;
{	hexb(x>>8); hexb(x); putchar(' ');
}
hexb(x) int x;
{	hexn(x>>4); hexn(x);
}
hexn(x) int x;
{	x=x&15;
	if(x<10) putchar(x+'0');
	else putchar(x-10+'a');
}


strcmp(s1,s2) char *s1,*s2;
{
 int i;
 i=0;
 while (s1[i]==s2[i])
    if (s1[i++]=='\0')  
       return(0);
 return(s1[i]-s2[i]);
}

strcpy(tar,src) char *tar,*src;
{ while ((*tar++=*src++)); }

strncpy(tar,src,n) char *src,*tar;int n;
{
 char *s,*t;
 s=src;t=tar;
 while (n--)
    if ((*tar++=*src++)=='\0') {
       break; }
 *tar='\0';
 }

strlen(s) char *s;
{ int n;
  n=0;
  if (s==0) return (0);
  while (*s++) n++;
  return(n);
}

tolower(s) char *s;
{ int c;
  while (c=*s) {
    if ((c>='A') & (c<='Z'))
        *s=c+'a'-'A';
    s++;
  }
}

toupper(s) char *s;
{ int c;
  while (c=*s) {
    if ((c>='a') & (c<='z'))
        *s=c+'A'-'a';
    s++;
  }
}

 

