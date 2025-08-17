.global _main_init
.text

/*
        Module              From          To         
      - SRAM I/O         0x0000_0000   0x0000_FFFF
      - SRAM 0              0x0100_0000   0x0100_FFFF
      - SRAM 1              0x0200_0000   0x0200_FFFF
      - SRAM W              0x0300_0000   0x0300_FFFF
      - SRAM 2              0x0400_0000   0x0400_FFFF
      - Dpath reg (port 0)  0x0500_0000   0x0500_0007
      - Dpath reg (port 1)  0x0600_0000   0x0600_0007
      - Dpath reg (port 2)  0x0700_0000   0x0700_0003
*/

_main_init:
    lui     s0,     0x00000          #SRAM I/O input 0(initial)
    lui     s1,     0x00000          
    addi    s1,     s1,     0x400    #SRAM I/O output 400(initial)
    lui     s2,     0x01000          #SRAM 0
    lui     s3,     0x03000          #SRAM W (twiddle factor)
    lui     s4,     0x05000          #dpath 0 SRAM0_[i]
    lui     s5,     0x06000          #dapth 1 SRAM0_[j]
    lui     s6,     0x07000          #dpath 2 twiddle factor
    li      s7,     64               #64pt fft
    li      s8,     6                #6 stage


start_fft:
/* edit code below*/

# stage 0~3까지의 과정을 우리는
# stage[i][n]으로 표현하려한다.
# i는 64개 elements를 4개로 쪼갠 묶음의 index (0~3)
# n은 stage 번호 (0~3)

# reg에 Twiddle Factor을 담아두고, 재사용하려한다.
lw      a7, 0(s3)           # a7 = twiddle[0]
lw      a6, 64(s3)          # a6 = twiddle[16]

# i = 0
# n = 0
# stage[0][0]

# stage[0][0]의 연산 결과를 stage[0][1]로 전달하는데
# SRAM 0의 sw/lw 과정을 제하기위해 가용한 reg를 최대한 사용하였다.

# Input
# 아래는 DIT 형식에 맞추어 SRAM I/O으로부터의 Input을 받는 과정이다.
# e.g. x[0], x[32], x[16]...순서...
lw      t0, 0(s0)           
lw      t1, 128(s0)         
lw      t2, 64(s0)          
lw      t3, 192(s0)         
lw      t4, 32(s0)          
lw      t5, 160(s0)         
lw      t6, 96(s0)          
lw      a0, 224(s0)         

lw      a1, 16(s0)           
lw      a2, 144(s0)          
lw      a3, 80(s0)        
lw      a4, 208(s0)        
lw      a5, 48(s0)     
lw      s9, 176(s0)      
lw      s10, 112(s0)     
lw      s11, 240(s0) 


# BF 연산
# reg 활용을 극대화 하기위해 연산을 위해 sw한 reg의 값은
# 더 이상 필요가 없으므로 연산의 결과값으로 바로 대체하였다.

# BF 0 
sw      t0, 0(s4)#Input1
sw      t1, 0(s5)#Input2
sw      a7, 0(s6)#Twiddle 0
lw      t0, 4(s4)#덧셈결과
lw      t1, 4(s5)#뺄셈결과

# BF 1
sw      t2, 0(s4)
sw      t3, 0(s5)
sw      a7, 0(s6)
lw      t2, 4(s4)
lw      t3, 4(s5)

# BF 2:
sw      t4, 0(s4)
sw      t5, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t5, 4(s5)

# BF 3:
sw      t6, 0(s4)
sw      a0, 0(s5)
sw      a7, 0(s6)
lw      t6, 4(s4)
lw      a0, 4(s5)

# BF 4:
sw      a1, 0(s4)
sw      a2, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a2, 4(s5)

# BF 5:
sw      a3, 0(s4)
sw      a4, 0(s5)
sw      a7, 0(s6)
lw      a3, 4(s4)
lw      a4, 4(s5)

# BF 6:
sw      a5, 0(s4)
sw      s9, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s9, 4(s5)

# BF 7:
sw      s10, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      s10, 4(s4)
lw      s11, 4(s5)


#이렇게 하면 stage[0][0]의 연산이 종료되었고 결과는 reg에 저장되어 있다.
#이 결과를   stage[0][1]에 전달하여 다시 BF 연산을 진행한다.

#n=1
#stage[0][1]

# BF 0: 
sw      t0, 0(s4)
sw      t2, 0(s5)
sw      a7, 0(s6) #Twiddle 0
lw      t0, 4(s4)
lw      t2, 4(s5)

# BF 1:
sw      t1, 0(s4)
sw      t3, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      t1, 4(s4)
lw      t3, 4(s5)

# BF 2: 
sw      t4, 0(s4)
sw      t6, 0(s5)
sw      a7, 0(s6)#Twiddle 0
lw      t4, 4(s4)
lw      t6, 4(s5)

# BF 3:
sw      t5, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      t5, 4(s4)
lw      a0, 4(s5)

# BF 4:
sw      a1, 0(s4)
sw      a3, 0(s5)
sw      a7, 0(s6)#Twiddle 0
lw      a1, 4(s4)
lw      a3, 4(s5)

# BF 5:
sw      a2, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      a2, 4(s4)
lw      a4, 4(s5)

# BF 6:
sw      a5, 0(s4)
sw      s10, 0(s5)
sw      a7, 0(s6)#Twiddle 0
lw      a5, 4(s4)
lw      s10, 4(s5)

# BF 7:
sw      s9, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      s9, 4(s4)
lw      s11, 4(s5)


#stage[0][0] 연산 결과를 이용해 stage[0][1]을 연산한 것과 동일하게 
#stage[0][1] 연산 결과를 이용해 stage[0][2]를 연산한다.

#stage[0][2]
#Twiddle Factor 0,16은 이미 reg에 담겨 있으므로 이를 이용하는 BF 연산을 먼저 진행하자.

