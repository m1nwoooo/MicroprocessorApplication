# 🤖 MicroprocessorApplication
Implementaion of Memory Based 64pt FFT Accelerator with RISC-V

■ 시간 단축에 사용한 기법과 ablation study(**TP_MP_*.pdf**)를 구체화하여 보고서를 함께 첨부하였습니다.


## ⚡Figure
**TP1: FFT Accelerator with a Single Core   ㅤㅤㅤㅤㅤTP2: FFT Accelerator with Multiple Cores**


<img width="360" height="240" alt="image" src="https://github.com/user-attachments/assets/f722fae9-80f3-4487-90f3-206604fc04f6" /> <img width="360" height="240" alt="image" src="https://github.com/user-attachments/assets/82ac7a00-9f5e-4239-a927-d7bea267f9bb" /> 






ㅤㅤㅤㅤ

## 💡MAIN IDEA

| 구분 | **TP_1 (single_core)** | **TP_2 (three_cores)** |
| :--- | :--- | :--- |
| **주요 전략** | Register를 활용한 **Data Reuse**와 **Unrolling** 기법을 사용했습니다. | 각 코어별로 역할을 분배하여 **Pipeline**을 구성하고, 모든 코어가 쉬는 구간 없이 동작하도록 최적화했습니다. |
| **핵심 아이디어** | 이전 stage의 output이 다음 stage의 input이 된다는 점에 주목하여, 가로 방향으로 연산하며 register 내의 데이터를 최대한 재사용했습니다.<br><br><img width="425" alt="TP_1" src="https://github.com/user-attachments/assets/a03b6e20-818b-401c-87bd-10c32ea2c9fb"> | 메모리 접근 시 `Core 0 > Core 1 > Core 2` 순으로 우선순위가 있다는 것을 실험적으로 발견하고, 이를 기반으로 각 코어의 역할을 효율적으로 분배했습니다.<br><br><img width="705" alt="TP_2" src="https://github.com/user-attachments/assets/d4cda7ae-c4c7-4df4-90f9-0f87fcd7939d"> |
| **성능 개선** | 65,640,000 ps ➡️ **14,190,000 ps** | 65,640,000 ps ➡️ **6,634,000 ps** |
| **속도 향상** | **약 5배** | **약 10배** |



