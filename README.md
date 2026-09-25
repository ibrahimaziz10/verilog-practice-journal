# Verilog Lab Log

## 🎯 Objective
This repository is my personal workspace to **practice Verilog and digital design using Vivado**.  
It acts as a logbook where I document each project — from basic combinational circuits to more advanced sequential systems.  
The goal is to build a systematic record of:
- Source code
- Testbenches
- Simulation results
- Synthesis reports
- Notes and learnings

---

## 🗂️ Repository Structure
verilog-lab-log/
│
├── README.md                # Main overview (this file)
│
├── project1_mux2x1/
│   ├── mux2x1.v              # Verilog source
│   ├── mux2x1_tb.v           # Testbench
│   ├── waveform.png          # Simulation waveform screenshot
│   ├── synth_report.png      # Synthesis screenshot
│   └── README.md             # Project-specific explanation
│
├── project2_full_adder/
│   ├── full_adder.v
│   ├── full_adder_tb.v
│   ├── waveform.png
│   ├── synth_report.png
│   └── README.md
│
└── projectN_counter/
├── counter.v
├── counter_tb.v
├── waveform.png
├── synth_report.png
└── README.md


Each **project folder** contains:
- Verilog source (`.v`)
- Testbench (`_tb.v`)
- Screenshots (`.png`)
- A README explaining the design, results, and notes

---

## 🛠️ Tools Used
- **Vivado** → for simulation, synthesis, and implementation  
- **GTKWave** → optional waveform viewer  
- **GitHub** → version control, documentation, and portfolio showcase  

---

## 📖 Workflow
1. **Design**: Write Verilog source code (`.v`)  
2. **Test**: Create a testbench (`_tb.v`) and simulate in Vivado  
3. **Capture Results**:  
   - Save waveform screenshot (`waveform.png`)  
   - Save synthesis screenshot (`synth_report.png`)  
4. **Document**: Add a README in the project folder with:  
   - Objective  
   - Approach  
   - Simulation results (embed waveform)  
   - Synthesis results (embed report)  
   - Notes / learnings  
5. **Commit & Push**: Use clear commit messages like:  