# BF 0:
sw      t0, 0(s4)
sw      t4, 0(s5)
sw      a7, 0(s6)#Twiddle 0
lw      t0, 4(s4)
lw      t4, 4(s5)
# BF 4:
sw      a1, 0(s4)
sw      a5, 0(s5)
sw      a7, 0(s6)#Twiddle 0
lw      a1, 4(s4)
lw      a5, 4(s5)

# BF 2:
sw      t2, 0(s4)
sw      t6, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      t2, 4(s4)
lw      t6, 4(s5)
# BF 6:
sw      a3, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      a3, 4(s4)
lw      s10, 4(s5)

lw      a6, 32(s3)#a6 reg를 Twiddle 8로 바꾼다.

# BF 1:
sw      t1, 0(s4)
sw      t5, 0(s5)
sw      a6, 0(s6)#Twiddle 8
lw      t1, 4(s4)
lw      t5, 4(s5)
# BF 5:
sw      a2, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)#Twiddle 8
lw      a2, 4(s4)
lw      s9, 4(s5)

lw      a6, 96(s3)#a6 reg를 Twiddle 24로 바꾼다.

# BF 3:
sw      t3, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)#Twiddle 24
lw      t3, 4(s4)
lw      a0, 4(s5)
# BF 7:
sw      a4, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)#Twiddle 24
lw      a4, 4(s4)
lw      s11, 4(s5)

#stage[0][1] 연산 결과를 이용해 stage[0][2]을 연산한 것과 동일하게 
#stage[0][2] 연산 결과를 이용해 stage[0][3]를 연산한다.

### stage[3][0] ###

sw      t0, 0(s4)
sw      a1, 0(s5)
sw      a7, 0(s6)#Twiddle 0
lw      t0, 4(s4)
lw      a1, 4(s5)

# a6는 #Twiddle 24이므로 재활용 먼저 한다.
# BF 6:
sw      t6, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)#Twiddle 24
lw      t6, 4(s4)
lw      s10, 4(s5)

lw      a6, 16(s3)#a6 reg를 Twiddle 4로 바꾼다.

# BF 1:
sw      t1, 0(s4)
sw      a2, 0(s5)
sw      a6, 0(s6)#Twiddle 6
lw      t1, 4(s4)
lw      a2, 4(s5)

# a[6]=w[8]
lw      a6, 32(s3)#a6 reg를 Twiddle 8로 바꾼다.

# BF 2:
sw      t2, 0(s4)
sw      a3, 0(s5)
sw      a6, 0(s6)#Twiddle 8
lw      t2, 4(s4)
lw      a3, 4(s5)


lw      a6, 48(s3)#a6 reg를 Twiddle 12로 바꾼다.
# BF 3:
sw      t3, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)#Twiddle 12
lw      t3, 4(s4)
lw      a4, 4(s5)

lw      a6, 64(s3)#a6 reg를 Twiddle 16로 바꾼다.

# BF 4:
sw      t4, 0(s4)
sw      a5, 0(s5)
sw      a6, 0(s6)#Twiddle 16
lw      t4, 4(s4)
lw      a5, 4(s5)

lw      a6, 80(s3)#a6 reg를 Twiddle 20로 바꾼다.
# BF 5:
sw      t5, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)#Twiddle 20
lw      t5, 4(s4)
lw      s9, 4(s5)

lw      a6, 112(s3)#a6 reg를 Twiddle 28로 바꾼다. (24는 앞서 재활용하여 먼저 계산했다.)
# BF 7:
sw      a0, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)#Twiddle 20
lw      a0, 4(s4)
lw      s11, 4(s5)

#stage 3로 넘겨 주기 위해 SRAM에 순서대로 저장한다.
#stage 3부터는 reg 개수의 제한이 있어 SRAM을 활용한다.
sw      t0, 0(s2)
sw      t1, 4(s2)
sw      t2, 8(s2)
sw      t3, 12(s2)
sw      t4, 16(s2)
sw      t5, 20(s2)
sw      t6, 24(s2)
sw      a0, 28(s2)

sw      a1, 32(s2)       
sw      a2, 36(s2)      
sw      a3, 40(s2)      
sw      a4, 44(s2)         
sw      a5, 48(s2)         
sw      s9, 52(s2)          
sw      s10, 56(s2)         
sw      s11, 60(s2)

#이렇게 stage[0][0]~stage[0][3]의 연산 및 SRAM0로의 저장이 종료되었다.
#이러한 방식으로 stage[i][0]~stage[i][3] 연산을 i=0~3 까지 진행한 후에
#stage 4, 5 연산을 시작하여 메모리 접근을 최소화하고
#더욱 효율적인 시간 단축 효과를 확인하였다. 

################################################################################################################
################################################################################################################
#####################그 이후의 동작은 stage[4][4]까지 모두 동일하여 추가 설명을 생략하였다##############################
################################################################################################################
################################################################################################################

# i = 1
lw      a6, 64(s3)          

lw      t0, 8(s0)           
lw      t1, 136(s0)         
lw      t2, 72(s0)          
lw      t3, 200(s0)         
lw      t4, 40(s0)          
lw      t5, 168(s0)         
lw      t6, 104(s0)         
lw      a0, 232(s0)         

lw      a1, 24(s0)          
lw      a2, 152(s0)         
lw      a3, 88(s0)          
lw      a4, 216(s0)         
lw      a5, 56(s0)      
lw      s9, 184(s0)     
lw      s10, 120(s0)       
lw      s11, 248(s0)       


sw      t0, 0(s4)
sw      t1, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t1, 4(s5)


#FLAG
sw      t2, 0(s4)
sw      t3, 0(s5)
sw      a7, 0(s6)
lw      t2, 4(s4)
lw      t3, 4(s5)

sw      t4, 0(s4)
sw      t5, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t5, 4(s5)

sw      t6, 0(s4)
sw      a0, 0(s5)
sw      a7, 0(s6)
lw      t6, 4(s4)
lw      a0, 4(s5)

sw      a1, 0(s4)
sw      a2, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a2, 4(s5)

