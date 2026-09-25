## What I Learned from FSM Binary Sequential Detector 

This Learning Project focused on **Sequential Circuit Design and Implementation on FPGA** using Verilog.  
The main task was building a **Finite State Machine (FSM) Adder** and verifying its behavior through simulation.

### Key Learnings
1. **Blocking vs Non-Blocking Statements**
   - Blocking (`=`) executes sequentially, step by step.
   - Non-blocking (`<=`) allows parallel updates, which is crucial for synchronous designs.
   - I learned when to use each to avoid race conditions and unintended behavior.

2. **Inferred Latches**
   - Latches appear when signals are not fully defined in all branches of an `always` block.
   - They introduce unnecessary storage and can cause unpredictable results.
   - To prevent them, every case/state must assign outputs explicitly.

3. **FSM Behavior**
   - The FSM cycles through states **S0 → S6** depending on input `X`.
   - Output `S` represents the sequential sum bit, while `V` indicates overflow detection.
   - The design tests **bit‑by‑bit sequential addition**, where each clock edge processes one input bit from the test sequence (`1101_1100_1011`).

4. **Waveform & Verification**
   - The waveform confirms correct state transitions and output values.
   - `V` (overflow) is asserted only in state `S6` when `X=1`, showing the FSM correctly detects carry overflow.
   - This validates the FSM’s role as a sequential adder rather than a combinational one.

### Sequential Bit Testing
- The testbench feeds a **12‑bit sequence** (`1101_1100_1011`) into the FSM one bit per clock cycle.
- This demonstrates how the FSM processes inputs **sequentially over time**, unlike combinational adders that compute instantly.
- The waveform shows how each bit affects the state and outputs, making the sequential nature clear.

---

## 📊 Analysis of the FSM
- **Waveform Screenshot**
  <img width="1115" height="415" alt="Screenshot 2026-09-25 212547" src="https://github.com/user-attachments/assets/727d49ae-eefa-45b3-a014-fa7e5d42491c" />
- **Synthesis Report**
- <img width="1080" height="487" alt="Screenshot 2026-09-25 212631" src="https://github.com/user-attachments/assets/7bc22e85-eb89-4585-af39-ffc847155435" />

