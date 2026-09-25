# Project: 4x1 Multiplexer (MUX) with Testbench

## 🎯 Objective
Design and simulate a **4x1 multiplexer** in Verilog.  
Verify its functionality using a testbench that applies different select inputs (`sel`) to ensure the correct data line is routed to the output.

---
## 📂 Project Structure
```
project_mux4x1/
│
├── mux4x1.v          # Verilog source code for the 4x1 multiplexer
└── README.md         # Project documentation (this file) that containst the details
```


---

## 🛠️ Tools Used
- **Vivado** → for simulation and synthesis  
- **GTKWave** → optional waveform viewer  
- **GitHub** → version control and documentation  

---

## 📝 Code Overview
- **mux4x1.v**  
  Implements a 4x1 multiplexer using behavioral modeling (`always` block).  
  Inputs: `data[3:0]`, `sel[1:0]`  
  Output: `y`  

- **mux_tb.v**  
  Testbench applies different `sel` values while keeping `data = 4'b1010`.  
  Expected behavior:  
  - `sel = 00 → y = data[0]`  
  - `sel = 01 → y = data[1]`  
  - `sel = 10 → y = data[2]`  
  - `sel = 11 → y = data[3]`  

---

## 📸 Results
### Simulation Waveform
<img width="847" height="231" alt="Screenshot 2026-09-25 163532" src="https://github.com/user-attachments/assets/19cd2bb0-9acb-48bd-aeda-f90c6aef4afd" />


### Synthesis Report
<img width="1072" height="407" alt="Screenshot 2026-09-25 163641" src="https://github.com/user-attachments/assets/2b66b739-bf17-4f29-8440-9086d069495e" />


---

## ✅ Learnings
- Testbench verifies multiplexer logic by cycling through all select inputs.  
- Screenshots provide visual confirmation of simulation and synthesis.  
- This project demonstrates the workflow: **design → testbench → simulate → synthesize → document**.
