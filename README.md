# 8-bit Accumulator CPU (FSM-based, Verilog HDL)

## Overview
This project implements an **8-bit accumulator-based CPU** using **Verilog HDL**.  
The design follows a **finite state machine (FSM)** approach and includes **status flags**
and **conditional branching instructions**.

The CPU was fully simulated and verified using a **self-checking testbench**.

---

## Architecture
- Accumulator-based datapath
- FSM control unit with states:
  - FETCH
  - DECODE
  - EXECUTE
  - HALT
- Program Counter (PC)
- ROM-based instruction memory

---

## Instruction Set

| Opcode | Instruction | Description |
|------|------------|-------------|
| 1x | LOAD | Load immediate value into ACC |
| 2x | ADD  | Add immediate value to ACC |
| 3x | SUB  | Subtract immediate value from ACC |
| 4x | JZ   | Jump if Zero flag is set |
| 5x | JNZ  | Jump if Zero flag is clear |
| Fx | HALT | Stop execution |

---

## Status Flags
- **Z (Zero)**: Set when result is zero  
- **C (Carry)**: Set on carry / borrow  
- **N (Negative)**: Set when MSB of result is 1  

---

## Verification
- Self-checking testbench
- Waveform analysis using **GTKWave**
- Program memory loaded using `$readmemh`

---

## Files
- `design.sv` – CPU implementation  
- `testbench.sv` – Self-checking testbench  
- `prog.mem` – Sample program memory  

---

## How to Run
```bash
iverilog -g2012 design.sv testbench.sv -o cpu_sim
vvp cpu_sim