sw      a3, 0(s4)
sw      a4, 0(s5)
sw      a7, 0(s6)
lw      a3, 4(s4)
lw      a4, 4(s5)

sw      a5, 0(s4)
sw      s9, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s9, 4(s5)

sw      s10, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      s10, 4(s4)
lw      s11, 4(s5)


sw      t0, 0(s4)
sw      t2, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t2, 4(s5)

sw      t1, 0(s4)
sw      t3, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      t3, 4(s5)

sw      t4, 0(s4)
sw      t6, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t6, 4(s5)

sw      t5, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)
lw      t5, 4(s4)
lw      a0, 4(s5)

sw      a1, 0(s4)
sw      a3, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a3, 4(s5)

sw      a2, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)
lw      a2, 4(s4)
lw      a4, 4(s5)

sw      a5, 0(s4)
sw      s10, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s10, 4(s5)

sw      s9, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      s9, 4(s4)
lw      s11, 4(s5)

sw      t0, 0(s4)
sw      t4, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t4, 4(s5)

sw      a1, 0(s4)
sw      a5, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a5, 4(s5)

sw      t2, 0(s4)
sw      t6, 0(s5)
sw      a6, 0(s6)
lw      t2, 4(s4)
lw      t6, 4(s5)

sw      a3, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)
lw      a3, 4(s4)
lw      s10, 4(s5)

lw      a6, 32(s3)

sw      t1, 0(s4)
sw      t5, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      t5, 4(s5)

sw      a2, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)
lw      a2, 4(s4)
lw      s9, 4(s5)

lw      a6, 96(s3)

sw      t3, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)
lw      t3, 4(s4)
lw      a0, 4(s5)

sw      a4, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      a4, 4(s4)
lw      s11, 4(s5)

sw      t0, 0(s4)
sw      a1, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      a1, 4(s5)

sw      t6, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)
lw      t6, 4(s4)
lw      s10, 4(s5)

lw      a6, 16(s3)

sw      t1, 0(s4)
sw      a2, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      a2, 4(s5)

lw      a6, 32(s3)

sw      t2, 0(s4)
sw      a3, 0(s5)
sw      a6, 0(s6)
lw      t2, 4(s4)
lw      a3, 4(s5)

lw      a6, 48(s3)

sw      t3, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)
lw      t3, 4(s4)
lw      a4, 4(s5)

lw      a6, 64(s3)

sw      t4, 0(s4)
sw      a5, 0(s5)
sw      a6, 0(s6)
lw      t4, 4(s4)
lw      a5, 4(s5)

lw      a6, 80(s3)

sw      t5, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)
lw      t5, 4(s4)
lw      s9, 4(s5)

lw      a6, 112(s3)

sw      a0, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      a0, 4(s4)
lw      s11, 4(s5)

sw      t0, 64(s2)
sw      t1, 68(s2)
sw      t2, 72(s2)
sw      t3, 76(s2)
sw      t4, 80(s2)
sw      t5, 84(s2)
sw      t6, 88(s2)
sw      a0, 92(s2)

sw      a1, 96(s2)
sw      a2, 100(s2)
sw      a3, 104(s2)
sw      a4, 108(s2)
sw      a5, 112(s2)
sw      s9, 116(s2)
sw      s10, 120(s2)
sw      s11, 124(s2)

#i=2
lw      a6, 64(s3)

lw      t0, 4(s0)
lw      t1, 132(s0)
lw      t2, 68(s0)
lw      t3, 196(s0)
lw      t4, 36(s0)
lw      t5, 164(s0)
lw      t6, 100(s0)
lw      a0, 228(s0)

lw      a1, 20(s0)
lw      a2, 148(s0)
lw      a3, 84(s0)
lw      a4, 212(s0)
lw      a5, 52(s0)
lw      s9, 180(s0)
lw      s10, 116(s0)
lw      s11, 244(s0)

sw      t0, 0(s4)
sw      t1, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t1, 4(s5)

sw      t2, 0(s4)
sw      t3, 0(s5)
sw      a7, 0(s6)
lw      t2, 4(s4)
lw      t3, 4(s5)

sw      t4, 0(s4)
sw      t5, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t5, 4(s5)

sw      t6, 0(s4)
sw      a0, 0(s5)
sw      a7, 0(s6)
lw      t6, 4(s4)
lw      a0, 4(s5)

sw      a1, 0(s4)
sw      a2, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a2, 4(s5)

sw      a3, 0(s4)
sw      a4, 0(s5)
sw      a7, 0(s6)
lw      a3, 4(s4)
lw      a4, 4(s5)

sw      a5, 0(s4)
sw      s9, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s9, 4(s5)

sw      s10, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      s10, 4(s4)
lw      s11, 4(s5)


sw      t0, 0(s4)
sw      t2, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t2, 4(s5)

sw      t1, 0(s4)
sw      t3, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      t3, 4(s5)

sw      t4, 0(s4)
sw      t6, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t6, 4(s5)

sw      t5, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)
lw      t5, 4(s4)
lw      a0, 4(s5)

sw      a1, 0(s4)
sw      a3, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a3, 4(s5)

sw      a2, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)
lw      a2, 4(s4)
lw      a4, 4(s5)

sw      a5, 0(s4)
sw      s10, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s10, 4(s5)

sw      s9, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      s9, 4(s4)
lw      s11, 4(s5)

sw      t0, 0(s4)
sw      t4, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t4, 4(s5)

sw      a1, 0(s4)
sw      a5, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a5, 4(s5)

sw      t2, 0(s4)
sw      t6, 0(s5)
sw      a6, 0(s6)
lw      t2, 4(s4)
lw      t6, 4(s5)

sw      a3, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)
lw      a3, 4(s4)
lw      s10, 4(s5)

lw      a6, 32(s3)

sw      t1, 0(s4)
sw      t5, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      t5, 4(s5)

sw      a2, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)
lw      a2, 4(s4)
lw      s9, 4(s5)

lw      a6, 96(s3)

