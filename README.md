# 32-bit Semi-RISC CPU
This project implements a simple, modular 32-bit CPU architecture in VHDL, composed of a data path, control unit, and reset circuitry, built around a three-state finite state machine (FSM) for instruction fetch, decode, and execution. It simulates essential CPU operations including memory interaction, arithmetic computation, instruction handling, and basic branching logic as well as highlights the scalability and reusability of RISC architecture, pipelining and improving datapath timing. 

## Key Components
1. **Data Path**
   - Backbone of the CPU. Manages registers, PC, IR, ALU, Memory access, mux networks, zero-extension blocks, and unsigned extension blocks. The registers and ALU components are made from scaling 2-bit components for better understanding of hardware design hiearchy. 
2. **Control Unit**
   - A FSM that manages the timing and control signals over three primary states. The 3 states of fetch, decode, and execute are used to load instructions from memory, extract the opcode and and compute the registers, muxes, and conditional operators to perform the desired operations. This implementation creates a simple yet effective pipeline ideal for sequential execution. 
3. **CPU**
   - Integrates the data path and the control unit via a global clock signal and a reset module. 

