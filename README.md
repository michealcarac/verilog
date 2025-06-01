
A modular collection of synthesizable Verilog building blocks for digital design.

Each module directory is:
- **Self-contained**: Includes RTL, testbench(s), Makefile
- **Parameterized**: Widths, flags, modes, and behavior can be configured
- **Testable**: `make` runs simulation via Verilator and generates waveforms

## Submodules

This git repo contains a Skywater PDK (130nm) used for Synthesis.

To access:
```bash
git submodule update --recursive # (Include --init if new repo)
cd sky130
make timing
```
Note: sky130 + submodules = 35GB, 70GB after make timing modules. 

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