sw      t3, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)
lw      t3, 4(s4)
lw      a0, 4(s5)

sw      a4, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      a4, 4(s4)
lw      s11, 4(s5)

sw      t0, 0(s4)
sw      a1, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      a1, 4(s5)

sw      t6, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)
lw      t6, 4(s4)
lw      s10, 4(s5)

lw      a6, 16(s3)

sw      t1, 0(s4)
sw      a2, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      a2, 4(s5)

lw      a6, 32(s3)

sw      t2, 0(s4)
sw      a3, 0(s5)
sw      a6, 0(s6)
lw      t2, 4(s4)
lw      a3, 4(s5)

lw      a6, 48(s3)

sw      t3, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)
lw      t3, 4(s4)
lw      a4, 4(s5)

lw      a6, 64(s3)

sw      t4, 0(s4)
sw      a5, 0(s5)
sw      a6, 0(s6)
lw      t4, 4(s4)
lw      a5, 4(s5)

lw      a6, 80(s3)

sw      t5, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)
lw      t5, 4(s4)
lw      s9, 4(s5)

lw      a6, 112(s3)

sw      a0, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      a0, 4(s4)
lw      s11, 4(s5)

sw      t0, 128(s2)
sw      t1, 134(s2)
sw      t2, 138(s2)
sw      t3, 142(s2)
sw      t4, 146(s2)
sw      t5, 150(s2)
sw      t6, 154(s2)
sw      a0, 158(s2)

sw      a1, 162(s2)
sw      a2, 164(s2)
sw      a3, 168(s2)
sw      a4, 172(s2)
sw      a5, 176(s2)
sw      s9, 180(s2)
sw      s10, 184(s2)
sw      s11, 188(s2)

#i=3
lw      a6, 64(s3)

lw      t0, 12(s0)
lw      t1, 140(s0)
lw      t2, 76(s0)
lw      t3, 204(s0)
lw      t4, 44(s0)
lw      t5, 172(s0)
lw      t6, 108(s0)
lw      a0, 236(s0)

lw      a1, 28(s0)
lw      a2, 156(s0)
lw      a3, 92(s0)
lw      a4, 220(s0)
lw      a5, 60(s0)
lw      s9, 188(s0)
lw      s10, 124(s0)
lw      s11, 252(s0)

sw      t0, 0(s4)
sw      t1, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t1, 4(s5)

sw      t2, 0(s4)
sw      t3, 0(s5)
sw      a7, 0(s6)
lw      t2, 4(s4)
lw      t3, 4(s5)

sw      t4, 0(s4)
sw      t5, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t5, 4(s5)

sw      t6, 0(s4)
sw      a0, 0(s5)
sw      a7, 0(s6)
lw      t6, 4(s4)
lw      a0, 4(s5)

sw      a1, 0(s4)
sw      a2, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a2, 4(s5)

sw      a3, 0(s4)
sw      a4, 0(s5)
sw      a7, 0(s6)
lw      a3, 4(s4)
lw      a4, 4(s5)

sw      a5, 0(s4)
sw      s9, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s9, 4(s5)

sw      s10, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      s10, 4(s4)
lw      s11, 4(s5)


sw      t0, 0(s4)
sw      t2, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t2, 4(s5)

sw      t1, 0(s4)
sw      t3, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      t3, 4(s5)

sw      t4, 0(s4)
sw      t6, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      t6, 4(s5)

sw      t5, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)
lw      t5, 4(s4)
lw      a0, 4(s5)

sw      a1, 0(s4)
sw      a3, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a3, 4(s5)

sw      a2, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)
lw      a2, 4(s4)
lw      a4, 4(s5)

sw      a5, 0(s4)
sw      s10, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s10, 4(s5)

sw      s9, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      s9, 4(s4)
lw      s11, 4(s5)

sw      t0, 0(s4)
sw      t4, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      t4, 4(s5)

sw      a1, 0(s4)
sw      a5, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      a5, 4(s5)

sw      t2, 0(s4)
sw      t6, 0(s5)
sw      a6, 0(s6)
lw      t2, 4(s4)
lw      t6, 4(s5)

sw      a3, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)
lw      a3, 4(s4)
lw      s10, 4(s5)

lw      a6, 32(s3)

sw      t1, 0(s4)
sw      t5, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      t5, 4(s5)

sw      a2, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)
lw      a2, 4(s4)
lw      s9, 4(s5)

lw      a6, 96(s3)

sw      t3, 0(s4)
sw      a0, 0(s5)
sw      a6, 0(s6)
lw      t3, 4(s4)
lw      a0, 4(s5)

sw      a4, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      a4, 4(s4)
lw      s11, 4(s5)

sw      t0, 0(s4)
sw      a1, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      a1, 4(s5)

sw      t6, 0(s4)
sw      s10, 0(s5)
sw      a6, 0(s6)
lw      t6, 4(s4)
lw      s10, 4(s5)

lw      a6, 16(s3)

sw      t1, 0(s4)
sw      a2, 0(s5)
sw      a6, 0(s6)
lw      t1, 4(s4)
lw      a2, 4(s5)

lw      a6, 32(s3)

sw      t2, 0(s4)
sw      a3, 0(s5)
sw      a6, 0(s6)
lw      t2, 4(s4)
lw      a3, 4(s5)

lw      a6, 48(s3)

sw      t3, 0(s4)
sw      a4, 0(s5)
sw      a6, 0(s6)
lw      t3, 4(s4)
lw      a4, 4(s5)

lw      a6, 64(s3)

sw      t4, 0(s4)
sw      a5, 0(s5)
sw      a6, 0(s6)
lw      t4, 4(s4)
lw      a5, 4(s5)

lw      a6, 80(s3)

sw      t5, 0(s4)
sw      s9, 0(s5)
sw      a6, 0(s6)
lw      t5, 4(s4)
lw      s9, 4(s5)

lw      a6, 112(s3)

sw      a0, 0(s4)
sw      s11, 0(s5)
sw      a6, 0(s6)
lw      a0, 4(s4)
lw      s11, 4(s5)

