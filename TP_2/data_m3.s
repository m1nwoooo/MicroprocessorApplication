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
    lui     s1,     0x01000          # SRAM 0 base
    lui     s2,     0x02000          # SRAM 1 base
    lui     s4,     0x05000          # Dpath port 0
    lui     s5,     0x06000          # Dpath port 1
    lui     s1,     0x01000
    lui     s7,     0x00000          # output base
    addi    s7,     s0,     0x400    # output base
    lui     s3,     0x03000          # dummy
# ========== #stage 0: Process 32 butterfly operations ==========
stage0:
    # Wait for initial data to be ready (4 dummy cycles)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

    
    # Butterfly 0
    lw      t2, 0(s1)       # d0(SRAM_0->t2)
    lw      t3, 0(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    
    # Butterfly 1
    lw      t2, 4(s1)       # d0(SRAM_0->t2)
    lw      t3, 4(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 2
    lw      t2, 8(s1)       # d0(SRAM_0->t2)
    lw      t3, 8(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 3
    lw      t2, 12(s1)      # d0(SRAM_0->t2)
    lw      t3, 12(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 4
    lw      t2, 16(s1)      # d0(SRAM_0->t2)
    lw      t3, 16(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 5
    lw      t2, 20(s1)      # d0(SRAM_0->t2)
    lw      t3, 20(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 6
    lw      t2, 24(s1)      # d0(SRAM_0->t2)
    lw      t3, 24(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 7
    lw      t2, 28(s1)      # d0(SRAM_0->t2)
    lw      t3, 28(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 8
    lw      t2, 32(s1)      # d0(SRAM_0->t2)
    lw      t3, 32(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 9
    lw      t2, 36(s1)      # d0(SRAM_0->t2)
    lw      t3, 36(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 10
    lw      t2, 40(s1)      # d0(SRAM_0->t2)
    lw      t3, 40(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 11
    lw      t2, 44(s1)      # d0(SRAM_0->t2)
    lw      t3, 44(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 12
    lw      t2, 48(s1)      # d0(SRAM_0->t2)
    lw      t3, 48(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 13
    lw      t2, 52(s1)      # d0(SRAM_0->t2)
    lw      t3, 52(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 14
    lw      t2, 56(s1)      # d0(SRAM_0->t2)
    lw      t3, 56(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 15
    lw      t2, 60(s1)      # d0(SRAM_0->t2)
    lw      t3, 60(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 16
    lw      t2, 64(s1)      # d0(SRAM_0->t2)
    lw      t3, 64(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 17
    lw      t2, 68(s1)      # d0(SRAM_0->t2)
    lw      t3, 68(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 18
    lw      t2, 72(s1)      # d0(SRAM_0->t2)
    lw      t3, 72(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 19
    lw      t2, 76(s1)      # d0(SRAM_0->t2)
    lw      t3, 76(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 20
    lw      t2, 80(s1)      # d0(SRAM_0->t2)
    lw      t3, 80(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 21
    lw      t2, 84(s1)      # d0(SRAM_0->t2)
    lw      t3, 84(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 22
    lw      t2, 88(s1)      # d0(SRAM_0->t2)
    lw      t3, 88(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 23
    lw      t2, 92(s1)      # d0(SRAM_0->t2)
    lw      t3, 92(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 24
    lw      t2, 96(s1)      # d0(SRAM_0->t2)
    lw      t3, 96(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 25
    lw      t2, 100(s1)     # d0(SRAM_0->t2)
    lw      t3, 100(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 26
    lw      t2, 104(s1)     # d0(SRAM_0->t2)
    lw      t3, 104(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

    
    # Butterfly 27
    lw      t2, 108(s1)     # d0(SRAM_0->t2)
    lw      t3, 108(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 28
    lw      t2, 112(s1)     # d0(SRAM_0->t2)
    lw      t3, 112(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 29
    lw      t2, 116(s1)     # d0(SRAM_0->t2)
    lw      t3, 116(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



    # Butterfly 30
    lw      t2, 120(s1)     # d0(SRAM_0->t2)
    lw      t3, 120(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



    # Butterfly 31
    lw      t2, 124(s1)     # d0(SRAM_0->t2)
    lw      t3, 124(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Final synchronization for #stage 0
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



# ========== #stage 1: Process 32 butterfly operations ==========
##stage1:

    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 4(s1)      # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 4(s2)      # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 12(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 3
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 12(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 20(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 20(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 36(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 36(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 12
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 14
    lw t2, 56(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 15
    lw t2, 56(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 68(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 68(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 18
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 21
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 88(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 23
    lw t2, 88(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 104(s1)    # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 27
    lw t2, 104(s2)    # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 28
    lw t2, 112(s1)    # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 29
    lw t2, 112(s2)    # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 30
    lw t2, 120(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 31
    lw t2, 120(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)



# ========== #stage 2: Process 32 butterfly operations ==========
#stage2:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 8(s1)      # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 8(s2)      # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 12(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 12(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 4
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 24(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 24(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 40(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 40(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 14
    lw t2, 52(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 15
    lw t2, 52(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 72(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 72(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 20
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 21
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 84(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 23
    lw t2, 84(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 100(s1)    # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 27
    lw t2, 100(s2)    # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 112(s1)    # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 29
    lw t2, 112(s2)    # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 30
    lw t2, 116(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 116(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)


# ========== #stage 3: Process 32 butterfly operations ==========
#stage3:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 16(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 16(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 20(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 20(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 24(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 24(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 48(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 48(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 11
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 12
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 13
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 44(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 15
    lw t2, 44(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 80(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 80(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 21
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 22
    lw t2, 76(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 23
    lw t2, 76(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 100(s1)    # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 27
    lw t2, 100(s2)    # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 28
    lw t2, 104(s1)    # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 29
    lw t2, 104(s2)    # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 108(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 108(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)


# ========== #stage 4: Process 32 butterfly operations ==========
#stage4:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 32(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 32(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 36(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 36(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 40(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 40(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 8
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 48(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 48(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 10
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 28(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 15
    lw t2, 28(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 96(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 96(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 21
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 76(s1)     # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 23
    lw t2, 76(s2)     # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 24
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 26
    lw t2, 84(s1)     # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 27
    lw t2, 84(s2)     # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 88(s1)     # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 29
    lw t2, 88(s2)     # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 92(s1)     # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 92(s2)     # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

# ========== #stage 5: Process 32 butterfly operations ==========
#stage5:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 64(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
     
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 64(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 68(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 68(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 72(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 72(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
      
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 80(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 9
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 80(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 10
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 11
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 13
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 28(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 15 
    lw t2, 28(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
        
    # Butterfly 16
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 96(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 17
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 96(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 18
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 19
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
        
    # Butterfly 20
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 21
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 22
    lw t2, 44(s1)     # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 23
    lw t2, 44(s2)     # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
  
    # Butterfly 24
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 25
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 26
    lw t2, 52(s1)     # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 27
    lw t2, 52(s2)     # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 56(s1)     # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 29
    lw t2, 56(s2)     # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 60(s1)     # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 31
    lw t2, 60(s2)     # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    addi    x0,     x0,     0x0000      # dummy

        #butterfly 0
    lw s11, 0(s1) #sram_0[0]->s11
    sw s11, 0(s7) #s11->sram i/o
    
    #butterfly 1
    lw s11, 4(s1) #sram_0[1]->s11
    sw s11, 8(s7) #s11->sram i/o
    
    #butterfly 2
    lw s11, 8(s1) #sram_0[2]->s11
    sw s11, 16(s7) #s11->sram i/o
    
    #butterfly 3
    lw s11, 12(s1) #sram_0[3]->s11
    sw s11, 24(s7) #s11->sram i/o
    
    #butterfly 4
    lw s11, 16(s1) #sram_0[4]->s11
    sw s11, 32(s7) #s11->sram i/o
    
    #butterfly 5
    lw s11, 20(s1) #sram_0[5]->s11
    sw s11, 40(s7) #s11->sram i/o
    
    #butterfly 6
    lw s11, 24(s1) #sram_0[6]->s11
    sw s11, 48(s7) #s11->sram i/o
    
    #butterfly 7
    lw s11, 28(s1) #sram_0[7]->s11
    sw s11, 56(s7) #s11->sram i/o
    
    #butterfly 8
    lw s11, 32(s1) #sram_0[8]->s11
    sw s11, 64(s7) #s11->sram i/o
    
    #butterfly 9
    lw s11, 36(s1) #sram_0[9]->s11
    sw s11, 72(s7) #s11->sram i/o
    
    #butterfly 10
    lw s11, 40(s1) #sram_0[10]->s11
    sw s11, 80(s7) #s11->sram i/o
    
    #butterfly 11
    lw s11, 44(s1) #sram_0[11]->s11
    sw s11, 88(s7) #s11->sram i/o
    
    #butterfly 12
    lw s11, 48(s1) #sram_0[12]->s11
    sw s11, 96(s7) #s11->sram i/o
    
    #butterfly 13
    lw s11, 52(s1) #sram_0[13]->s11
    sw s11, 104(s7) #s11->sram i/o
    
    #butterfly 14
    lw s11, 56(s1) #sram_0[14]->s11
    sw s11, 112(s7) #s11->sram i/o
    
    #butterfly 15
    lw s11, 60(s1) #sram_0[15]->s11
    sw s11, 120(s7) #s11->sram i/o
    
    #butterfly 16
    lw s11, 64(s1) #sram_0[16]->s11
    sw s11, 128(s7) #s11->sram i/o
    
    #butterfly 17
    lw s11, 68(s1) #sram_0[17]->s11
    sw s11, 136(s7) #s11->sram i/o
    
    #butterfly 18
    lw s11, 72(s1) #sram_0[18]->s11
    sw s11, 144(s7) #s11->sram i/o
    
    #butterfly 19
    lw s11, 76(s1) #sram_0[19]->s11
    sw s11, 152(s7) #s11->sram i/o
    
    #butterfly 20
    lw s11, 80(s1) #sram_0[20]->s11
    sw s11, 160(s7) #s11->sram i/o
    
    #butterfly 21
    lw s11, 84(s1) #sram_0[21]->s11
    sw s11, 168(s7) #s11->sram i/o
    
    #butterfly 22
    lw s11, 88(s1) #sram_0[22]->s11
    sw s11, 176(s7) #s11->sram i/o
    
    #butterfly 23
    lw s11, 92(s1) #sram_0[23]->s11
    sw s11, 184(s7) #s11->sram i/o
    
    #butterfly 24
    lw s11, 96(s1) #sram_0[24]->s11
    sw s11, 192(s7) #s11->sram i/o
    
    #butterfly 25
    lw s11, 100(s1) #sram_0[25]->s11
    sw s11, 200(s7) #s11->sram i/o
    
    #butterfly 26
    lw s11, 104(s1) #sram_0[26]->s11
    sw s11, 208(s7) #s11->sram i/o
    
    #butterfly 27
    lw s11, 108(s1) #sram_0[27]->s11
    sw s11, 216(s7) #s11->sram i/o
    
    #butterfly 28
    lw s11, 112(s1) #sram_0[28]->s11
    sw s11, 224(s7) #s11->sram i/o
    
    #butterfly 29
    lw s11, 116(s1) #sram_0[29]->s11
    sw s11, 232(s7) #s11->sram i/o
    
    #butterfly 30
    lw s11, 120(s1) #sram_0[30]->s11
    sw s11, 240(s7) #s11->sram i/o
    
    #butterfly 31
    lw s11, 124(s1) #sram_0[31]->s11
    sw s11, 248(s7) #s11->sram i/o
    addi    x0,     x0,     0x0000      # dummy

    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

# ========== set0 End ==========
    addi    s0,     s0,     256            
    addi    s7,     s7,     256
#stage 0:
    # Wait for initial data to be ready (4 dummy cycles)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

    
    # Butterfly 0
    lw      t2, 0(s1)       # d0(SRAM_0->t2)
    lw      t3, 0(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    
    # Butterfly 1
    lw      t2, 4(s1)       # d0(SRAM_0->t2)
    lw      t3, 4(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 2
    lw      t2, 8(s1)       # d0(SRAM_0->t2)
    lw      t3, 8(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 3
    lw      t2, 12(s1)      # d0(SRAM_0->t2)
    lw      t3, 12(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 4
    lw      t2, 16(s1)      # d0(SRAM_0->t2)
    lw      t3, 16(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 5
    lw      t2, 20(s1)      # d0(SRAM_0->t2)
    lw      t3, 20(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 6
    lw      t2, 24(s1)      # d0(SRAM_0->t2)
    lw      t3, 24(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 7
    lw      t2, 28(s1)      # d0(SRAM_0->t2)
    lw      t3, 28(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 8
    lw      t2, 32(s1)      # d0(SRAM_0->t2)
    lw      t3, 32(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 9
    lw      t2, 36(s1)      # d0(SRAM_0->t2)
    lw      t3, 36(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 10
    lw      t2, 40(s1)      # d0(SRAM_0->t2)
    lw      t3, 40(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 11
    lw      t2, 44(s1)      # d0(SRAM_0->t2)
    lw      t3, 44(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 12
    lw      t2, 48(s1)      # d0(SRAM_0->t2)
    lw      t3, 48(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 13
    lw      t2, 52(s1)      # d0(SRAM_0->t2)
    lw      t3, 52(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 14
    lw      t2, 56(s1)      # d0(SRAM_0->t2)
    lw      t3, 56(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 15
    lw      t2, 60(s1)      # d0(SRAM_0->t2)
    lw      t3, 60(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 16
    lw      t2, 64(s1)      # d0(SRAM_0->t2)
    lw      t3, 64(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 17
    lw      t2, 68(s1)      # d0(SRAM_0->t2)
    lw      t3, 68(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 18
    lw      t2, 72(s1)      # d0(SRAM_0->t2)
    lw      t3, 72(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 19
    lw      t2, 76(s1)      # d0(SRAM_0->t2)
    lw      t3, 76(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 20
    lw      t2, 80(s1)      # d0(SRAM_0->t2)
    lw      t3, 80(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 21
    lw      t2, 84(s1)      # d0(SRAM_0->t2)
    lw      t3, 84(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 22
    lw      t2, 88(s1)      # d0(SRAM_0->t2)
    lw      t3, 88(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 23
    lw      t2, 92(s1)      # d0(SRAM_0->t2)
    lw      t3, 92(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 24
    lw      t2, 96(s1)      # d0(SRAM_0->t2)
    lw      t3, 96(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 25
    lw      t2, 100(s1)     # d0(SRAM_0->t2)
    lw      t3, 100(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 26
    lw      t2, 104(s1)     # d0(SRAM_0->t2)
    lw      t3, 104(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

    
    # Butterfly 27
    lw      t2, 108(s1)     # d0(SRAM_0->t2)
    lw      t3, 108(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 28
    lw      t2, 112(s1)     # d0(SRAM_0->t2)
    lw      t3, 112(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 29
    lw      t2, 116(s1)     # d0(SRAM_0->t2)
    lw      t3, 116(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



    # Butterfly 30
    lw      t2, 120(s1)     # d0(SRAM_0->t2)
    lw      t3, 120(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



    # Butterfly 31
    lw      t2, 124(s1)     # d0(SRAM_0->t2)
    lw      t3, 124(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Final synchronization for #stage 0
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



# ========== #stage 1: Process 32 butterfly operations ==========
##stage1:

    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 4(s1)      # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 4(s2)      # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 12(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 3
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 12(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 20(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 20(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 36(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 36(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 12
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 14
    lw t2, 56(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 15
    lw t2, 56(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 68(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 68(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 18
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 21
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 88(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 23
    lw t2, 88(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 104(s1)    # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 27
    lw t2, 104(s2)    # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 28
    lw t2, 112(s1)    # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 29
    lw t2, 112(s2)    # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 30
    lw t2, 120(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 31
    lw t2, 120(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)



# ========== #stage 2: Process 32 butterfly operations ==========
#stage2:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 8(s1)      # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 8(s2)      # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 12(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 12(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 4
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 24(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 24(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 40(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 40(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 14
    lw t2, 52(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 15
    lw t2, 52(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 72(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 72(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 20
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 21
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 84(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 23
    lw t2, 84(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 100(s1)    # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 27
    lw t2, 100(s2)    # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 112(s1)    # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 29
    lw t2, 112(s2)    # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 30
    lw t2, 116(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 116(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)


# ========== #stage 3: Process 32 butterfly operations ==========
#stage3:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 16(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 16(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 20(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 20(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 24(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 24(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 48(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 48(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 11
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 12
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 13
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 44(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 15
    lw t2, 44(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 80(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 80(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 21
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 22
    lw t2, 76(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 23
    lw t2, 76(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 100(s1)    # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 27
    lw t2, 100(s2)    # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 28
    lw t2, 104(s1)    # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 29
    lw t2, 104(s2)    # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 108(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 108(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)


# ========== #stage 4: Process 32 butterfly operations ==========
#stage4:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 32(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 32(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 36(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 36(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 40(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 40(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 8
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 48(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 48(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 10
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 28(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 15
    lw t2, 28(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 96(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 96(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 21
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 76(s1)     # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 23
    lw t2, 76(s2)     # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 24
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 26
    lw t2, 84(s1)     # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 27
    lw t2, 84(s2)     # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 88(s1)     # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 29
    lw t2, 88(s2)     # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 92(s1)     # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 92(s2)     # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

# ========== #stage 5: Process 32 butterfly operations ==========
#stage5:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 64(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
     
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 64(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 68(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 68(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 72(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 72(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
      
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 80(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 9
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 80(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 10
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 11
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 13
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 28(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 15 
    lw t2, 28(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
        
    # Butterfly 16
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 96(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 17
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 96(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 18
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 19
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
        
    # Butterfly 20
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 21
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 22
    lw t2, 44(s1)     # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 23
    lw t2, 44(s2)     # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
  
    # Butterfly 24
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 25
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 26
    lw t2, 52(s1)     # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 27
    lw t2, 52(s2)     # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 56(s1)     # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 29
    lw t2, 56(s2)     # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 60(s1)     # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 31
    lw t2, 60(s2)     # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    addi    x0,     x0,     0x0000      # dummy

        #butterfly 0
    lw s11, 0(s1) #sram_0[0]->s11
    sw s11, 0(s7) #s11->sram i/o
    
    #butterfly 1
    lw s11, 4(s1) #sram_0[1]->s11
    sw s11, 8(s7) #s11->sram i/o
    
    #butterfly 2
    lw s11, 8(s1) #sram_0[2]->s11
    sw s11, 16(s7) #s11->sram i/o
    
    #butterfly 3
    lw s11, 12(s1) #sram_0[3]->s11
    sw s11, 24(s7) #s11->sram i/o
    
    #butterfly 4
    lw s11, 16(s1) #sram_0[4]->s11
    sw s11, 32(s7) #s11->sram i/o
    
    #butterfly 5
    lw s11, 20(s1) #sram_0[5]->s11
    sw s11, 40(s7) #s11->sram i/o
    
    #butterfly 6
    lw s11, 24(s1) #sram_0[6]->s11
    sw s11, 48(s7) #s11->sram i/o
    
    #butterfly 7
    lw s11, 28(s1) #sram_0[7]->s11
    sw s11, 56(s7) #s11->sram i/o
    
    #butterfly 8
    lw s11, 32(s1) #sram_0[8]->s11
    sw s11, 64(s7) #s11->sram i/o
    
    #butterfly 9
    lw s11, 36(s1) #sram_0[9]->s11
    sw s11, 72(s7) #s11->sram i/o
    
    #butterfly 10
    lw s11, 40(s1) #sram_0[10]->s11
    sw s11, 80(s7) #s11->sram i/o
    
    #butterfly 11
    lw s11, 44(s1) #sram_0[11]->s11
    sw s11, 88(s7) #s11->sram i/o
    
    #butterfly 12
    lw s11, 48(s1) #sram_0[12]->s11
    sw s11, 96(s7) #s11->sram i/o
    
    #butterfly 13
    lw s11, 52(s1) #sram_0[13]->s11
    sw s11, 104(s7) #s11->sram i/o
    
    #butterfly 14
    lw s11, 56(s1) #sram_0[14]->s11
    sw s11, 112(s7) #s11->sram i/o
    
    #butterfly 15
    lw s11, 60(s1) #sram_0[15]->s11
    sw s11, 120(s7) #s11->sram i/o
    
    #butterfly 16
    lw s11, 64(s1) #sram_0[16]->s11
    sw s11, 128(s7) #s11->sram i/o
    
    #butterfly 17
    lw s11, 68(s1) #sram_0[17]->s11
    sw s11, 136(s7) #s11->sram i/o
    
    #butterfly 18
    lw s11, 72(s1) #sram_0[18]->s11
    sw s11, 144(s7) #s11->sram i/o
    
    #butterfly 19
    lw s11, 76(s1) #sram_0[19]->s11
    sw s11, 152(s7) #s11->sram i/o
    
    #butterfly 20
    lw s11, 80(s1) #sram_0[20]->s11
    sw s11, 160(s7) #s11->sram i/o
    
    #butterfly 21
    lw s11, 84(s1) #sram_0[21]->s11
    sw s11, 168(s7) #s11->sram i/o
    
    #butterfly 22
    lw s11, 88(s1) #sram_0[22]->s11
    sw s11, 176(s7) #s11->sram i/o
    
    #butterfly 23
    lw s11, 92(s1) #sram_0[23]->s11
    sw s11, 184(s7) #s11->sram i/o
    
    #butterfly 24
    lw s11, 96(s1) #sram_0[24]->s11
    sw s11, 192(s7) #s11->sram i/o
    
    #butterfly 25
    lw s11, 100(s1) #sram_0[25]->s11
    sw s11, 200(s7) #s11->sram i/o
    
    #butterfly 26
    lw s11, 104(s1) #sram_0[26]->s11
    sw s11, 208(s7) #s11->sram i/o
    
    #butterfly 27
    lw s11, 108(s1) #sram_0[27]->s11
    sw s11, 216(s7) #s11->sram i/o
    
    #butterfly 28
    lw s11, 112(s1) #sram_0[28]->s11
    sw s11, 224(s7) #s11->sram i/o
    
    #butterfly 29
    lw s11, 116(s1) #sram_0[29]->s11
    sw s11, 232(s7) #s11->sram i/o
    
    #butterfly 30
    lw s11, 120(s1) #sram_0[30]->s11
    sw s11, 240(s7) #s11->sram i/o
    
    #butterfly 31
    lw s11, 124(s1) #sram_0[31]->s11
    sw s11, 248(s7) #s11->sram i/o
    addi    x0,     x0,     0x0000      # dummy

    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
# ========== set1 End ==========
    addi    s0,     s0,     256            
    addi    s7,     s7,     256
    # Wait for initial data to be ready (4 dummy cycles)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

    
    # Butterfly 0
    lw      t2, 0(s1)       # d0(SRAM_0->t2)
    lw      t3, 0(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    
    # Butterfly 1
    lw      t2, 4(s1)       # d0(SRAM_0->t2)
    lw      t3, 4(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 2
    lw      t2, 8(s1)       # d0(SRAM_0->t2)
    lw      t3, 8(s2)       # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 3
    lw      t2, 12(s1)      # d0(SRAM_0->t2)
    lw      t3, 12(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 4
    lw      t2, 16(s1)      # d0(SRAM_0->t2)
    lw      t3, 16(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 5
    lw      t2, 20(s1)      # d0(SRAM_0->t2)
    lw      t3, 20(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 6
    lw      t2, 24(s1)      # d0(SRAM_0->t2)
    lw      t3, 24(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 7
    lw      t2, 28(s1)      # d0(SRAM_0->t2)
    lw      t3, 28(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 8
    lw      t2, 32(s1)      # d0(SRAM_0->t2)
    lw      t3, 32(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 9
    lw      t2, 36(s1)      # d0(SRAM_0->t2)
    lw      t3, 36(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 10
    lw      t2, 40(s1)      # d0(SRAM_0->t2)
    lw      t3, 40(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 11
    lw      t2, 44(s1)      # d0(SRAM_0->t2)
    lw      t3, 44(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 12
    lw      t2, 48(s1)      # d0(SRAM_0->t2)
    lw      t3, 48(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 13
    lw      t2, 52(s1)      # d0(SRAM_0->t2)
    lw      t3, 52(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 14
    lw      t2, 56(s1)      # d0(SRAM_0->t2)
    lw      t3, 56(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 15
    lw      t2, 60(s1)      # d0(SRAM_0->t2)
    lw      t3, 60(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 16
    lw      t2, 64(s1)      # d0(SRAM_0->t2)
    lw      t3, 64(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 17
    lw      t2, 68(s1)      # d0(SRAM_0->t2)
    lw      t3, 68(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 18
    lw      t2, 72(s1)      # d0(SRAM_0->t2)
    lw      t3, 72(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 19
    lw      t2, 76(s1)      # d0(SRAM_0->t2)
    lw      t3, 76(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 20
    lw      t2, 80(s1)      # d0(SRAM_0->t2)
    lw      t3, 80(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 21
    lw      t2, 84(s1)      # d0(SRAM_0->t2)
    lw      t3, 84(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 22
    lw      t2, 88(s1)      # d0(SRAM_0->t2)
    lw      t3, 88(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 23
    lw      t2, 92(s1)      # d0(SRAM_0->t2)
    lw      t3, 92(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 24
    lw      t2, 96(s1)      # d0(SRAM_0->t2)
    lw      t3, 96(s2)      # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 25
    lw      t2, 100(s1)     # d0(SRAM_0->t2)
    lw      t3, 100(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 26
    lw      t2, 104(s1)     # d0(SRAM_0->t2)
    lw      t3, 104(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy

    
    # Butterfly 27
    lw      t2, 108(s1)     # d0(SRAM_0->t2)
    lw      t3, 108(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 28
    lw      t2, 112(s1)     # d0(SRAM_0->t2)
    lw      t3, 112(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Butterfly 29
    lw      t2, 116(s1)     # d0(SRAM_0->t2)
    lw      t3, 116(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



    # Butterfly 30
    lw      t2, 120(s1)     # d0(SRAM_0->t2)
    lw      t3, 120(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



    # Butterfly 31
    lw      t2, 124(s1)     # d0(SRAM_0->t2)
    lw      t3, 124(s2)     # d1(SRAM_1->t3)
    sw      t2, 0(s4)       # d0(t2->dpath0)
    sw      t3, 0(s5)       # d1(t3->dpath1)
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy


    # Final synchronization for #stage 0
    addi    x0,     x0,     0x0000      # dummy
    addi    x0,     x0,     0x0000      # dummy



# ========== #stage 1: Process 32 butterfly operations ==========
##stage1:

    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 4(s1)      # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 4(s2)      # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 12(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 3
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 12(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 20(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 20(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 36(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 36(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 12
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 14
    lw t2, 56(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 15
    lw t2, 56(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 68(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 68(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 18
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 21
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 88(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 23
    lw t2, 88(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 104(s1)    # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 27
    lw t2, 104(s2)    # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 28
    lw t2, 112(s1)    # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 29
    lw t2, 112(s2)    # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 30
    lw t2, 120(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 31
    lw t2, 120(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)



# ========== #stage 2: Process 32 butterfly operations ==========
#stage2:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 8(s1)      # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 8(s2)      # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 12(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 12(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 4
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 24(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 24(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 40(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 40(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 14
    lw t2, 52(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 15
    lw t2, 52(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 72(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 72(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 20
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 21
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 84(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 23
    lw t2, 84(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 100(s1)    # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 27
    lw t2, 100(s2)    # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 112(s1)    # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 29
    lw t2, 112(s2)    # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 30
    lw t2, 116(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 116(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)


# ========== #stage 3: Process 32 butterfly operations ==========
#stage3:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 16(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 16(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 20(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 20(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 24(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 24(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 28(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 28(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 48(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 48(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 10
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 11
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 12
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 13
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 44(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 15
    lw t2, 44(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 80(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 80(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 21
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 22
    lw t2, 76(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 23
    lw t2, 76(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 24
    lw t2, 96(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 96(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 26
    lw t2, 100(s1)    # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 27
    lw t2, 100(s2)    # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 28
    lw t2, 104(s1)    # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 29
    lw t2, 104(s2)    # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 108(s1)    # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 108(s2)    # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)


# ========== #stage 4: Process 32 butterfly operations ==========
#stage4:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 32(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 32(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 36(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 36(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 40(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 40(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 44(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 44(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 8
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 48(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 9
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 48(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 10
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 52(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 11
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 52(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 56(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 13
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 56(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 28(s1)     # d0(SRAM_0->t2)
    lw t3, 60(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    # Butterfly 15
    lw t2, 28(s2)     # d0(SRAM_1->t2)
    lw t3, 60(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 16
    lw t2, 64(s1)     # d0(SRAM_0->t2)
    lw t3, 96(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 17
    lw t2, 64(s2)     # d0(SRAM_1->t2)
    lw t3, 96(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 18
    lw t2, 68(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 19
    lw t2, 68(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 20
    lw t2, 72(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 21
    lw t2, 72(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 22
    lw t2, 76(s1)     # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 23
    lw t2, 76(s2)     # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    
    # Butterfly 24
    lw t2, 80(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 25
    lw t2, 80(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 26
    lw t2, 84(s1)     # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 27
    lw t2, 84(s2)     # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 88(s1)     # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 29
    lw t2, 88(s2)     # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 92(s1)     # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 31
    lw t2, 92(s2)     # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

# ========== #stage 5: Process 32 butterfly operations ==========
#stage5:
    # Butterfly 0
    lw t2, 0(s1)      # d0(SRAM_0->t2)
    lw t3, 64(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
     
    # Butterfly 1
    lw t2, 0(s2)      # d0(SRAM_1->t2)
    lw t3, 64(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 2
    lw t2, 4(s1)      # d0(SRAM_0->t2)
    lw t3, 68(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 3
    lw t2, 4(s2)      # d0(SRAM_1->t2)
    lw t3, 68(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 4
    lw t2, 8(s1)      # d0(SRAM_0->t2)
    lw t3, 72(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 5
    lw t2, 8(s2)      # d0(SRAM_1->t2)
    lw t3, 72(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
      
    # Butterfly 6
    lw t2, 12(s1)     # d0(SRAM_0->t2)
    lw t3, 76(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 7
    lw t2, 12(s2)     # d0(SRAM_1->t2)
    lw t3, 76(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 8
    lw t2, 16(s1)     # d0(SRAM_0->t2)
    lw t3, 80(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 9
    lw t2, 16(s2)     # d0(SRAM_1->t2)
    lw t3, 80(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 10
    lw t2, 20(s1)     # d0(SRAM_0->t2)
    lw t3, 84(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 11
    lw t2, 20(s2)     # d0(SRAM_1->t2)
    lw t3, 84(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 12
    lw t2, 24(s1)     # d0(SRAM_0->t2)
    lw t3, 88(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 13
    lw t2, 24(s2)     # d0(SRAM_1->t2)
    lw t3, 88(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 14
    lw t2, 28(s1)     # d0(SRAM_0->t2)
    lw t3, 92(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 15 
    lw t2, 28(s2)     # d0(SRAM_1->t2)
    lw t3, 92(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
        
    # Butterfly 16
    lw t2, 32(s1)     # d0(SRAM_0->t2)
    lw t3, 96(s1)     # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 17
    lw t2, 32(s2)     # d0(SRAM_1->t2)
    lw t3, 96(s2)     # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 18
    lw t2, 36(s1)     # d0(SRAM_0->t2)
    lw t3, 100(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 19
    lw t2, 36(s2)     # d0(SRAM_1->t2)
    lw t3, 100(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
        
    # Butterfly 20
    lw t2, 40(s1)     # d0(SRAM_0->t2)
    lw t3, 104(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 21
    lw t2, 40(s2)     # d0(SRAM_1->t2)
    lw t3, 104(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
       
    # Butterfly 22
    lw t2, 44(s1)     # d0(SRAM_0->t2)
    lw t3, 108(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 23
    lw t2, 44(s2)     # d0(SRAM_1->t2)
    lw t3, 108(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
  
    # Butterfly 24
    lw t2, 48(s1)     # d0(SRAM_0->t2)
    lw t3, 112(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 25
    lw t2, 48(s2)     # d0(SRAM_1->t2)
    lw t3, 112(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 26
    lw t2, 52(s1)     # d0(SRAM_0->t2)
    lw t3, 116(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 27
    lw t2, 52(s2)     # d0(SRAM_1->t2)
    lw t3, 116(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 28
    lw t2, 56(s1)     # d0(SRAM_0->t2)
    lw t3, 120(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 29
    lw t2, 56(s2)     # d0(SRAM_1->t2)
    lw t3, 120(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    
    # Butterfly 30
    lw t2, 60(s1)     # d0(SRAM_0->t2)
    lw t3, 124(s1)    # d1(SRAM_0->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)
    # Butterfly 31
    lw t2, 60(s2)     # d0(SRAM_1->t2)
    lw t3, 124(s2)    # d1(SRAM_1->t3)
    sw t2, 0(s4)      # d0(t2->dpath0)
    sw t3, 0(s5)      # d1(t3->dpath1)

    addi    x0,     x0,     0x0000      # dummy

        #butterfly 0
    lw s11, 0(s1) #sram_0[0]->s11
    sw s11, 0(s7) #s11->sram i/o
    
    #butterfly 1
    lw s11, 4(s1) #sram_0[1]->s11
    sw s11, 8(s7) #s11->sram i/o
    
    #butterfly 2
    lw s11, 8(s1) #sram_0[2]->s11
    sw s11, 16(s7) #s11->sram i/o
    
    #butterfly 3
    lw s11, 12(s1) #sram_0[3]->s11
    sw s11, 24(s7) #s11->sram i/o
    
    #butterfly 4
    lw s11, 16(s1) #sram_0[4]->s11
    sw s11, 32(s7) #s11->sram i/o
    
    #butterfly 5
    lw s11, 20(s1) #sram_0[5]->s11
    sw s11, 40(s7) #s11->sram i/o
    
    #butterfly 6
    lw s11, 24(s1) #sram_0[6]->s11
    sw s11, 48(s7) #s11->sram i/o
    
    #butterfly 7
    lw s11, 28(s1) #sram_0[7]->s11
    sw s11, 56(s7) #s11->sram i/o
    
    #butterfly 8
    lw s11, 32(s1) #sram_0[8]->s11
    sw s11, 64(s7) #s11->sram i/o
    
    #butterfly 9
    lw s11, 36(s1) #sram_0[9]->s11
    sw s11, 72(s7) #s11->sram i/o
    
    #butterfly 10
    lw s11, 40(s1) #sram_0[10]->s11
    sw s11, 80(s7) #s11->sram i/o
    
    #butterfly 11
    lw s11, 44(s1) #sram_0[11]->s11
    sw s11, 88(s7) #s11->sram i/o
    
    #butterfly 12
    lw s11, 48(s1) #sram_0[12]->s11
    sw s11, 96(s7) #s11->sram i/o
    
    #butterfly 13
    lw s11, 52(s1) #sram_0[13]->s11
    sw s11, 104(s7) #s11->sram i/o
    
    #butterfly 14
    lw s11, 56(s1) #sram_0[14]->s11
    sw s11, 112(s7) #s11->sram i/o
    
    #butterfly 15
    lw s11, 60(s1) #sram_0[15]->s11
    sw s11, 120(s7) #s11->sram i/o
    
    #butterfly 16
    lw s11, 64(s1) #sram_0[16]->s11
    sw s11, 128(s7) #s11->sram i/o
    
    #butterfly 17
    lw s11, 68(s1) #sram_0[17]->s11
    sw s11, 136(s7) #s11->sram i/o
    
    #butterfly 18
    lw s11, 72(s1) #sram_0[18]->s11
    sw s11, 144(s7) #s11->sram i/o
    
    #butterfly 19
    lw s11, 76(s1) #sram_0[19]->s11
    sw s11, 152(s7) #s11->sram i/o
    
    #butterfly 20
    lw s11, 80(s1) #sram_0[20]->s11
    sw s11, 160(s7) #s11->sram i/o
    
    #butterfly 21
    lw s11, 84(s1) #sram_0[21]->s11
    sw s11, 168(s7) #s11->sram i/o
    
    #butterfly 22
    lw s11, 88(s1) #sram_0[22]->s11
    sw s11, 176(s7) #s11->sram i/o
    
    #butterfly 23
    lw s11, 92(s1) #sram_0[23]->s11
    sw s11, 184(s7) #s11->sram i/o
    
    #butterfly 24
    lw s11, 96(s1) #sram_0[24]->s11
    sw s11, 192(s7) #s11->sram i/o
    
    #butterfly 25
    lw s11, 100(s1) #sram_0[25]->s11
    sw s11, 200(s7) #s11->sram i/o
    
    #butterfly 26
    lw s11, 104(s1) #sram_0[26]->s11
    sw s11, 208(s7) #s11->sram i/o
    
    #butterfly 27
    lw s11, 108(s1) #sram_0[27]->s11
    sw s11, 216(s7) #s11->sram i/o
    
    #butterfly 28
    lw s11, 112(s1) #sram_0[28]->s11
    sw s11, 224(s7) #s11->sram i/o
    
    #butterfly 29
    lw s11, 116(s1) #sram_0[29]->s11
    sw s11, 232(s7) #s11->sram i/o
    
    #butterfly 30
    lw s11, 120(s1) #sram_0[30]->s11
    sw s11, 240(s7) #s11->sram i/o
    
    #butterfly 31
    lw s11, 124(s1) #sram_0[31]->s11
    sw s11, 248(s7) #s11->sram i/o
    addi    x0,     x0,     0x0000      # dummy
# ========== set2 End ==========
end:
    # Infinite loop to stop execution
end_loop:
    j       end_loop
