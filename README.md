# UVM_Projects

Collection of SystemVerilog and UVM-based verification projects including FIFO, RAM verification, virtual sequencer implementation, configuration database usage, and testcase development.

---

## Skills Demonstrated

- SystemVerilog
- UVM Methodology
- Constrained Random Verification
- Functional Verification
- Virtual Interface
- Config DB
- Sequences & Sequencers
- Driver & Monitor Development
- Scoreboard Implementation
- Assertions
- Testbench Architecture
- QuestaSim Simulation


## Repository Structure

### FIFO1
Verification environment for synchronous FIFO design.

### FIFO_testcases
Collection of FIFO test scenarios including:
- Full condition
- Empty condition
- Overflow/Underflow cases

### RAM
Basic RAM verification using SystemVerilog/UVM.

### RAM VERIFICATION WITH CONFIG DB
Demonstrates usage of:
- `uvm_config_db`
- virtual interface passing
- reusable environment setup

### RAM_UVM_WITH_CONFIG_DB
Advanced RAM verification environment using:
- agents
- monitors
- scoreboards
- constrained random sequences

### RAM_VIRTUAL_SEQUENCE_RE
Implementation of:
- virtual sequence
- virtual sequencer
- coordinated sequence execution

### Lab01 / Lab02 / Lab03
Practice and learning exercises related to UVM and verification concepts.

---

## Verification Components Used

- Environment (`env`)
- Agent (`agent`)
- Driver (`driver`)
- Monitor (`monitor`)
- Sequencer (`sequencer`)
- Sequences (`sequence`)
- Scoreboard (`scoreboard`)
- Transaction Classes
- Test Classes

---

## Tools Used

- QuestaSim / ModelSim
- SystemVerilog
- UVM Library

---

## How to Run

Example compilation and simulation flow:

```bash
vlog *.sv
vsim top
run -all