# 네번째 스테이지에서는 레지스터 갯수 부족으로 스테이지 3과 같이 블럭 전체 row wise 오퍼레이션이 불가하였기에,
# 마지막 블럭 등에서 레지스터를 이용해 조금이라도 sw lw 리듀싱을 진행하였다.
# 또한 파이프라이닝을 통해서 부족한 레지스터를 마치 갯수가 부족하지 않은 것처럼 구현하였다.
# FFT 리오더링을 진행하여 16-31의 버터플라이를 먼저 진행한다.

# 버터플라이 16: i=32, j=48 (twiddle[0] 사용 - 고정 레지스터)
lw      a6, 128(s2)         # SRAM_0[32]
sw      a6, 0(s4)
sw      t0, 0(s5)
sw      a7, 0(s6)
lw      a6, 4(s4)
lw      t0, 4(s5)
sw      a6, 128(s2)
sw      t0, 192(s2)

# 버터플라이 17: i=33, j=49 (twiddle[2] 사용) 데이터 디펜던시 확인
lw      t0, 8(s3)           # twiddle[2] 로드  
lw      a6, 132(s2)         # SRAM_0[33]
sw      a6, 0(s4)
sw      t1, 0(s5)
sw      t0, 0(s6)
lw      a6, 4(s4)
lw      t1, 4(s5)
sw      a6, 132(s2)
sw      t1, 196(s2)

# 버터플라이 18: i=34, j=50 (twiddle[4] 사용)
lw      t1, 16(s3)          # twiddle[4] 로드  
lw      a6, 136(s2)         # SRAM_0[34]
sw      a6, 0(s4)
sw      t2, 0(s5)
sw      t1, 0(s6)
lw      a6, 4(s4)
lw      t2, 4(s5)
sw      a6, 136(s2)
sw      t2, 200(s2)

# 버터플라이 19: i=35, j=51 (twiddle[6] 사용)
lw      t2, 24(s3)          # twiddle[6] 로드  
lw      a6, 140(s2)         # SRAM_0[35]
sw      a6, 0(s4)
sw      t3, 0(s5)
sw      t2, 0(s6)
lw      a6, 4(s4)
lw      t3, 4(s5)
sw      a6, 140(s2)
sw      t3, 204(s2)

# 버터플라이 20: i=36, j=52 (twiddle[8] 사용)
lw      t3, 32(s3)          # twiddle[8] 로드  
lw      a6, 144(s2)         # SRAM_0[36]
sw      a6, 0(s4)
sw      t4, 0(s5)
sw      t3, 0(s6)
lw      a6, 4(s4)
lw      t4, 4(s5)
sw      a6, 144(s2)
sw      t4, 208(s2)

# 버터플라이 21: i=37, j=53 (twiddle[10] 사용)
lw      t4, 40(s3)          # twiddle[10] 로드  
lw      a6, 148(s2)         # SRAM_0[37]
sw      a6, 0(s4)
sw      t5, 0(s5)
sw      t4, 0(s6)
lw      a6, 4(s4)
lw      t5, 4(s5)
sw      a6, 148(s2)
sw      t5, 212(s2)

# 버터플라이 22: i=38, j=54 (twiddle[12] 사용)
lw      t5, 48(s3)          # twiddle[12] 로드  
lw      a6, 152(s2)         # SRAM_0[38]
sw      a6, 0(s4)
sw      t6, 0(s5)
sw      t5, 0(s6)
lw      a6, 4(s4)
lw      t6, 4(s5)
sw      a6, 152(s2)
sw      t6, 216(s2)

# 버터플라이 23: i=39, j=55 (twiddle[14] 사용)
lw      t6, 56(s3)          # twiddle[14] 로드  
lw      a6, 156(s2)         # SRAM_0[39]
sw      a6, 0(s4)
sw      a0, 0(s5)
sw      t6, 0(s6)
lw      a6, 4(s4)
lw      a0, 4(s5)
sw      a6, 156(s2)
sw      a0, 220(s2)

# 버터플라이 24: i=40, j=56 (twiddle[16] 사용)
lw      a0, 64(s3)          # twiddle[16] 로드  
lw      a6, 160(s2)         # SRAM_0[40]
sw      a6, 0(s4)
sw      a1, 0(s5)
sw      a0, 0(s6)
lw      a6, 4(s4)
lw      a1, 4(s5)
sw      a6, 160(s2)
sw      a1, 224(s2)

# 버터플라이 25: i=41, j=57 (twiddle[18] 사용)
lw      a1, 72(s3)          # twiddle[18] 로드  
lw      a6, 164(s2)         # SRAM_0[41]
sw      a6, 0(s4)
sw      a2, 0(s5)
sw      a1, 0(s6)
lw      a6, 4(s4)
lw      a2, 4(s5)
sw      a6, 164(s2)
sw      a2, 228(s2)

# 버터플라이 26: i=42, j=58 (twiddle[20] 사용)
lw      a2, 80(s3)          # twiddle[20] 로드  
lw      a6, 168(s2)         # SRAM_0[42]
sw      a6, 0(s4)
sw      a3, 0(s5)
sw      a2, 0(s6)
lw      a6, 4(s4)
lw      a3, 4(s5)
sw      a6, 168(s2)
sw      a3, 232(s2)

# 버터플라이 27: i=43, j=59 (twiddle[22] 사용)
lw      a3, 88(s3)          # twiddle[22] 로드  
lw      a6, 172(s2)         # SRAM_0[43]
sw      a6, 0(s4)
sw      a4, 0(s5)
sw      a3, 0(s6)
lw      a6, 4(s4)
lw      a4, 4(s5)
sw      a6, 172(s2)
sw      a4, 236(s2)

# 버터플라이 28: i=44, j=60 (twiddle[24] 사용)
lw      a4, 96(s3)          # twiddle[24] 로드  
lw      a6, 176(s2)         # SRAM_0[44]
sw      a6, 0(s4)
sw      a5, 0(s5)
sw      a4, 0(s6)
lw      a6, 4(s4)
lw      a5, 4(s5)
sw      a6, 176(s2)
sw      a5, 240(s2)

