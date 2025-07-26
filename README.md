
# 🧮 Booth Multiplier – RTL Design Using Verilog

This project demonstrates the RTL implementation of a **4-bit Booth Multiplier** using Verilog HDL. Booth’s algorithm allows efficient multiplication of signed binary numbers. The design includes a testbench, waveform generation, and simulation using open-source tools like Icarus Verilog and GTKWave.

---

## 🧾 Description

Booth’s algorithm is a technique used to multiply binary numbers more efficiently by reducing the number of required arithmetic operations. This Verilog project implements:

- A parameterized 4×4 signed Booth multiplier
- Support for 2’s complement arithmetic
- RTL control using `start` and `done` signals
- Testbench for functional verification
- VCD output for waveform analysis with GTKWAVE

---

## 🧪 How to Run

Ensure you have **Icarus Verilog** and **GTKWave** installed.

1. **Compile Verilog code:**
   ```bash
   iverilog -o booth_multiplier.vvp -v booth_multiplier_tb.v booth_multiplier.v

3. **View waveform in GTKWave:**
   ```bash
      gtkwave booth.vcd


   ├── booth_multiplier.v     # RTL design of Booth multiplier
   ├── booth_multiplier_tb.v             # Testbench with stimulus
   ├── booth.vcd              # Generated waveform file
   ├── README.md              # Project documentation
## ✅ Output & Features
✔️ Sample Testbench Output
     
    Test Case 1: -3 × 5 = -15  
    Test Case 2: -4 × -2 = 8  
## ⚙️ Features
🔧 Features:


    Signed multiplication with Booth’s algorithm

    Start and reset control signals
 
    Waveform generation with $dumpvars

    Verilog testbench included

    Compact and reusable RTL module

