# MicroprocessorApplication
Implementaion of Memory Based 64pt FFT Accelerator with RISC-V (multi core processing)

ㅤㅤㅤㅤ**TP1: FFT Accelerator with a Single Core**  ㅤㅤㅤㅤㅤㅤㅤㅤㅤ **TP2: FFT Accelerator with Multiple Cores**


<img width="408" height="242" alt="image" src="https://github.com/user-attachments/assets/f722fae9-80f3-4487-90f3-206604fc04f6" /> <img width="408" height="242" alt="image" src="https://github.com/user-attachments/assets/82ac7a00-9f5e-4239-a927-d7bea267f9bb" />

TP_1과 TP_2 모두 아래의 동일한 시스템을 이용한다.


<img width="165" height="388" alt="image" src="https://github.com/user-attachments/assets/155ba85c-a588-481e-a0a9-963542ac2b63" />

두 과제 모두 64pt FFT 시간 단축을 목표로 unrolling, scheduling 등의 기법을 이용한다.

TP_1에서는 65,640,000ps => 14,190,000ps로 시간을 단축하였다. (x5)

TP_2에서는 65,640,000ps => 6,634,000ps로 시간을 단축하였다.  (x10)
ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ
자세한 Rules(TP_Microprocessor.pdf)과 시간 단축에 사용한 기법과 ablation study(TP_MP_*.pdf)과 함께 첨부하였다.