# 버터플라이 29: i=45, j=61 (twiddle[26] 사용)
lw      a5, 104(s3)         # twiddle[26] 로드  
lw      a6, 180(s2)         # SRAM_0[45]
sw      a6, 0(s4)
sw      s9, 0(s5)
sw      a5, 0(s6)
lw      a6, 4(s4)
lw      s9, 4(s5)
sw      a6, 180(s2)
sw      s9, 244(s2)

# 버터플라이 30: i=46, j=62 (twiddle[28] 사용)
lw      s9, 112(s3)         # twiddle[28] 로드  
lw      a6, 184(s2)         # SRAM_0[46]
sw      a6, 0(s4)
sw      s10, 0(s5)
sw      s9, 0(s6)
lw      a6, 4(s4)
lw      s10, 4(s5)
sw      a6, 184(s2)
sw      s10, 248(s2)

# 버터플라이 31: i=47, j=63 (twiddle[30] 사용)
lw      s10, 120(s3)         # twiddle[30] 로드  
lw      a6, 188(s2)         # SRAM_0[47]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      s10, 0(s6)
lw      a6, 4(s4)
lw      s11, 4(s5)
sw      a6, 188(s2)
sw      s11, 252(s2)

# 버터플라이 1: i=1, j=17 (twiddle[2] 사용)
lw      a6, 4(s2)           # SRAM_0[1]
lw      s11, 68(s2)          # SRAM_0[17]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t0, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      s11, 68(s2)

# 버터플라이 2: i=2, j=18 (twiddle[4] 사용)
lw      a6, 8(s2)           # SRAM_0[2]
lw      s11, 72(s2)          # SRAM_0[18]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t1, 0(s6)
lw      t1, 4(s4)
lw      s11, 4(s5)
sw      s11, 72(s2)

# 버터플라이 3: i=3, j=19 (twiddle[6] 사용)
lw      a6, 12(s2)          # SRAM_0[3]
lw      s11, 76(s2)          # SRAM_0[19]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t2, 0(s6)
lw      t2, 4(s4)
lw      s11, 4(s5)
sw      s11, 76(s2)

# 버터플라이 4: i=4, j=20 (twiddle[8] 사용)
lw      a6, 16(s2)          # SRAM_0[4]
lw      s11, 80(s2)          # SRAM_0[20]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t3, 0(s6)
lw      t3, 4(s4)
lw      s11, 4(s5)
sw      s11, 80(s2)

# 버터플라이 5: i=5, j=21 (twiddle[10] 사용)
lw      a6, 20(s2)          # SRAM_0[5]
lw      s11, 84(s2)          # SRAM_0[21]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t4, 0(s6)
lw      t4, 4(s4)
lw      s11, 4(s5)
sw      s11, 84(s2)

# 버터플라이 6: i=6, j=22 (twiddle[12] 사용)
lw      a6, 24(s2)          # SRAM_0[6]
lw      s11, 88(s2)          # SRAM_0[22]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t5, 0(s6)
lw      t5, 4(s4)
lw      s11, 4(s5)
sw      s11, 88(s2)

# 버터플라이 7: i=7, j=23 (twiddle[14] 사용)
lw      a6, 28(s2)          # SRAM_0[7]
lw      s11, 92(s2)          # SRAM_0[23]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      t6, 0(s6)
lw      t6, 4(s4)
lw      s11, 4(s5)
sw      s11, 92(s2)

# 버터플라이 8: i=8, j=24 (twiddle[16] 사용)
lw      a6, 32(s2)          # SRAM_0[8]
lw      s11, 96(s2)          # SRAM_0[24]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a0, 0(s6)
lw      a0, 4(s4)
lw      s11, 4(s5)
sw      s11, 96(s2)

# 버터플라이 9: i=9, j=25 (twiddle[18] 사용)
lw      a6, 36(s2)          # SRAM_0[9]
lw      s11, 100(s2)         # SRAM_0[25]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a1, 0(s6)
lw      a1, 4(s4)
lw      s11, 4(s5)
sw      s11, 100(s2)

# 버터플라이 10: i=10, j=26 (twiddle[20] 사용)
lw      a6, 40(s2)          # SRAM_0[10]
lw      s11, 104(s2)         # SRAM_0[26]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a2, 0(s6)
lw      a2, 4(s4)
lw      s11, 4(s5)
sw      s11, 104(s2)

# 버터플라이 11: i=11, j=27 (twiddle[22] 사용)
lw      a6, 44(s2)          # SRAM_0[11]
lw      s11, 108(s2)         # SRAM_0[27]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a3, 0(s6)
lw      a3, 4(s4)
lw      s11, 4(s5)
sw      s11, 108(s2)

# 버터플라이 12: i=12, j=28 (twiddle[24] 사용)
lw      a6, 48(s2)          # SRAM_0[12]
lw      s11, 112(s2)         # SRAM_0[28]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a4, 0(s6)
lw      a4, 4(s4)
lw      s11, 4(s5)
sw      s11, 112(s2)

# 버터플라이 13: i=13, j=29 (twiddle[26] 사용)
lw      a6, 52(s2)          # SRAM_0[13]
lw      s11, 116(s2)         # SRAM_0[29]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a5, 0(s6)
lw      a5, 4(s4)
lw      s11, 4(s5)
sw      s11, 116(s2)

# 버터플라이 14: i=14, j=30 (twiddle[28] 사용)
lw      a6, 56(s2)          # SRAM_0[14]
lw      s11, 120(s2)         # SRAM_0[30]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      s9, 0(s6)
lw      s9, 4(s4)
lw      s11, 4(s5)
sw      s11, 120(s2)

