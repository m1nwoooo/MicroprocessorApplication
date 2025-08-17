.global _main_init
.text

/*
        Module              From          To         
      - SRAM I/O            0x0000_0000   0x0000_FFFF
      - SRAM 0              0x0100_0000   0x0100_FFFF
      - SRAM 1              0x0200_0000   0x0200_FFFF
      - SRAM W              0x0300_0000   0x0300_FFFF
      - SRAM 2              0x0400_0000   0x0400_FFFF
      - Dpath reg (port 0)  0x0500_0000   0x0500_0007
      - Dpath reg (port 1)  0x0600_0000   0x0600_0007
      - Dpath reg (port 2)  0x0700_0000   0x0700_0003
*/

_main_init:
    # Initialize base addresses
    lui     s0,     0x00000          # SRAM I/O input base
    lui     s7,     0x00000          #output base
    addi    s7,     s7,0x400         #output base
    lui     s1,     0x01000          # SRAM 0 base
    lui     s2,     0x02000          # SRAM 1 base
    lui     s5,     0x06000          # Dpath port 1
    lui     t0,     0x00000          
    lui     s3,     0x03000          # dummy
    lui     s3,     0x03000          # dummy
# ========== STAGE 0:64 input data (32 butterfly operations) ==========
stage0:

# Butterfly 0
    lw      t0, 0(s0)       # d0(SRAM I/O->t0)
    lw      t1, 128(s0)     # d1(SRAM I/O->t1)
    sw      t0, 0(s1)       # d0(t0->SRAM_0)
    sw      t1, 0(s2)       # d1(t1->SRAM_1)
    addi    x0, x0, 1       # dummy
    
    # Butterfly 1
    lw      t0, 64(s0)      # d0(SRAM I/O->t0)
    lw      t1, 192(s0)     # d1(SRAM I/O->t1)
    sw      t0, 4(s1)       # d0(t0->SRAM_0)
    sw      t1, 4(s2)       # d1(t1->SRAM_1)
    addi    x0, x0, 1       # dummy

    # Butterfly 2
    lw      t0, 32(s0)      # d0(SRAM I/O->t0)
    lw      t1, 160(s0)     # d1(SRAM I/O->t1)
    sw      t0, 8(s1)       # d0(t0->SRAM_0)
    sw      t1, 8(s2)       # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy


    # Butterfly 3
    lw      t0, 96(s0)      # d0(SRAM I/O->t0)
    lw      t1, 224(s0)     # d1(SRAM I/O->t1)
    sw      t0, 12(s1)      # d0(t0->SRAM_0)
    sw      t1, 12(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy


    # Butterfly 4
    lw      t0, 16(s0)      # d0(SRAM I/O->t0)
    lw      t1, 144(s0)     # d1(SRAM I/O->t1)
    sw      t0, 16(s1)      # d0(t0->SRAM_0)
    sw      t1, 16(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 5
    lw      t0, 80(s0)      # d0(SRAM I/O->t0)
    lw      t1, 208(s0)     # d1(SRAM I/O->t1)
    sw      t0, 20(s1)      # d0(t0->SRAM_0)
    sw      t1, 20(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 6
    lw      t0, 48(s0)      # d0(SRAM I/O->t0)
    lw      t1, 176(s0)     # d1(SRAM I/O->t1)
    sw      t0, 24(s1)      # d0(t0->SRAM_0)
    sw      t1, 24(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 7
    lw      t0, 112(s0)     # d0(SRAM I/O->t0)
    lw      t1, 240(s0)     # d1(SRAM I/O->t1)
    sw      t0, 28(s1)      # d0(t0->SRAM_0)
    sw      t1, 28(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 8
    lw      t0, 8(s0)       # d0(SRAM I/O->t0)
    lw      t1, 136(s0)     # d1(SRAM I/O->t1)
    sw      t0, 32(s1)      # d0(t0->SRAM_0)
    sw      t1, 32(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 9
    lw      t0, 72(s0)      # d0(SRAM I/O->t0)
    lw      t1, 200(s0)     # d1(SRAM I/O->t1)
    sw      t0, 36(s1)      # d0(t0->SRAM_0)
    sw      t1, 36(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 10
    lw      t0, 40(s0)      # d0(SRAM I/O->t0)
    lw      t1, 168(s0)     # d1(SRAM I/O->t1)
    sw      t0, 40(s1)      # d0(t0->SRAM_0)
    sw      t1, 40(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 11
    lw      t0, 104(s0)     # d0(SRAM I/O->t0)
    lw      t1, 232(s0)     # d1(SRAM I/O->t1)
    sw      t0, 44(s1)      # d0(t0->SRAM_0)
    sw      t1, 44(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 12
    lw      t0, 24(s0)      # d0(SRAM I/O->t0)
    lw      t1, 152(s0)     # d1(SRAM I/O->t1)
    sw      t0, 48(s1)      # d0(t0->SRAM_0)
    sw      t1, 48(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 13
    lw      t0, 88(s0)      # d0(SRAM I/O->t0)
    lw      t1, 216(s0)     # d1(SRAM I/O->t1)
    sw      t0, 52(s1)      # d0(t0->SRAM_0)
    sw      t1, 52(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 14
    lw      t0, 56(s0)      # d0(SRAM I/O->t0)
    lw      t1, 184(s0)     # d1(SRAM I/O->t1)
    sw      t0, 56(s1)      # d0(t0->SRAM_0)
    sw      t1, 56(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 15
    lw      t0, 120(s0)     # d0(SRAM I/O->t0)
    lw      t1, 248(s0)     # d1(SRAM I/O->t1)
    sw      t0, 60(s1)      # d0(t0->SRAM_0)
    sw      t1, 60(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 16
    lw      t0, 4(s0)       # d0(SRAM I/O->t0)
    lw      t1, 132(s0)     # d1(SRAM I/O->t1)
    sw      t0, 64(s1)      # d0(t0->SRAM_0)
    sw      t1, 64(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 17
    lw      t0, 68(s0)      # d0(SRAM I/O->t0)
    lw      t1, 196(s0)     # d1(SRAM I/O->t1)
    sw      t0, 68(s1)      # d0(t0->SRAM_0)
    sw      t1, 68(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 18
    lw      t0, 36(s0)      # d0(SRAM I/O->t0)
    lw      t1, 164(s0)     # d1(SRAM I/O->t1)
    sw      t0, 72(s1)      # d0(t0->SRAM_0)
    sw      t1, 72(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 19
    lw      t0, 100(s0)     # d0(SRAM I/O->t0)
    lw      t1, 228(s0)     # d1(SRAM I/O->t1)
    sw      t0, 76(s1)      # d0(t0->SRAM_0)
    sw      t1, 76(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 20
    lw      t0, 20(s0)      # d0(SRAM I/O->t0)
    lw      t1, 148(s0)     # d1(SRAM I/O->t1)
    sw      t0, 80(s1)      # d0(t0->SRAM_0)
    sw      t1, 80(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 21
    lw      t0, 84(s0)      # d0(SRAM I/O->t0)
    lw      t1, 212(s0)     # d1(SRAM I/O->t1)
    sw      t0, 84(s1)      # d0(t0->SRAM_0)
    sw      t1, 84(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 22
    lw      t0, 52(s0)      # d0(SRAM I/O->t0)
    lw      t1, 180(s0)     # d1(SRAM I/O->t1)
    sw      t0, 88(s1)      # d0(t0->SRAM_0)
    sw      t1, 88(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 23
    lw      t0, 116(s0)     # d0(SRAM I/O->t0)
    lw      t1, 244(s0)     # d1(SRAM I/O->t1)
    sw      t0, 92(s1)      # d0(t0->SRAM_0)
    sw      t1, 92(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 24
    lw      t0, 12(s0)      # d0(SRAM I/O->t0)
    lw      t1, 140(s0)     # d1(SRAM I/O->t1)
    sw      t0, 96(s1)      # d0(t0->SRAM_0)
    sw      t1, 96(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 25
    lw      t0, 76(s0)      # d0(SRAM I/O->t0)
    lw      t1, 204(s0)     # d1(SRAM I/O->t1)
    sw      t0, 100(s1)     # d0(t0->SRAM_0)
    sw      t1, 100(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 26
    lw      t0, 44(s0)      # d0(SRAM I/O->t0)
    lw      t1, 172(s0)     # d1(SRAM I/O->t1)
    sw      t0, 104(s1)     # d0(t0->SRAM_0)
    sw      t1, 104(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 27
    lw      t0, 108(s0)     # d0(SRAM I/O->t0)
    lw      t1, 236(s0)     # d1(SRAM I/O->t1)
    sw      t0, 108(s1)     # d0(t0->SRAM_0)
    sw      t1, 108(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 28
    lw      t0, 28(s0)      # d0(SRAM I/O->t0)
    lw      t1, 156(s0)     # d1(SRAM I/O->t1)
    sw      t0, 112(s1)     # d0(t0->SRAM_0)
    sw      t1, 112(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 29
    lw      t0, 92(s0)      # d0(SRAM I/O->t0)
    lw      t1, 220(s0)     # d1(SRAM I/O->t1)
    sw      t0, 116(s1)     # d0(t0->SRAM_0)
    sw      t1, 116(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 30
    lw      t0, 60(s0)      # d0(SRAM I/O->t0)
    lw      t1, 188(s0)     # d1(SRAM I/O->t1)
    sw      t0, 120(s1)     # d0(t0->SRAM_0)
    sw      t1, 120(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 31
    lw      t0, 124(s0)     # d0(SRAM I/O->t0)
    lw      t1, 252(s0)     # d1(SRAM I/O->t1)
    sw      t0, 124(s1)     # d0(t0->SRAM_0)
    sw      t1, 124(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy


    # Synchronization cycles
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy


    #160+8 = 168 글자수세기로 326 (168+128)

# ========== STAGE 1: 32 butterfly operations ==========
# Pattern: wait 4 cycles, t
#stage1:
    # Initial wait cycles
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy

    
    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 4(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 4(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    #--
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

#stage1: 130개, 글자수세기로는 196 (130+64)


# ========== STAGE 2: 32 butterfly operations ==========
#stage2:
    
    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 8(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 8(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    #--
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 3: 32 butterfly operations ==========
#stage3:

    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 16(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 16(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 4: 32 butterfly operations ==========
#stage4:

    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 32(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 32(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 5: 32 butterfly operations with output to SRAM I/O ==========
#stage5:
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 64(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 64(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 5 OUTPUT STORE: Load from SRAM and store to SRAM I/O ==========
#stage5_output:
        #butterfly 0
    addi x0, x0, 0 #dummy
    lw s11, 0(s2) #sram_1[0]->s11
    sw s11, 4(s7) #s11->sram i/o
    
    #butterfly 1
    lw s11, 4(s2) #sram_1[1]->s11
    sw s11, 12(s7) #s11->sram i/o
    
    #butterfly 2
    lw s11, 8(s2) #sram_1[2]->s11
    sw s11, 20(s7) #s11->sram i/o
    
    #butterfly 3
    lw s11, 12(s2) #sram_1[3]->s11
    sw s11, 28(s7) #s11->sram i/o
    
    #butterfly 4
    lw s11, 16(s2) #sram_1[4]->s11
    sw s11, 36(s7) #s11->sram i/o
    
    #butterfly 5
    lw s11, 20(s2) #sram_1[5]->s11
    sw s11, 44(s7) #s11->sram i/o
    
    #butterfly 6
    lw s11, 24(s2) #sram_1[6]->s11
    sw s11, 52(s7) #s11->sram i/o
    
    #butterfly 7
    lw s11, 28(s2) #sram_1[7]->s11
    sw s11, 60(s7) #s11->sram i/o
    
    #butterfly 8
    lw s11, 32(s2) #sram_1[8]->s11
    sw s11, 68(s7) #s11->sram i/o
    
    #butterfly 9
    lw s11, 36(s2) #sram_1[9]->s11
    sw s11, 76(s7) #s11->sram i/o
    
    #butterfly 10
    lw s11, 40(s2) #sram_1[10]->s11
    sw s11, 84(s7) #s11->sram i/o
    
    #butterfly 11
    lw s11, 44(s2) #sram_1[11]->s11
    sw s11, 92(s7) #s11->sram i/o
    
    #butterfly 12
    lw s11, 48(s2) #sram_1[12]->s11
    sw s11, 100(s7) #s11->sram i/o
    
    #butterfly 13
    lw s11, 52(s2) #sram_1[13]->s11
    sw s11, 108(s7) #s11->sram i/o
    
    #butterfly 14
    lw s11, 56(s2) #sram_1[14]->s11
    sw s11, 116(s7) #s11->sram i/o
    
    #butterfly 15
    lw s11, 60(s2) #sram_1[15]->s11
    sw s11, 124(s7) #s11->sram i/o
    
    #butterfly 16
    lw s11, 64(s2) #sram_1[16]->s11
    sw s11, 132(s7) #s11->sram i/o
    
    #butterfly 17
    lw s11, 68(s2) #sram_1[17]->s11
    sw s11, 140(s7) #s11->sram i/o
    
    #butterfly 18
    lw s11, 72(s2) #sram_1[18]->s11
    sw s11, 148(s7) #s11->sram i/o
    
    #butterfly 19
    lw s11, 76(s2) #sram_1[19]->s11
    sw s11, 156(s7) #s11->sram i/o
    
    #butterfly 20
    lw s11, 80(s2) #sram_1[20]->s11
    sw s11, 164(s7) #s11->sram i/o
    
    #butterfly 21
    lw s11, 84(s2) #sram_1[21]->s11
    sw s11, 172(s7) #s11->sram i/o
    
    #butterfly 22
    lw s11, 88(s2) #sram_1[22]->s11
    sw s11, 180(s7) #s11->sram i/o
    
    #butterfly 23
    lw s11, 92(s2) #sram_1[23]->s11
    sw s11, 188(s7) #s11->sram i/o
    
    #butterfly 24
    lw s11, 96(s2) #sram_1[24]->s11
    sw s11, 196(s7) #s11->sram i/o
    
    #butterfly 25
    lw s11, 100(s2) #sram_1[25]->s11
    sw s11, 204(s7) #s11->sram i/o
    
    #butterfly 26
    lw s11, 104(s2) #sram_1[26]->s11
    sw s11, 212(s7) #s11->sram i/o
    
    #butterfly 27
    lw s11, 108(s2) #sram_1[27]->s11
    sw s11, 220(s7) #s11->sram i/o
    
    #butterfly 28
    lw s11, 112(s2) #sram_1[28]->s11
    sw s11, 228(s7) #s11->sram i/o
    
    #butterfly 29
    lw s11, 116(s2) #sram_1[29]->s11
    sw s11, 236(s7) #s11->sram i/o
    
    #butterfly 30
    lw s11, 120(s2) #sram_1[30]->s11
    sw s11, 244(s7) #s11->sram i/o
    
    #butterfly 31
    lw s11, 124(s2) #sram_1[31]->s11
    sw s11, 252(s7) #s11->sram i/o

######set1
    addi s0,s0,256
    addi s7,s7,256
#stage0:

# Butterfly 0
    lw      t0, 0(s0)       # d0(SRAM I/O->t0)
    lw      t1, 128(s0)     # d1(SRAM I/O->t1)
    sw      t0, 0(s1)       # d0(t0->SRAM_0)
    sw      t1, 0(s2)       # d1(t1->SRAM_1)
    addi    x0, x0, 1       # dummy
    
    # Butterfly 1
    lw      t0, 64(s0)      # d0(SRAM I/O->t0)
    lw      t1, 192(s0)     # d1(SRAM I/O->t1)
    sw      t0, 4(s1)       # d0(t0->SRAM_0)
    sw      t1, 4(s2)       # d1(t1->SRAM_1)
    addi    x0, x0, 1       # dummy

    # Butterfly 2
    lw      t0, 32(s0)      # d0(SRAM I/O->t0)
    lw      t1, 160(s0)     # d1(SRAM I/O->t1)
    sw      t0, 8(s1)       # d0(t0->SRAM_0)
    sw      t1, 8(s2)       # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy


    # Butterfly 3
    lw      t0, 96(s0)      # d0(SRAM I/O->t0)
    lw      t1, 224(s0)     # d1(SRAM I/O->t1)
    sw      t0, 12(s1)      # d0(t0->SRAM_0)
    sw      t1, 12(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy


    # Butterfly 4
    lw      t0, 16(s0)      # d0(SRAM I/O->t0)
    lw      t1, 144(s0)     # d1(SRAM I/O->t1)
    sw      t0, 16(s1)      # d0(t0->SRAM_0)
    sw      t1, 16(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 5
    lw      t0, 80(s0)      # d0(SRAM I/O->t0)
    lw      t1, 208(s0)     # d1(SRAM I/O->t1)
    sw      t0, 20(s1)      # d0(t0->SRAM_0)
    sw      t1, 20(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 6
    lw      t0, 48(s0)      # d0(SRAM I/O->t0)
    lw      t1, 176(s0)     # d1(SRAM I/O->t1)
    sw      t0, 24(s1)      # d0(t0->SRAM_0)
    sw      t1, 24(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 7
    lw      t0, 112(s0)     # d0(SRAM I/O->t0)
    lw      t1, 240(s0)     # d1(SRAM I/O->t1)
    sw      t0, 28(s1)      # d0(t0->SRAM_0)
    sw      t1, 28(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 8
    lw      t0, 8(s0)       # d0(SRAM I/O->t0)
    lw      t1, 136(s0)     # d1(SRAM I/O->t1)
    sw      t0, 32(s1)      # d0(t0->SRAM_0)
    sw      t1, 32(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 9
    lw      t0, 72(s0)      # d0(SRAM I/O->t0)
    lw      t1, 200(s0)     # d1(SRAM I/O->t1)
    sw      t0, 36(s1)      # d0(t0->SRAM_0)
    sw      t1, 36(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 10
    lw      t0, 40(s0)      # d0(SRAM I/O->t0)
    lw      t1, 168(s0)     # d1(SRAM I/O->t1)
    sw      t0, 40(s1)      # d0(t0->SRAM_0)
    sw      t1, 40(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 11
    lw      t0, 104(s0)     # d0(SRAM I/O->t0)
    lw      t1, 232(s0)     # d1(SRAM I/O->t1)
    sw      t0, 44(s1)      # d0(t0->SRAM_0)
    sw      t1, 44(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 12
    lw      t0, 24(s0)      # d0(SRAM I/O->t0)
    lw      t1, 152(s0)     # d1(SRAM I/O->t1)
    sw      t0, 48(s1)      # d0(t0->SRAM_0)
    sw      t1, 48(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 13
    lw      t0, 88(s0)      # d0(SRAM I/O->t0)
    lw      t1, 216(s0)     # d1(SRAM I/O->t1)
    sw      t0, 52(s1)      # d0(t0->SRAM_0)
    sw      t1, 52(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 14
    lw      t0, 56(s0)      # d0(SRAM I/O->t0)
    lw      t1, 184(s0)     # d1(SRAM I/O->t1)
    sw      t0, 56(s1)      # d0(t0->SRAM_0)
    sw      t1, 56(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 15
    lw      t0, 120(s0)     # d0(SRAM I/O->t0)
    lw      t1, 248(s0)     # d1(SRAM I/O->t1)
    sw      t0, 60(s1)      # d0(t0->SRAM_0)
    sw      t1, 60(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 16
    lw      t0, 4(s0)       # d0(SRAM I/O->t0)
    lw      t1, 132(s0)     # d1(SRAM I/O->t1)
    sw      t0, 64(s1)      # d0(t0->SRAM_0)
    sw      t1, 64(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 17
    lw      t0, 68(s0)      # d0(SRAM I/O->t0)
    lw      t1, 196(s0)     # d1(SRAM I/O->t1)
    sw      t0, 68(s1)      # d0(t0->SRAM_0)
    sw      t1, 68(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 18
    lw      t0, 36(s0)      # d0(SRAM I/O->t0)
    lw      t1, 164(s0)     # d1(SRAM I/O->t1)
    sw      t0, 72(s1)      # d0(t0->SRAM_0)
    sw      t1, 72(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 19
    lw      t0, 100(s0)     # d0(SRAM I/O->t0)
    lw      t1, 228(s0)     # d1(SRAM I/O->t1)
    sw      t0, 76(s1)      # d0(t0->SRAM_0)
    sw      t1, 76(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 20
    lw      t0, 20(s0)      # d0(SRAM I/O->t0)
    lw      t1, 148(s0)     # d1(SRAM I/O->t1)
    sw      t0, 80(s1)      # d0(t0->SRAM_0)
    sw      t1, 80(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 21
    lw      t0, 84(s0)      # d0(SRAM I/O->t0)
    lw      t1, 212(s0)     # d1(SRAM I/O->t1)
    sw      t0, 84(s1)      # d0(t0->SRAM_0)
    sw      t1, 84(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 22
    lw      t0, 52(s0)      # d0(SRAM I/O->t0)
    lw      t1, 180(s0)     # d1(SRAM I/O->t1)
    sw      t0, 88(s1)      # d0(t0->SRAM_0)
    sw      t1, 88(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 23
    lw      t0, 116(s0)     # d0(SRAM I/O->t0)
    lw      t1, 244(s0)     # d1(SRAM I/O->t1)
    sw      t0, 92(s1)      # d0(t0->SRAM_0)
    sw      t1, 92(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 24
    lw      t0, 12(s0)      # d0(SRAM I/O->t0)
    lw      t1, 140(s0)     # d1(SRAM I/O->t1)
    sw      t0, 96(s1)      # d0(t0->SRAM_0)
    sw      t1, 96(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 25
    lw      t0, 76(s0)      # d0(SRAM I/O->t0)
    lw      t1, 204(s0)     # d1(SRAM I/O->t1)
    sw      t0, 100(s1)     # d0(t0->SRAM_0)
    sw      t1, 100(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 26
    lw      t0, 44(s0)      # d0(SRAM I/O->t0)
    lw      t1, 172(s0)     # d1(SRAM I/O->t1)
    sw      t0, 104(s1)     # d0(t0->SRAM_0)
    sw      t1, 104(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 27
    lw      t0, 108(s0)     # d0(SRAM I/O->t0)
    lw      t1, 236(s0)     # d1(SRAM I/O->t1)
    sw      t0, 108(s1)     # d0(t0->SRAM_0)
    sw      t1, 108(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 28
    lw      t0, 28(s0)      # d0(SRAM I/O->t0)
    lw      t1, 156(s0)     # d1(SRAM I/O->t1)
    sw      t0, 112(s1)     # d0(t0->SRAM_0)
    sw      t1, 112(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 29
    lw      t0, 92(s0)      # d0(SRAM I/O->t0)
    lw      t1, 220(s0)     # d1(SRAM I/O->t1)
    sw      t0, 116(s1)     # d0(t0->SRAM_0)
    sw      t1, 116(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 30
    lw      t0, 60(s0)      # d0(SRAM I/O->t0)
    lw      t1, 188(s0)     # d1(SRAM I/O->t1)
    sw      t0, 120(s1)     # d0(t0->SRAM_0)
    sw      t1, 120(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 31
    lw      t0, 124(s0)     # d0(SRAM I/O->t0)
    lw      t1, 252(s0)     # d1(SRAM I/O->t1)
    sw      t0, 124(s1)     # d0(t0->SRAM_0)
    sw      t1, 124(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy


    # Synchronization cycles
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy


    #160+8 = 168 글자수세기로 326 (168+128)

# ========== STAGE 1: 32 butterfly operations ==========
# Pattern: wait 4 cycles, t
#stage1:
    # Initial wait cycles
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy

    
    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 4(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 4(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    #--
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

#stage1: 130개, 글자수세기로는 196 (130+64)


# ========== STAGE 2: 32 butterfly operations ==========
#stage2:
    
    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 8(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 8(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    #--
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 3: 32 butterfly operations ==========
#stage3:

    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 16(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 16(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 4: 32 butterfly operations ==========
#stage4:

    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 32(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 32(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 5: 32 butterfly operations with output to SRAM I/O ==========
#stage5:
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 64(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 64(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 5 OUTPUT STORE: Load from SRAM and store to SRAM I/O ==========
#stage5_output:
        #butterfly 0
    addi x0, x0, 0 #dummy
    lw s11, 0(s2) #sram_1[0]->s11
    sw s11, 4(s7) #s11->sram i/o
    
    #butterfly 1
    lw s11, 4(s2) #sram_1[1]->s11
    sw s11, 12(s7) #s11->sram i/o
    
    #butterfly 2
    lw s11, 8(s2) #sram_1[2]->s11
    sw s11, 20(s7) #s11->sram i/o
    
    #butterfly 3
    lw s11, 12(s2) #sram_1[3]->s11
    sw s11, 28(s7) #s11->sram i/o
    
    #butterfly 4
    lw s11, 16(s2) #sram_1[4]->s11
    sw s11, 36(s7) #s11->sram i/o
    
    #butterfly 5
    lw s11, 20(s2) #sram_1[5]->s11
    sw s11, 44(s7) #s11->sram i/o
    
    #butterfly 6
    lw s11, 24(s2) #sram_1[6]->s11
    sw s11, 52(s7) #s11->sram i/o
    
    #butterfly 7
    lw s11, 28(s2) #sram_1[7]->s11
    sw s11, 60(s7) #s11->sram i/o
    
    #butterfly 8
    lw s11, 32(s2) #sram_1[8]->s11
    sw s11, 68(s7) #s11->sram i/o
    
    #butterfly 9
    lw s11, 36(s2) #sram_1[9]->s11
    sw s11, 76(s7) #s11->sram i/o
    
    #butterfly 10
    lw s11, 40(s2) #sram_1[10]->s11
    sw s11, 84(s7) #s11->sram i/o
    
    #butterfly 11
    lw s11, 44(s2) #sram_1[11]->s11
    sw s11, 92(s7) #s11->sram i/o
    
    #butterfly 12
    lw s11, 48(s2) #sram_1[12]->s11
    sw s11, 100(s7) #s11->sram i/o
    
    #butterfly 13
    lw s11, 52(s2) #sram_1[13]->s11
    sw s11, 108(s7) #s11->sram i/o
    
    #butterfly 14
    lw s11, 56(s2) #sram_1[14]->s11
    sw s11, 116(s7) #s11->sram i/o
    
    #butterfly 15
    lw s11, 60(s2) #sram_1[15]->s11
    sw s11, 124(s7) #s11->sram i/o
    
    #butterfly 16
    lw s11, 64(s2) #sram_1[16]->s11
    sw s11, 132(s7) #s11->sram i/o
    
    #butterfly 17
    lw s11, 68(s2) #sram_1[17]->s11
    sw s11, 140(s7) #s11->sram i/o
    
    #butterfly 18
    lw s11, 72(s2) #sram_1[18]->s11
    sw s11, 148(s7) #s11->sram i/o
    
    #butterfly 19
    lw s11, 76(s2) #sram_1[19]->s11
    sw s11, 156(s7) #s11->sram i/o
    
    #butterfly 20
    lw s11, 80(s2) #sram_1[20]->s11
    sw s11, 164(s7) #s11->sram i/o
    
    #butterfly 21
    lw s11, 84(s2) #sram_1[21]->s11
    sw s11, 172(s7) #s11->sram i/o
    
    #butterfly 22
    lw s11, 88(s2) #sram_1[22]->s11
    sw s11, 180(s7) #s11->sram i/o
    
    #butterfly 23
    lw s11, 92(s2) #sram_1[23]->s11
    sw s11, 188(s7) #s11->sram i/o
    
    #butterfly 24
    lw s11, 96(s2) #sram_1[24]->s11
    sw s11, 196(s7) #s11->sram i/o
    
    #butterfly 25
    lw s11, 100(s2) #sram_1[25]->s11
    sw s11, 204(s7) #s11->sram i/o
    
    #butterfly 26
    lw s11, 104(s2) #sram_1[26]->s11
    sw s11, 212(s7) #s11->sram i/o
    
    #butterfly 27
    lw s11, 108(s2) #sram_1[27]->s11
    sw s11, 220(s7) #s11->sram i/o
    
    #butterfly 28
    lw s11, 112(s2) #sram_1[28]->s11
    sw s11, 228(s7) #s11->sram i/o
    
    #butterfly 29
    lw s11, 116(s2) #sram_1[29]->s11
    sw s11, 236(s7) #s11->sram i/o
    
    #butterfly 30
    lw s11, 120(s2) #sram_1[30]->s11
    sw s11, 244(s7) #s11->sram i/o
    
    #butterfly 31
    lw s11, 124(s2) #sram_1[31]->s11
    sw s11, 252(s7) #s11->sram i/o
#set2
    addi s0,s0,256
    addi s7,s7,256
#stage0:

# Butterfly 0
    lw      t0, 0(s0)       # d0(SRAM I/O->t0)
    lw      t1, 128(s0)     # d1(SRAM I/O->t1)
    sw      t0, 0(s1)       # d0(t0->SRAM_0)
    sw      t1, 0(s2)       # d1(t1->SRAM_1)
    addi    x0, x0, 1       # dummy
    
    # Butterfly 1
    lw      t0, 64(s0)      # d0(SRAM I/O->t0)
    lw      t1, 192(s0)     # d1(SRAM I/O->t1)
    sw      t0, 4(s1)       # d0(t0->SRAM_0)
    sw      t1, 4(s2)       # d1(t1->SRAM_1)
    addi    x0, x0, 1       # dummy

    # Butterfly 2
    lw      t0, 32(s0)      # d0(SRAM I/O->t0)
    lw      t1, 160(s0)     # d1(SRAM I/O->t1)
    sw      t0, 8(s1)       # d0(t0->SRAM_0)
    sw      t1, 8(s2)       # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy


    # Butterfly 3
    lw      t0, 96(s0)      # d0(SRAM I/O->t0)
    lw      t1, 224(s0)     # d1(SRAM I/O->t1)
    sw      t0, 12(s1)      # d0(t0->SRAM_0)
    sw      t1, 12(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy


    # Butterfly 4
    lw      t0, 16(s0)      # d0(SRAM I/O->t0)
    lw      t1, 144(s0)     # d1(SRAM I/O->t1)
    sw      t0, 16(s1)      # d0(t0->SRAM_0)
    sw      t1, 16(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 5
    lw      t0, 80(s0)      # d0(SRAM I/O->t0)
    lw      t1, 208(s0)     # d1(SRAM I/O->t1)
    sw      t0, 20(s1)      # d0(t0->SRAM_0)
    sw      t1, 20(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 6
    lw      t0, 48(s0)      # d0(SRAM I/O->t0)
    lw      t1, 176(s0)     # d1(SRAM I/O->t1)
    sw      t0, 24(s1)      # d0(t0->SRAM_0)
    sw      t1, 24(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 7
    lw      t0, 112(s0)     # d0(SRAM I/O->t0)
    lw      t1, 240(s0)     # d1(SRAM I/O->t1)
    sw      t0, 28(s1)      # d0(t0->SRAM_0)
    sw      t1, 28(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 8
    lw      t0, 8(s0)       # d0(SRAM I/O->t0)
    lw      t1, 136(s0)     # d1(SRAM I/O->t1)
    sw      t0, 32(s1)      # d0(t0->SRAM_0)
    sw      t1, 32(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 9
    lw      t0, 72(s0)      # d0(SRAM I/O->t0)
    lw      t1, 200(s0)     # d1(SRAM I/O->t1)
    sw      t0, 36(s1)      # d0(t0->SRAM_0)
    sw      t1, 36(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 10
    lw      t0, 40(s0)      # d0(SRAM I/O->t0)
    lw      t1, 168(s0)     # d1(SRAM I/O->t1)
    sw      t0, 40(s1)      # d0(t0->SRAM_0)
    sw      t1, 40(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 11
    lw      t0, 104(s0)     # d0(SRAM I/O->t0)
    lw      t1, 232(s0)     # d1(SRAM I/O->t1)
    sw      t0, 44(s1)      # d0(t0->SRAM_0)
    sw      t1, 44(s2)      # d1(t1->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 12
    lw      t0, 24(s0)      # d0(SRAM I/O->t0)
    lw      t1, 152(s0)     # d1(SRAM I/O->t1)
    sw      t0, 48(s1)      # d0(t0->SRAM_0)
    sw      t1, 48(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 13
    lw      t0, 88(s0)      # d0(SRAM I/O->t0)
    lw      t1, 216(s0)     # d1(SRAM I/O->t1)
    sw      t0, 52(s1)      # d0(t0->SRAM_0)
    sw      t1, 52(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 14
    lw      t0, 56(s0)      # d0(SRAM I/O->t0)
    lw      t1, 184(s0)     # d1(SRAM I/O->t1)
    sw      t0, 56(s1)      # d0(t0->SRAM_0)
    sw      t1, 56(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 15
    lw      t0, 120(s0)     # d0(SRAM I/O->t0)
    lw      t1, 248(s0)     # d1(SRAM I/O->t1)
    sw      t0, 60(s1)      # d0(t0->SRAM_0)
    sw      t1, 60(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 16
    lw      t0, 4(s0)       # d0(SRAM I/O->t0)
    lw      t1, 132(s0)     # d1(SRAM I/O->t1)
    sw      t0, 64(s1)      # d0(t0->SRAM_0)
    sw      t1, 64(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 17
    lw      t0, 68(s0)      # d0(SRAM I/O->t0)
    lw      t1, 196(s0)     # d1(SRAM I/O->t1)
    sw      t0, 68(s1)      # d0(t0->SRAM_0)
    sw      t1, 68(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 18
    lw      t0, 36(s0)      # d0(SRAM I/O->t0)
    lw      t1, 164(s0)     # d1(SRAM I/O->t1)
    sw      t0, 72(s1)      # d0(t0->SRAM_0)
    sw      t1, 72(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 19
    lw      t0, 100(s0)     # d0(SRAM I/O->t0)
    lw      t1, 228(s0)     # d1(SRAM I/O->t1)
    sw      t0, 76(s1)      # d0(t0->SRAM_0)
    sw      t1, 76(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 20
    lw      t0, 20(s0)      # d0(SRAM I/O->t0)
    lw      t1, 148(s0)     # d1(SRAM I/O->t1)
    sw      t0, 80(s1)      # d0(t0->SRAM_0)
    sw      t1, 80(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 21
    lw      t0, 84(s0)      # d0(SRAM I/O->t0)
    lw      t1, 212(s0)     # d1(SRAM I/O->t1)
    sw      t0, 84(s1)      # d0(t0->SRAM_0)
    sw      t1, 84(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 22
    lw      t0, 52(s0)      # d0(SRAM I/O->t0)
    lw      t1, 180(s0)     # d1(SRAM I/O->t1)
    sw      t0, 88(s1)      # d0(t0->SRAM_0)
    sw      t1, 88(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 23
    lw      t0, 116(s0)     # d0(SRAM I/O->t0)
    lw      t1, 244(s0)     # d1(SRAM I/O->t1)
    sw      t0, 92(s1)      # d0(t0->SRAM_0)
    sw      t1, 92(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 24
    lw      t0, 12(s0)      # d0(SRAM I/O->t0)
    lw      t1, 140(s0)     # d1(SRAM I/O->t1)
    sw      t0, 96(s1)      # d0(t0->SRAM_0)
    sw      t1, 96(s2)      # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 25
    lw      t0, 76(s0)      # d0(SRAM I/O->t0)
    lw      t1, 204(s0)     # d1(SRAM I/O->t1)
    sw      t0, 100(s1)     # d0(t0->SRAM_0)
    sw      t1, 100(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 26
    lw      t0, 44(s0)      # d0(SRAM I/O->t0)
    lw      t1, 172(s0)     # d1(SRAM I/O->t1)
    sw      t0, 104(s1)     # d0(t0->SRAM_0)
    sw      t1, 104(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 27
    lw      t0, 108(s0)     # d0(SRAM I/O->t0)
    lw      t1, 236(s0)     # d1(SRAM I/O->t1)
    sw      t0, 108(s1)     # d0(t0->SRAM_0)
    sw      t1, 108(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 28
    lw      t0, 28(s0)      # d0(SRAM I/O->t0)
    lw      t1, 156(s0)     # d1(SRAM I/O->t1)
    sw      t0, 112(s1)     # d0(t0->SRAM_0)
    sw      t1, 112(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 29
    lw      t0, 92(s0)      # d0(SRAM I/O->t0)
    lw      t1, 220(s0)     # d1(SRAM I/O->t1)
    sw      t0, 116(s1)     # d0(t0->SRAM_0)
    sw      t1, 116(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 30
    lw      t0, 60(s0)      # d0(SRAM I/O->t0)
    lw      t1, 188(s0)     # d1(SRAM I/O->t1)
    sw      t0, 120(s1)     # d0(t0->SRAM_0)
    sw      t1, 120(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy

    # Butterfly 31
    lw      t0, 124(s0)     # d0(SRAM I/O->t0)
    lw      t1, 252(s0)     # d1(SRAM I/O->t1)
    sw      t0, 124(s1)     # d0(t0->SRAM_0)
    sw      t1, 124(s2)     # d1(t1->SRAM_1)
     addi    x0, x0,  1      # dummy


    # Synchronization cycles
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy


    #160+8 = 168 글자수세기로 326 (168+128)

# ========== STAGE 1: 32 butterfly operations ==========
# Pattern: wait 4 cycles, t
#stage1:
    # Initial wait cycles
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy

    
    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 4(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 4(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    #--
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

#stage1: 130개, 글자수세기로는 196 (130+64)


# ========== STAGE 2: 32 butterfly operations ==========
#stage2:
    
    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 8(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 8(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 12(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    #--
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 3: 32 butterfly operations ==========
#stage3:

    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 16(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 16(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 20(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 24(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 28(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 4: 32 butterfly operations ==========
#stage4:

    # Butterfly operations (32 total)
    
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 32(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 32(s2)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s1)       # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 36(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 40(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 44(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 48(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 52(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 56(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 60(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy
    
    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 5: 32 butterfly operations with output to SRAM I/O ==========
#stage5:
    # Butterfly 0
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 64(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 1
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 64(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 2
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 3
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 68(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 4
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 5
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 72(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 6
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 7
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 76(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 8
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 9
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 80(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 10
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 11
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 84(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 12
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 13
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 88(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 14
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 15
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 92(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 16
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s1)      # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 17
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 96(s2)      # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 18
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 19
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 100(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 20
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 21
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 104(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 22
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 23
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 108(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 24
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 25
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 112(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 26
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 27
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 116(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 28
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 29
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 120(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

    # Butterfly 30
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s1)     # o_d1(t6->SRAM_0)
    addi    x0, x0,  1      # dummy

    # Butterfly 31
    lw      t6, 4(s5)       # o_d1(dpath1->t6)
    sw      t6, 124(s2)     # o_d1(t6->SRAM_1)
    addi    x0, x0,  1      # dummy

# ========== STAGE 5 OUTPUT STORE: Load from SRAM and store to SRAM I/O ==========
#stage5_output:
        #butterfly 0
    addi x0, x0, 0 #dummy
    lw s11, 0(s2) #sram_1[0]->s11
    sw s11, 4(s7) #s11->sram i/o
    
    #butterfly 1
    lw s11, 4(s2) #sram_1[1]->s11
    sw s11, 12(s7) #s11->sram i/o
    
    #butterfly 2
    lw s11, 8(s2) #sram_1[2]->s11
    sw s11, 20(s7) #s11->sram i/o
    
    #butterfly 3
    lw s11, 12(s2) #sram_1[3]->s11
    sw s11, 28(s7) #s11->sram i/o
    
    #butterfly 4
    lw s11, 16(s2) #sram_1[4]->s11
    sw s11, 36(s7) #s11->sram i/o
    
    #butterfly 5
    lw s11, 20(s2) #sram_1[5]->s11
    sw s11, 44(s7) #s11->sram i/o
    
    #butterfly 6
    lw s11, 24(s2) #sram_1[6]->s11
    sw s11, 52(s7) #s11->sram i/o
    
    #butterfly 7
    lw s11, 28(s2) #sram_1[7]->s11
    sw s11, 60(s7) #s11->sram i/o
    
    #butterfly 8
    lw s11, 32(s2) #sram_1[8]->s11
    sw s11, 68(s7) #s11->sram i/o
    
    #butterfly 9
    lw s11, 36(s2) #sram_1[9]->s11
    sw s11, 76(s7) #s11->sram i/o
    
    #butterfly 10
    lw s11, 40(s2) #sram_1[10]->s11
    sw s11, 84(s7) #s11->sram i/o
    
    #butterfly 11
    lw s11, 44(s2) #sram_1[11]->s11
    sw s11, 92(s7) #s11->sram i/o
    
    #butterfly 12
    lw s11, 48(s2) #sram_1[12]->s11
    sw s11, 100(s7) #s11->sram i/o
    
    #butterfly 13
    lw s11, 52(s2) #sram_1[13]->s11
    sw s11, 108(s7) #s11->sram i/o
    
    #butterfly 14
    lw s11, 56(s2) #sram_1[14]->s11
    sw s11, 116(s7) #s11->sram i/o
    
    #butterfly 15
    lw s11, 60(s2) #sram_1[15]->s11
    sw s11, 124(s7) #s11->sram i/o
    
    #butterfly 16
    lw s11, 64(s2) #sram_1[16]->s11
    sw s11, 132(s7) #s11->sram i/o
    
    #butterfly 17
    lw s11, 68(s2) #sram_1[17]->s11
    sw s11, 140(s7) #s11->sram i/o
    
    #butterfly 18
    lw s11, 72(s2) #sram_1[18]->s11
    sw s11, 148(s7) #s11->sram i/o
    
    #butterfly 19
    lw s11, 76(s2) #sram_1[19]->s11
    sw s11, 156(s7) #s11->sram i/o
    
    #butterfly 20
    lw s11, 80(s2) #sram_1[20]->s11
    sw s11, 164(s7) #s11->sram i/o
    
    #butterfly 21
    lw s11, 84(s2) #sram_1[21]->s11
    sw s11, 172(s7) #s11->sram i/o
    
    #butterfly 22
    lw s11, 88(s2) #sram_1[22]->s11
    sw s11, 180(s7) #s11->sram i/o
    
    #butterfly 23
    lw s11, 92(s2) #sram_1[23]->s11
    sw s11, 188(s7) #s11->sram i/o
    
    #butterfly 24
    lw s11, 96(s2) #sram_1[24]->s11
    sw s11, 196(s7) #s11->sram i/o
    
    #butterfly 25
    lw s11, 100(s2) #sram_1[25]->s11
    sw s11, 204(s7) #s11->sram i/o
    
    #butterfly 26
    lw s11, 104(s2) #sram_1[26]->s11
    sw s11, 212(s7) #s11->sram i/o
    
    #butterfly 27
    lw s11, 108(s2) #sram_1[27]->s11
    sw s11, 220(s7) #s11->sram i/o
    
    #butterfly 28
    lw s11, 112(s2) #sram_1[28]->s11
    sw s11, 228(s7) #s11->sram i/o
    
    #butterfly 29
    lw s11, 116(s2) #sram_1[29]->s11
    sw s11, 236(s7) #s11->sram i/o
    
    #butterfly 30
    lw s11, 120(s2) #sram_1[30]->s11
    sw s11, 244(s7) #s11->sram i/o
    
    #butterfly 31
    lw s11, 124(s2) #sram_1[31]->s11
    sw s11, 252(s7) #s11->sram i/o
# ========== End ==========
end:
    # Infinite loop to stop execution
end_loop:
    j       end_loop
