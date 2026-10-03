# 32-to-1 Multiplexer in 32x Architecture 🔳

## Project Description
This project implements a hierarchical 32-to-1 multiplexer in Verilog.  
The design is modular, built step by step from smaller multiplexers (2:1 → 4:1 → 8:1 → 16:1 → 32:1).  
A testbench verifies correctness through exhaustive simulation and walking-1 pattern checks.  
Waveforms and synthesis reports are included.

## Design Hierarchy
- **mux2to1** : basic 2-to-1 multiplexer
- **mux4to1** : conditional operator implementation
- **mux8to1** : two 4-to-1 + one 2-to-1
- **mux16to1** : two 8-to-1 + one 2-to-1
- **mux32to1** : two 16-to-1 + one 2-to-1

Hierarchy chain:
mux2to1 → mux4to1 → mux8to1 → mux16to1 → mux32to1


## Testbench (tb_32to1mux)
- Input initialized with `32'hA5A5A5A5`
- Iterates through all 32 select values (`sel`) and compares output against `in[sel]`
- Walking-1 pattern test ensures no stuck-at faults
- Displays results in simulation log

Example log:
Time = 20 | sel = 5 (5'b00101) | Expected bit = 1 | Output out = 1
SUCCESS

## Simulation
- Run with Icarus Verilog, ModelSim, or Vivado
- Generates `waveform.vcd` for GTKWave visualization
- Confirms correct bit selection based on `sel`
![Waveform](<img width="610" height="197" alt="Waveform png" src="https://github.com/user-attachments/assets/b14c3c2c-eb24-4667-8634-a84387c1b1bd" />)


## Synthesis
- Synthesized using Xilinx Vivado (or equivalent)
- Pure combinational logic (no sequential elements)
- Optimized gate-level netlist with decoder + OR tree
- Resource usage proportional to hierarchy depth
- !(Systhesis)(<img width="458" height="269" alt="Screenshot 2026-10-03 172927" src="https://github.com/user-attachments/assets/eb799214-df28-4de2-9b15-ea9a1e7cc70d" />)