# 버터플라이 15: i=15, j=31 (twiddle[30] 사용)
lw      a6, 60(s2)          # SRAM_0[15]
lw      s11, 124(s2)         # SRAM_0[31]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      s10, 0(s6)
lw      s10, 4(s4)
lw      s11, 4(s5)
sw      s11, 124(s2)

# 버터플라이 0: i=0, j=16 (twiddle[0] 사용)
lw      a6, 0(s2)           # SRAM_0[0]
lw      s11, 64(s2)          # SRAM_0[16]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a6, 4(s4)
lw      s11, 4(s5)
sw      s11, 64(s2)

#stage 5의 경우에서도 stage 4에서 파이프라이닝을 통한 일부 버터플라이 레지스터 연산을 진행할 수 있었다.
#그 외에는 일반 루프 언롤링 코드와 완전히 같으며 주의사항으로 마지막스테이지는 트위들팩터 32개를 모두 사용하므로, 계속 초기화 해준다.

# 버터플라이 0: i=0, j=32 (twiddle[0] 사용)
lw      s11, 128(s2)         # SRAM_0[32]
sw      a6, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a6, 4(s4)
lw      s11, 4(s5)
sw      a6, 0(s2)
sw      s11, 128(s2)

# 버터플라이 1: i=1, j=33 (twiddle[1] 사용)
lw      a7, 4(s3)           # twiddle[1]
lw      s11, 132(s2)         # SRAM_0[33]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 4(s2)
sw      s11, 132(s2)

# 버터플라이 2: i=2, j=34 (twiddle[2] 사용)
lw      a7, 8(s3)           # twiddle[2]
lw      s11, 136(s2)         # SRAM_0[34]
sw      t1, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t1, 4(s4)
lw      s11, 4(s5)
sw      t1, 8(s2)
sw      s11, 136(s2)

# 버터플라이 3: i=3, j=35 (twiddle[3] 사용)
lw      a7, 12(s3)          # twiddle[3]
lw      s11, 140(s2)         # SRAM_0[35]
sw      t2, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t2, 4(s4)
lw      s11, 4(s5)
sw      t2, 12(s2)
sw      s11, 140(s2)

# 버터플라이 4: i=4, j=36 (twiddle[4] 사용)
lw      a7, 16(s3)          # twiddle[4]
lw      s11, 144(s2)         # SRAM_0[36]
sw      t3, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t3, 4(s4)
lw      s11, 4(s5)
sw      t3, 16(s2)
sw      s11, 144(s2)

# 버터플라이 5: i=5, j=37 (twiddle[5] 사용)
lw      a7, 20(s3)          # twiddle[5]
lw      s11, 148(s2)         # SRAM_0[37]
sw      t4, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t4, 4(s4)
lw      s11, 4(s5)
sw      t4, 20(s2)
sw      s11, 148(s2)

# 버터플라이 6: i=6, j=38 (twiddle[6] 사용)
lw      a7, 24(s3)          # twiddle[6]
lw      s11, 152(s2)         # SRAM_0[38]
sw      t5, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t5, 4(s4)
lw      s11, 4(s5)
sw      t5, 24(s2)
sw      s11, 152(s2)

# 버터플라이 7: i=7, j=39 (twiddle[7] 사용)
lw      a7, 28(s3)          # twiddle[7]
lw      s11, 156(s2)         # SRAM_0[39]
sw      t6, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t6, 4(s4)
lw      s11, 4(s5)
sw      t6, 28(s2)
sw      s11, 156(s2)

# 버터플라이 8: i=8, j=40 (twiddle[8] 사용)
lw      a7, 32(s3)          # twiddle[8]
lw      s11, 160(s2)         # SRAM_0[40]
sw      a0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a0, 4(s4)
lw      s11, 4(s5)
sw      a0, 32(s2)
sw      s11, 160(s2)

# 버터플라이 9: i=9, j=41 (twiddle[9] 사용)
lw      a7, 36(s3)          # twiddle[9]
lw      s11, 164(s2)         # SRAM_0[41]
sw      a1, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a1, 4(s4)
lw      s11, 4(s5)
sw      a1, 36(s2)
sw      s11, 164(s2)

# 버터플라이 10: i=10, j=42 (twiddle[10] 사용)
lw      a7, 40(s3)          # twiddle[10]
lw      s11, 168(s2)         # SRAM_0[42]
sw      a2, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a2, 4(s4)
lw      s11, 4(s5)
sw      a2, 40(s2)
sw      s11, 168(s2)

# 버터플라이 11: i=11, j=43 (twiddle[11] 사용)
lw      a7, 44(s3)          # twiddle[11]
lw      s11, 172(s2)         # SRAM_0[43]
sw      a3, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a3, 4(s4)
lw      s11, 4(s5)
sw      a3, 44(s2)
sw      s11, 172(s2)

# 버터플라이 12: i=12, j=44 (twiddle[12] 사용)
lw      a7, 48(s3)          # twiddle[12]
lw      s11, 176(s2)         # SRAM_0[44]
sw      a4, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a4, 4(s4)
lw      s11, 4(s5)
sw      a4, 48(s2)
sw      s11, 176(s2)

# 버터플라이 13: i=13, j=45 (twiddle[13] 사용)
lw      a7, 52(s3)          # twiddle[13]
lw      s11, 180(s2)         # SRAM_0[45]
sw      a5, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      a5, 4(s4)
lw      s11, 4(s5)
sw      a5, 52(s2)
sw      s11, 180(s2)

# 버터플라이 14: i=14, j=46 (twiddle[14] 사용)
lw      a7, 56(s3)          # twiddle[14]
lw      s11, 184(s2)         # SRAM_0[46]
sw      s9, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      s9, 4(s4)
lw      s11, 4(s5)
sw      s9, 56(s2)
sw      s11, 184(s2)

# 버터플라이 15: i=15, j=47 (twiddle[15] 사용)
lw      a7, 60(s3)          # twiddle[15]
lw      s11, 188(s2)         # SRAM_0[47]
sw      s10, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      s10, 4(s4)
lw      s11, 4(s5)
sw      s10, 60(s2)
sw      s11, 188(s2)

