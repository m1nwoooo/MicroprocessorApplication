# MicroprocessorApplication
Implementaion of Memory Based 64pt FFT Accelerator with RISC-V (multi core processing)

ㅤㅤ**TP1: FFT Accelerator with a Single Core**   ㅤㅤㅤ**TP2: FFT Accelerator with Multiple Cores** 


<img width="360" height="240" alt="image" src="https://github.com/user-attachments/assets/f722fae9-80f3-4487-90f3-206604fc04f6" /> <img width="360" height="240" alt="image" src="https://github.com/user-attachments/assets/82ac7a00-9f5e-4239-a927-d7bea267f9bb" /> 

TP_1과 TP_2 모두 위의 동일한 시스템을 이용한다. (TP_1: single core, TP_2: 3 cores)




두 과제 모두 64pt FFT 시간 단축을 목표로 한다.

**<TP_1_signle_core>**


register를 활용한 data reuse와 unrolling 기법이 주된 전략이었다.

<img width="850" height="424" alt="image" src="https://github.com/user-attachments/assets/a03b6e20-818b-401c-87bd-10c32ea2c9fb" />

특히, 이전 stage의 output이 다음 stage의 input이 된다는 것에 주목하였다.

stage 순서대로 계산하지 않고 위 그림의 가로 방향으로 연산해 나가며, register 개수가 허락하는 한 input의 연산결과 output을 최대한 활용하여 data reuse를 극대화하였다. 

65,640,000ps => 14,190,000ps로 시간을 단축하였다. . **(x5)**

**<TP_2_three_cores>**

각 코어별로 역할을 분배하여 모든 코어가 가능한 쉬는 구간없이 동작하도록 pipeline을 구성하였다.

<img width="1410" height="399" alt="image" src="https://github.com/user-attachments/assets/d4cda7ae-c4c7-4df4-90f9-0f87fcd7939d" />

특히, 메모리 접근 시 core 0 > core 1 > core 2 순서대로 우선순위를 가진다는 것을 실험적으로 알아내어, 각 코어들의 역할을 분배했다.

TP_2에서는 65,640,000ps => 6,634,000ps로 시간을 단축하였다.  **(x10)**


자세한 Rules (**TP_Microprocessor.pdf**)과 시간 단축에 사용한 기법과 ablation study(**TP_MP_*.pdf**)과 함께 첨부하였다.


