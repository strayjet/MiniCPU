# 8-Bit CPU Design in Verilog

A simple 8-bit CPU designed and implemented in Verilog HDL. This project was built to understand the fundamental concepts of computer architecture, digital logic design, and processor implementation from the ground up.

## Overview

The CPU follows a basic fetch-decode-execute cycle and is composed of several modular components including a Program Counter, Instruction Memory, Register File, Control Unit, ALU, and Data Memory.

The design emphasizes modularity and readability, making it suitable for educational purposes and future expansion.

## Features

- 8-bit processor architecture
- 16 general-purpose registers
- 16-bit instruction format
- Program Counter (PC)
- Instruction Memory
- Register File with two read ports and one write port
- Arithmetic Logic Unit (ALU)
- Control Unit for instruction decoding
- Data Memory
- Reset support
- Modular Verilog implementation

## CPU Architecture

### Program Counter (PC)
Maintains the address of the current instruction and advances through the program sequentially.

### Instruction Memory
Stores program instructions and provides the instruction corresponding to the current program counter value.

### Control Unit
Decodes instructions and generates the control signals required for CPU operation.

### Register File
Contains 16 registers, each 8 bits wide.

Supports:
- Two simultaneous reads
- One write operation

### Arithmetic Logic Unit (ALU)
Performs arithmetic and logical operations such as:

- Addition
- Subtraction
- Bitwise AND
- Bitwise OR
- Comparison operations

### Data Memory
Provides storage for load and store instructions.

## Instruction Format

The processor uses a 16-bit instruction format:

| Bits | Field |
|--------|--------|
| 15:12 | Opcode |
| 11:8 | Destination Register (Rd) |
| 7:4 | Source Register 1 (Rs1) |
| 3:0 | Source Register 2 / Immediate |

Example:

```text
0001 0001 0010 0011
```

Possible interpretation:

```text
ADD R1, R2, R3
```


## Execution Flow

1. Fetch instruction from Instruction Memory.
2. Decode instruction using the Control Unit.
3. Read operands from the Register File.
4. Execute the operation in the ALU.
5. Access Data Memory if required.
6. Write the result back to the Register File.
7. Update the Program Counter.
8. Repeat until program completion.

## Running the Simulation

Compile the design:

```bash
iverilog -o cpu_sim *.v
```

Run the simulation:

```bash
vvp cpu_sim
```

Generate and view waveforms:

```bash
iverilog -o cpu_sim *.v
vvp cpu_sim
gtkwave dump.vcd
```

## Learning Outcomes

Through this project, the following concepts were explored:

- Computer Architecture
- Processor Datapath Design
- Instruction Execution
- Register-Based Architectures
- Verilog HDL
- Hardware Simulation
- Digital System Design
- Control Logic Implementation

## Future Improvements

- Branch and jump instructions
- Pipelined architecture
- Interrupt support
- Expanded instruction set
- Hazard detection and forwarding
- Cache memory
- UART communication
- Assembly language support
- Custom assembler

## Author

Developed as a personal learning project to gain practical experience in CPU design and Verilog HDL implementation.