# 버터플라이 16: i=16, j=48 (twiddle[16] 사용)
lw      a7, 64(s3)          # twiddle[16]
lw      t0, 64(s2)          # SRAM_0[16]
lw      s11, 192(s2)         # SRAM_0[48]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 64(s2)
sw      s11, 192(s2)

# 버터플라이 17: i=17, j=49 (twiddle[17] 사용)
lw      a7, 68(s3)          # twiddle[17]
lw      t0, 68(s2)          # SRAM_0[17]
lw      s11, 196(s2)         # SRAM_0[49]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 68(s2)
sw      s11, 196(s2)

# 버터플라이 18: i=18, j=50 (twiddle[18] 사용)
lw      a7, 72(s3)          # twiddle[18]
lw      t0, 72(s2)          # SRAM_0[18]
lw      s11, 200(s2)         # SRAM_0[50]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 72(s2)
sw      s11, 200(s2)

# 버터플라이 19: i=19, j=51 (twiddle[19] 사용)
lw      a7, 76(s3)          # twiddle[19]
lw      t0, 76(s2)          # SRAM_0[19]
lw      s11, 204(s2)         # SRAM_0[51]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 76(s2)
sw      s11, 204(s2)

# 버터플라이 20: i=20, j=52 (twiddle[20] 사용)
lw      a7, 80(s3)          # twiddle[20]
lw      t0, 80(s2)          # SRAM_0[20]
lw      s11, 208(s2)         # SRAM_0[52]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 80(s2)
sw      s11, 208(s2)

# 버터플라이 21: i=21, j=53 (twiddle[21] 사용)
lw      a7, 84(s3)          # twiddle[21]
lw      t0, 84(s2)          # SRAM_0[21]
lw      s11, 212(s2)         # SRAM_0[53]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 84(s2)
sw      s11, 212(s2)

# 버터플라이 22: i=22, j=54 (twiddle[22] 사용)
lw      a7, 88(s3)          # twiddle[22]
lw      t0, 88(s2)          # SRAM_0[22]
lw      s11, 216(s2)         # SRAM_0[54]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 88(s2)
sw      s11, 216(s2)

# 버터플라이 23: i=23, j=55 (twiddle[23] 사용)
lw      a7, 92(s3)          # twiddle[23]
lw      t0, 92(s2)          # SRAM_0[23]
lw      s11, 220(s2)         # SRAM_0[55]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 92(s2)
sw      s11, 220(s2)

# 버터플라이 24: i=24, j=56 (twiddle[24] 사용)
lw      a7, 96(s3)          # twiddle[24]
lw      t0, 96(s2)          # SRAM_0[24]
lw      s11, 224(s2)         # SRAM_0[56]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 96(s2)
sw      s11, 224(s2)

# 버터플라이 25: i=25, j=57 (twiddle[25] 사용)
lw      a7, 100(s3)         # twiddle[25]
lw      t0, 100(s2)         # SRAM_0[25]
lw      s11, 228(s2)         # SRAM_0[57]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 100(s2)
sw      s11, 228(s2)

# 버터플라이 26: i=26, j=58 (twiddle[26] 사용)
lw      a7, 104(s3)         # twiddle[26]
lw      t0, 104(s2)         # SRAM_0[26]
lw      s11, 232(s2)         # SRAM_0[58]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 104(s2)
sw      s11, 232(s2)

# 버터플라이 27: i=27, j=59 (twiddle[27] 사용)
lw      a7, 108(s3)         # twiddle[27]
lw      t0, 108(s2)         # SRAM_0[27]
lw      s11, 236(s2)         # SRAM_0[59]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 108(s2)
sw      s11, 236(s2)

# 버터플라이 28: i=28, j=60 (twiddle[28] 사용)
lw      a7, 112(s3)         # twiddle[28]
lw      t0, 112(s2)         # SRAM_0[28]
lw      s11, 240(s2)         # SRAM_0[60]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 112(s2)
sw      s11, 240(s2)

# 버터플라이 29: i=29, j=61 (twiddle[29] 사용)
lw      a7, 116(s3)         # twiddle[29]
lw      t0, 116(s2)         # SRAM_0[29]
lw      s11, 244(s2)         # SRAM_0[61]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 116(s2)
sw      s11, 244(s2)

# 버터플라이 30: i=30, j=62 (twiddle[30] 사용)
lw      a7, 120(s3)         # twiddle[30]
lw      t0, 120(s2)         # SRAM_0[30]
lw      s11, 248(s2)         # SRAM_0[62]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 120(s2)
sw      s11, 248(s2)

# 버터플라이 31: i=31, j=63 (twiddle[31] 사용)
lw      a7, 124(s3)         # twiddle[31]
lw      t0, 124(s2)         # SRAM_0[31]
lw      s11, 252(s2)         # SRAM_0[63]
sw      t0, 0(s4)
sw      s11, 0(s5)
sw      a7, 0(s6)
lw      t0, 4(s4)
lw      s11, 4(s5)
sw      t0, 124(s2)
sw      s11, 252(s2)


/* edit code above*/
    mv      s11,    x0                         #j = 0;
store_output:
    bge     s11,    s7,     exit_store_output  # j < L_FFT
    slli    s11,    s11,    2                  # j*4 = word 단위
    add     s9,     s2,     s11                # s9 = &SRAM_0[j]
    srli    s11,    s11,    2                  # j/4 = idx복귀
    lw      t0,     0       (s9)               # t0 = SRAM_0[j]
    slli    s11,    s11,    2                  # j*4 = word단위
    add     s9,     s1,     s11                # s9 = &output[j]
    srli    s11,    s11,    2                  # idx 복귀귀
    sw      t0,     0       (s9)               # (s9) = output[j] <= t0 =SRAM_0[j]
    addi    s11,    s11,    1                  # j++
    jal     x0,     store_output

exit_store_output:
    addi    s0,     s0,     256               #+8
    addi    s1,     s1,     256               #+8
    jal     x0,     start_fft
