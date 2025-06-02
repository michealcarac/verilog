
A modular collection of synthesizable Verilog building blocks for digital design.

Each module directory is:
- **Self-contained**: Includes RTL, testbench(s), Makefile
- **Parameterized**: Widths, flags, modes, and behavior can be configured
- **Testable**: `make` runs simulation via Verilator and generates waveforms

## Cloning

Two options for cloning this repo
* Verilog Modules
* Verilog Modules + Skywater PDK for Synthesis Benchmarks

To only get the Verilog Modules, simply clone the repo:
```bash
git clone git@github.com:michealcarac/verilog.git
```

To get the Verilog Modules + Initialize the Skywater PDK (11GB)
```bash
git clone git@github.com:michealcarac/verilog.git --recurse-submodules
```

Build the Skywater PDK Timing Models
```bash
cd sky130
make timing
```

## Submodule

To utilize this repo as a submodule, it is advisable to follow these steps to not pull in Skywater PDK.

Add to repo:
```bash
git submodule add git@github.com:michealcarac/verilog.git verilog
```
Initialize but don't init Skywater:
```bash
git submodule update --init verilog
```
Edit your .gitmodules to prevent unwanted recursive init by default
```bash
[submodule "verilog"]
    path = verilog
    url = git@github.com:michealcarac/verilog.git
    fetchRecurseSubmodules = false
```

## Simulation & Testing

All modules are tested using **Verilator** + **GTKWave**

Example:
```bash
cd verilog/counter/cntr_updn_flags
make wrap   # Test wraparound counter
make clamp  # Test clamping behavior
```

## Tools
### Simulation & Linting

* Verilator: For fast simulation and elaboration

* GTKWave: For VCD waveform viewing

* Yosys: Optional — RTL elaboration, synthesis, netlist dumping

## TODO

* Formal verification harnesses (SymbiYosys)

* APB/AHB/AXI-lite bus interfaces

* Sequential Logic
