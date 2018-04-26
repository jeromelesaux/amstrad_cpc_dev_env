		;-----------------------------------------
		;    JavaCPC RasterPaint Assembly code
		; Authors: Oliver M. Lenz, Markus Hohmann
		;-----------------------------------------

		org	&2000  ; CALL &2000
		noheader

		OldCPC EQU 1 ; Set this to 0 for CPC Plus / Newer CPC Models.
		
		TableData EQU &9000

		ld 		bc,&BC06  ; hide screen
		out (c),c
		ld 		bc,&BD00
		out (c),c
		ld		A,(&4001)  ; set Background Color
.backgroundcolor
		ld		B,A
		ld		C,A
		ld		A,0
		call		&BC32
		ld		A,(&4001) 
.bordercolor
		ld		B,A
		ld		C,A
		ld		A,0
		call		&BC38
.screenmode
		ld		A,(&4000)	;set MODE
		call		&BC0E

		ld		DE,TableData   ; decrunch to &9900
		ld		HL,&4002   ; packed data at &4002
		ld		C,(HL)     ; length 1 -> 2000 bytes rasterdata
		inc		HL
		ld		B,(HL)
		inc		HL
		call		unpack

		ld		DE,&C000
		ld		C,(HL)
		inc		HL
		ld		B,(HL)
		inc		HL
		call		unpack

		jp		doRaster

.unpack
.nextunpack
		ld		A,(HL)
		dec		BC
		inc		HL
		cp		&80
		jr		NC,rawdata
.repeatunpack
		ldi
		dec		HL
		inc		BC
		dec		A
		jr		NZ,repeatunpack
		inc		HL

		dec		BC
		ld		A,B
		cp		&00
		jr		NZ,nextunpack
		ld		A,C
		cp		&00
		jr		NZ,nextunpack
		ret

.rawdata
		sub		&80
.repeatunpack2
		ldi
		dec		A
		jr		NZ,repeatunpack2

		ld		A,B
		cp		&00
		jr		NZ,nextunpack
		ld		A,C
		cp		&00
		jr		NZ,nextunpack
		ret


doRaster:
		ld 		bc,&BC06		;; show screen
		out (c),c
		ld 		bc,&BD19
		out (c),c
		
		di
		im		1
		ei

newframe:
		ld		HL,(&0038)
		ld		(rstsave),HL
		ld		HL,&C9FB
		ld		(&0038),HL

		ld		B,&F5
.waitvsync
		in		A,(C)
		rra
		jp		nc,waitvsync


		halt
		halt

		di
		ld		DE,&1702
.waitforstart
		dec		D
		jr		nz,waitforstart
		dec		E
		jr		nz,waitforstart

		nop
		IF		OldCPC
		nop
		ENDIF

		ld		BC,&8080
		out		(C),C  ; select pen 1
		ld		HL,TableData
		ld		DE,&0203
		ld		A,&01

.nextline
repeat 200
		outi		; 5
		outi		; 5
		outi		; 5
		outi		; 5
		outi		; 5
		outi		; 5
		outi		; 5
		outi		; 5
		;		40

		out		(C),D  ; 4 ; pen 2
		ld		B,C  ; 1
		outi		; 5
		out		(C),E  ; 4 ; pen 3
		outi		; 5
		out		(C),A  ; 4 ; pen 1
		ld		B,C  ; 1
		;		--
		;		64 microseconds
rend

		ld		HL,(rstsave)
		ld		(&0038),HL
		ei

		LD		A,&45 ; from &40 to &49 with bdir/bc1=01
		LD		D,0
		LD		BC,&F782 ; PPI port A out /C out
		OUT		(C),C
		LD		BC,&F40E ; Select Ay reg 14 on ppi port A
		OUT		(C),C
		LD		BC,&F6C0 ; This value is an AY index (R14)
		OUT		(C),C
		OUT		(C),D ; Validate!! out (c),0
		LD		BC,&F792 ; PPI port A in/C out
		OUT		(C),C
		DEC		B
		OUT		(C),A ; Send KbdLine on reg 14 AY through ppi port A
		LD		B,&F4 ; Read ppi port A
		IN		A,(C) ; e.g. AY R14 (AY port A)
		LD		BC,&F782 ; PPI port A out / C out
		OUT		(C),C
		DEC		B ; Reset PPI Write
		OUT		(C),D ; out (c),0
		bit		7,A
		jp		nz,newframe
		ret

.rstsave
		db		0,0
