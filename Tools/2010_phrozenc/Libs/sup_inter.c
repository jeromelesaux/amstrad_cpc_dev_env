  
suppress_interupt()   
#asm
  DI                           ;
  LD HL,&38                    ;
  LD (Inter),HL
  LD HL,&C9FB                  ; A MORT LES INTERRUPTS
  LD (&38),HL
  EI  
  Inter DW 0000
#endasm
}