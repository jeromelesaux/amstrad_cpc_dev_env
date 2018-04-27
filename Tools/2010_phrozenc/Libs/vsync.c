vsync()
{
  #asm
 vsync   ld b,#0xf5          ;; PPI port B input
    wait_vsync:
    in a,(c)            ;; [4] read PPI port B input
                        ;; (bit 0 = "1" if vsync is active,
                        ;;  or bit 0 = "0" if vsync is in-active)
    rra                 ;; [1] put bit 0 into carry flag
    jp nc,wait_vsync   ;; [3] if carry not set, loop, otherwise continue
  #endasm
}
