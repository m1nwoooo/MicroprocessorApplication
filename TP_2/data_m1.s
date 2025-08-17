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
    lui     s0,     0x00000          # SRAM I/O base
    lui     s1,     0x01000          # SRAM 0 base
    lui     s2,     0x02000          # SRAM 1 base
    lui     s3,     0x03000          # SRAM W base
    lui     s4,     0x05000          # Dpath port 0
    lui     s5,     0x06000          # Dpath port 1
    lui     s6,     0x07000          # Dpath port 2
    lui     s7,     0x00000          # SRAM I/O output base
    addi    s7,     s7,     0x400    # Output base


# Edit code below

# ========== STAGE 0: Load twiddle factors and sync ==========
stage0:
    # Initial synchronization - wait for m1 to start loading

    lw      t4, 0(s3)       # W[0](SRAM_W->t4)
    
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    
    # Load twiddle factors for all stages (32 values)
    # Butterfly 0-31: Load W[0] for stage 0 (all W[0])
    
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    sw t6, 0(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    sw t6, 4(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)
    sw t6, 8(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    sw t6, 12(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    sw t6, 16(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    sw t6, 20(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    sw t6, 24(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)
    sw t6, 28(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    sw t6, 32(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    sw t6, 36(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    sw t6, 40(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)
    sw t6, 44(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    sw t6, 48(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)
    sw t6, 52(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)
    sw t6, 56(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 60(s1)     # o_d0(t5->SRAM_0)
    sw t6, 60(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    sw t6, 64(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    sw t6, 68(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    sw t6, 72(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    sw t6, 76(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    sw t6, 80(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 84(s1)     # o_d0(t5->SRAM_0)
    sw t6, 84(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 88(s1)     # o_d0(t5->SRAM_0)
    sw t6, 88(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 92(s1)     # o_d0(t5->SRAM_0)
    sw t6, 92(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    sw t6, 96(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    sw t6, 100(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    sw t6, 104(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 108(s1)    # o_d0(t5->SRAM_0)
    sw t6, 108(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    sw t6, 112(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 116(s1)    # o_d0(t5->SRAM_0)
    sw t6, 116(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 120(s1)    # o_d0(t5->SRAM_0)
    sw t6, 120(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 124(s1)    # o_d0(t5->SRAM_0)
    sw t6, 124(s2)    # o_d0(t6->SRAM_1)

# ========== STAGE 1: Process twiddle factors and store o_d0 ==========
#stage1:
    # Load twiddle factors for stage 1 (W[0] and W[16] alternating)
    # Butterfly 0
    lw t4, 0(s3)      # W[0](SRAM_W->t4)
    addi    x0, x0,  1      # dummy
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 120(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 120(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 2: Process twiddle factors and store o_d0 ==========
#stage2:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle facto
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 116(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 116(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 3: Process twiddle factors and store o_d0 ==========
#stage3:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 108(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 108(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 4: Process twiddle factors and store o_d0 ==========
#stage4:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 92(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 92(s2)     # o_d0(t5->SRAM_1)

# ========== STAGE 5: Process twiddle factors and store o_d0 to SRAM I/O ==========
#stage5:
        # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 4(s3)      # W[1](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 1
    sw t4, 0(s6)      # W[1](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 2
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 12(s3)     # W[3](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 3
    sw t4, 0(s6)      # W[3](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 4
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 20(s3)     # W[5](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 5
    sw t4, 0(s6)      # W[5](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 6
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 28(s3)     # W[7](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 7
    sw t4, 0(s6)      # W[7](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 8
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 36(s3)     # W[9](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 9
    sw t4, 0(s6)      # W[9](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 10
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 44(s3)     # W[11](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 11
    sw t4, 0(s6)      # W[11](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 12
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 52(s3)     # W[13](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 13
    sw t4, 0(s6)      # W[13](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 14
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 60(s3)     # W[15](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 15
    sw t4, 0(s6)      # W[15](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 16
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 68(s3)     # W[17](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 17
    sw t4, 0(s6)      # W[17](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 18
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 76(s3)     # W[19](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 19
    sw t4, 0(s6)      # W[19](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 20
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 84(s3)     # W[21](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 21
    sw t4, 0(s6)      # W[21](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 22
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 92(s3)     # W[23](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 23
    sw t4, 0(s6)      # W[23](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 24
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 100(s3)    # W[25](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 25
    sw t4, 0(s6)      # W[25](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 26
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 108(s3)    # W[27](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 27
    sw t4, 0(s6)      # W[27](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 28
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 116(s3)    # W[29](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 29
    sw t4, 0(s6)      # W[29](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 30
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 124(s3)    # W[31](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 60(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 31
    sw t4, 0(s6)      # W[31](t4->dpath2)
    # No next twiddle factor to load
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 60(s2)     # o_d0(t5->SRAM_1)

# ========== STAGE 5 OUTPUT STORE: Load from SRAM and store to SRAM I/O ==========
#stage5_output:
    #butterfly 0
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 1
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 2
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 3
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 4
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 5
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 6
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 7
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 8
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 9
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 10
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 11
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 12
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 13
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 14
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 15
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 16
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 17
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 18
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 19
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 20
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 21
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 22
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 23
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 24
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 25
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 26
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 27
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 28
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 29
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 30
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 31
    addi x0, x0, 0 #dummy


##############set1 end###############
    addi    s0,     s0,     256          
    addi    s7,     s7,     256
#stage0:

    # Initial synchronization - wait for m1 to start loading

    lw      t4, 0(s3)       # W[0](SRAM_W->t4)
    
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    
    # Load twiddle factors for all stages (32 values)
    # Butterfly 0-31: Load W[0] for stage 0 (all W[0])
    
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    sw t6, 0(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    sw t6, 4(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)
    sw t6, 8(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    sw t6, 12(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    sw t6, 16(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    sw t6, 20(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    sw t6, 24(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)
    sw t6, 28(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    sw t6, 32(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    sw t6, 36(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    sw t6, 40(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)
    sw t6, 44(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    sw t6, 48(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)
    sw t6, 52(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)
    sw t6, 56(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 60(s1)     # o_d0(t5->SRAM_0)
    sw t6, 60(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    sw t6, 64(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    sw t6, 68(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    sw t6, 72(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    sw t6, 76(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    sw t6, 80(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 84(s1)     # o_d0(t5->SRAM_0)
    sw t6, 84(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 88(s1)     # o_d0(t5->SRAM_0)
    sw t6, 88(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 92(s1)     # o_d0(t5->SRAM_0)
    sw t6, 92(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    sw t6, 96(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    sw t6, 100(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    sw t6, 104(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 108(s1)    # o_d0(t5->SRAM_0)
    sw t6, 108(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    sw t6, 112(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 116(s1)    # o_d0(t5->SRAM_0)
    sw t6, 116(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 120(s1)    # o_d0(t5->SRAM_0)
    sw t6, 120(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 124(s1)    # o_d0(t5->SRAM_0)
    sw t6, 124(s2)    # o_d0(t6->SRAM_1)

# ========== STAGE 1: Process twiddle factors and store o_d0 ==========
#stage1:
    # Load twiddle factors for stage 1 (W[0] and W[16] alternating)
    # Butterfly 0
    lw t4, 0(s3)      # W[0](SRAM_W->t4)
    addi    x0, x0,  1      # dummy
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 120(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 120(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 2: Process twiddle factors and store o_d0 ==========
#stage2:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle facto
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 116(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 116(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 3: Process twiddle factors and store o_d0 ==========
#stage3:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 108(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 108(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 4: Process twiddle factors and store o_d0 ==========
#stage4:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 92(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 92(s2)     # o_d0(t5->SRAM_1)

# ========== STAGE 5: Process twiddle factors and store o_d0 to SRAM I/O ==========
#stage5:
        # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 4(s3)      # W[1](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 1
    sw t4, 0(s6)      # W[1](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 2
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 12(s3)     # W[3](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 3
    sw t4, 0(s6)      # W[3](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 4
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 20(s3)     # W[5](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 5
    sw t4, 0(s6)      # W[5](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 6
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 28(s3)     # W[7](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 7
    sw t4, 0(s6)      # W[7](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 8
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 36(s3)     # W[9](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 9
    sw t4, 0(s6)      # W[9](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 10
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 44(s3)     # W[11](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 11
    sw t4, 0(s6)      # W[11](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 12
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 52(s3)     # W[13](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 13
    sw t4, 0(s6)      # W[13](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 14
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 60(s3)     # W[15](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 15
    sw t4, 0(s6)      # W[15](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 16
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 68(s3)     # W[17](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 17
    sw t4, 0(s6)      # W[17](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 18
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 76(s3)     # W[19](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 19
    sw t4, 0(s6)      # W[19](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 20
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 84(s3)     # W[21](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 21
    sw t4, 0(s6)      # W[21](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 22
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 92(s3)     # W[23](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 23
    sw t4, 0(s6)      # W[23](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 24
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 100(s3)    # W[25](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 25
    sw t4, 0(s6)      # W[25](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 26
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 108(s3)    # W[27](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 27
    sw t4, 0(s6)      # W[27](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 28
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 116(s3)    # W[29](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 29
    sw t4, 0(s6)      # W[29](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 30
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 124(s3)    # W[31](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 60(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 31
    sw t4, 0(s6)      # W[31](t4->dpath2)
    # No next twiddle factor to load
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 60(s2)     # o_d0(t5->SRAM_1)

# ========== STAGE 5 OUTPUT STORE: Load from SRAM and store to SRAM I/O ==========
#stage5_output:
    #butterfly 0
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 1
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 2
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 3
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 4
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 5
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 6
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 7
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 8
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 9
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 10
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 11
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 12
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 13
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 14
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 15
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 16
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 17
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 18
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 19
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 20
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 21
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 22
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 23
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 24
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 25
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 26
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 27
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 28
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 29
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 30
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 31
    addi x0, x0, 0 #dummy
###############set 2 end###################
    addi    s0,     s0,     256 
    addi    s7,     s7,     256  
#stage0:

    # Initial synchronization - wait for m1 to start loading

    lw      t4, 0(s3)       # W[0](SRAM_W->t4)
    
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    addi    x0, x0,  1      # dummy
    
    # Load twiddle factors for all stages (32 values)
    # Butterfly 0-31: Load W[0] for stage 0 (all W[0])
    
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    sw t6, 0(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    sw t6, 4(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)
    sw t6, 8(s2)      # o_d0(t6->SRAM_1)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    sw t6, 12(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    sw t6, 16(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    sw t6, 20(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    sw t6, 24(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)
    sw t6, 28(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    sw t6, 32(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    sw t6, 36(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    sw t6, 40(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)
    sw t6, 44(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    sw t6, 48(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)
    sw t6, 52(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)
    sw t6, 56(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 60(s1)     # o_d0(t5->SRAM_0)
    sw t6, 60(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    sw t6, 64(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    sw t6, 68(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    sw t6, 72(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    sw t6, 76(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    sw t6, 80(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 84(s1)     # o_d0(t5->SRAM_0)
    sw t6, 84(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 88(s1)     # o_d0(t5->SRAM_0)
    sw t6, 88(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 92(s1)     # o_d0(t5->SRAM_0)
    sw t6, 92(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    sw t6, 96(s2)     # o_d0(t6->SRAM_1)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    sw t6, 100(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    sw t6, 104(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 108(s1)    # o_d0(t5->SRAM_0)
    sw t6, 108(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    sw t6, 112(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 116(s1)    # o_d0(t5->SRAM_0)
    sw t6, 116(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 120(s1)    # o_d0(t5->SRAM_0)
    sw t6, 120(s2)    # o_d0(t6->SRAM_1)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    lw t6, 4(s5)      # o_d0(dpath1->t6)
    sw t5, 124(s1)    # o_d0(t5->SRAM_0)
    sw t6, 124(s2)    # o_d0(t6->SRAM_1)

# ========== STAGE 1: Process twiddle factors and store o_d0 ==========
#stage1:
    # Load twiddle factors for stage 1 (W[0] and W[16] alternating)
    # Butterfly 0
    lw t4, 0(s3)      # W[0](SRAM_W->t4)
    addi    x0, x0,  1      # dummy
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 120(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 120(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 2: Process twiddle factors and store o_d0 ==========
#stage2:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle facto
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 112(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 116(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 116(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 3: Process twiddle factors and store o_d0 ==========
#stage3:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 96(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 100(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 104(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 108(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 108(s2)    # o_d0(t5->SRAM_1)

# ========== STAGE 4: Process twiddle factors and store o_d0 ==========
#stage4:
    # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 1
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)
    
    # Butterfly 2
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)
    
    # Butterfly 3
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 4
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 5
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 6
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 7
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 8
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 9
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 10
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 11
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 12
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 13
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 14
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 15
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 16
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 17
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 64(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 18
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 19
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 68(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 20
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 21
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 72(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 22
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 23
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 76(s2)     # o_d0(t5->SRAM_1)
    
    # Butterfly 24
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s1)     # o_d0(t5->SRAM_0)
    
    # Butterfly 25
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 80(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 26
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 27
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 84(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 28
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 29
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 88(s2)    # o_d0(t5->SRAM_1)
    
    # Butterfly 30
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 92(s1)    # o_d0(t5->SRAM_0)
    
    # Butterfly 31
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 0(s3)      # W[0](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 92(s2)     # o_d0(t5->SRAM_1)

# ========== STAGE 5: Process twiddle factors and store o_d0 to SRAM I/O ==========
#stage5:
        # Butterfly 0
    sw t4, 0(s6)      # W[0](t4->dpath2)
    lw t4, 4(s3)      # W[1](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 1
    sw t4, 0(s6)      # W[1](t4->dpath2)
    lw t4, 8(s3)      # W[2](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 0(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 2
    sw t4, 0(s6)      # W[2](t4->dpath2)
    lw t4, 12(s3)     # W[3](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 3
    sw t4, 0(s6)      # W[3](t4->dpath2)
    lw t4, 16(s3)     # W[4](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 4(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 4
    sw t4, 0(s6)      # W[4](t4->dpath2)
    lw t4, 20(s3)     # W[5](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s1)      # o_d0(t5->SRAM_0)

    # Butterfly 5
    sw t4, 0(s6)      # W[5](t4->dpath2)
    lw t4, 24(s3)     # W[6](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 8(s2)      # o_d0(t5->SRAM_1)

    # Butterfly 6
    sw t4, 0(s6)      # W[6](t4->dpath2)
    lw t4, 28(s3)     # W[7](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 7
    sw t4, 0(s6)      # W[7](t4->dpath2)
    lw t4, 32(s3)     # W[8](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 12(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 8
    sw t4, 0(s6)      # W[8](t4->dpath2)
    lw t4, 36(s3)     # W[9](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 9
    sw t4, 0(s6)      # W[9](t4->dpath2)
    lw t4, 40(s3)     # W[10](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 16(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 10
    sw t4, 0(s6)      # W[10](t4->dpath2)
    lw t4, 44(s3)     # W[11](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 11
    sw t4, 0(s6)      # W[11](t4->dpath2)
    lw t4, 48(s3)     # W[12](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 20(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 12
    sw t4, 0(s6)      # W[12](t4->dpath2)
    lw t4, 52(s3)     # W[13](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 13
    sw t4, 0(s6)      # W[13](t4->dpath2)
    lw t4, 56(s3)     # W[14](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 24(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 14
    sw t4, 0(s6)      # W[14](t4->dpath2)
    lw t4, 60(s3)     # W[15](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 15
    sw t4, 0(s6)      # W[15](t4->dpath2)
    lw t4, 64(s3)     # W[16](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 28(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 16
    sw t4, 0(s6)      # W[16](t4->dpath2)
    lw t4, 68(s3)     # W[17](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 17
    sw t4, 0(s6)      # W[17](t4->dpath2)
    lw t4, 72(s3)     # W[18](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 32(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 18
    sw t4, 0(s6)      # W[18](t4->dpath2)
    lw t4, 76(s3)     # W[19](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 19
    sw t4, 0(s6)      # W[19](t4->dpath2)
    lw t4, 80(s3)     # W[20](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 36(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 20
    sw t4, 0(s6)      # W[20](t4->dpath2)
    lw t4, 84(s3)     # W[21](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 21
    sw t4, 0(s6)      # W[21](t4->dpath2)
    lw t4, 88(s3)     # W[22](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 40(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 22
    sw t4, 0(s6)      # W[22](t4->dpath2)
    lw t4, 92(s3)     # W[23](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 23
    sw t4, 0(s6)      # W[23](t4->dpath2)
    lw t4, 96(s3)     # W[24](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 44(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 24
    sw t4, 0(s6)      # W[24](t4->dpath2)
    lw t4, 100(s3)    # W[25](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 25
    sw t4, 0(s6)      # W[25](t4->dpath2)
    lw t4, 104(s3)    # W[26](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 48(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 26
    sw t4, 0(s6)      # W[26](t4->dpath2)
    lw t4, 108(s3)    # W[27](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 27
    sw t4, 0(s6)      # W[27](t4->dpath2)
    lw t4, 112(s3)    # W[28](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 52(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 28
    sw t4, 0(s6)      # W[28](t4->dpath2)
    lw t4, 116(s3)    # W[29](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 29
    sw t4, 0(s6)      # W[29](t4->dpath2)
    lw t4, 120(s3)    # W[30](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 56(s2)     # o_d0(t5->SRAM_1)

    # Butterfly 30
    sw t4, 0(s6)      # W[30](t4->dpath2)
    lw t4, 124(s3)    # W[31](SRAM_W->t4)_next twiddle factor
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 60(s1)     # o_d0(t5->SRAM_0)

    # Butterfly 31
    sw t4, 0(s6)      # W[31](t4->dpath2)
    # No next twiddle factor to load
    lw t5, 4(s4)      # o_d0(dpath0->t5)
    sw t5, 60(s2)     # o_d0(t5->SRAM_1)

# ========== STAGE 5 OUTPUT STORE: Load from SRAM and store to SRAM I/O ==========
#stage5_output:
    #butterfly 0
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 1
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 2
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 3
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 4
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 5
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 6
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 7
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 8
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 9
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 10
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 11
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 12
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 13
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 14
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 15
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 16
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 17
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 18
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 19
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 20
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 21
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 22
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 23
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 24
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 25
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 26
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 27
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 28
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 29
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 30
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy

    #butterfly 31
    addi x0, x0, 0 #dummy
    addi x0, x0, 0 #dummy
    ##################set 3 end###############
end:
    # Infinite loop to stop execution
end_loop:
    j       end_loop
