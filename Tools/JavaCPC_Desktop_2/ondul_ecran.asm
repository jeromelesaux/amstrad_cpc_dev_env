; http://www.cpcrulez.2ya.com
;

; (c) Logon System 1990
; Ecrit par Pict

        ORG &9000

; Sauve System

        DI
        LD  HL,(&38)
        LD  (INTER+1),HL
        LD  HL,&C9FB
        LD  (&38),HL
        EI

; Border noir

        LD  BC,&7F10
        OUT (C),C
        LD  A,&54
        OUT (C),A
        LD  C,0
        OUT (C),C
        OUT (C),A

LOOP:
        LD B,&F5
VSYNC:   IN A,(C)
        RRA
        JP NC,VSYNC

; On attend que l'�cran soit visible

        HALT
        HALT
        HALT

; "Centrage" du raster

        LD B,5
CENTRE:
        DJNZ CENTRE
        LD   HL,COLOR
        LD   DE,ONDUL
        LD   B,40               ; Taille Raster

MLOOP:
        PUSH BC
        LD   BC,&7F01
        OUT  (C),C
        OUTI                    ; Change la couleur
        LD   BC,&BC02
        OUTI
        INC  B
        LD   A,(DE)
        INC  DE
        OUT  (C),A              ; Decale le border
        LD   B,6

; Synchronisation HBL

TEMPO:   DJNZ   TEMPO
        POP     BC
        DJNZ    MLOOP
        LD      BC,&7F01        ; Border noir
        LD      A,&4B
        OUT     (C),C
        OUT     (C),A
        LD      BC,&BC02        ; Recentre l'�cran
        oUT     (C),C
        LD      BC,&BD00+46
        OUT     (C),C

; Gestion du d�calage de la vague

        LD      HL,(VAR+1)
        INC     HL
VARCOM:  LD      A,l
        DEC     A
        JP      NZ,NORESET
        LD      A,30
        LD      HL,ONDUL

NORESET:

        LD (VARCOM+1),A
        LD (VAR+1) ,HL

; Test de la barre espace

KEY:     LD    BC,&F40E
        OUT   (C),C
        LD    BC,&F6C0
        OUT   (C),C
        XOR   A
        OUT   (C),A
        LD    BC,&F792
        OUT   (C),C
        LD    BC,&F645
        OUT   (C),C
        LD    B,&F4
        IN    A,(C)
        LD    BC,&F782
        OUT   (C),C
        LD    BC,&F600
        OUT   (C),C
        RLA
        JP    LOOP
INTER:   LD    HL,0
        LD    (&38),HL
        RET

;



; Variables Registre 2 crtc

ONDUL:

        DB      46,47,47,48,48,48
        DB      49,49,49,49,48,48,48
        DB      47,47,46,45,45,44
        DB      44,44,43,43,43,43
        DB      44,44,44,45,45
        DB      46,47,47,48,48,48
        DB      49,49,49,49,48,48,48
        DB      47,47,46,45,45,44
        DB      44,44,43,43,43,43
        DB      44,44,44,45,45
        DB      46,47,47,48,48,48
        DB      49,49,49,49,48,48,48
        DB      47,47,46,45,45,44
        DB      44,44,43,43,43,43
        DB      44,44,44,45,45

; Variables couleurs ink 0
color:
DB      &5C,&4C,&5C,&4C,&4C
DB      &4E,&4C,&4E,&48,&4A
DB      &4E,&4A,&4A,&43,&43
DB      &43,&43,&4B,&43,&4B
DB      &4B,&43,&4B,&43,&43
DB      &43,&43,&4A,&4A,&4E
DB      &4A,&4E,&4E,&4C,&4E
DB      &4C,&4C,&5c,&4C,&5C

