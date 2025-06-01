TOP              := ripple_adder
PARAMETERS       := -GWIDTH=4
ADDITIONAL_FILES := 

.PHONY: clean $(TOP) $(TOP)_flat

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

$(TOP): clean
	@echo "Running Verilator for $(TOP)"
	verilator -Wall -cc --exe --build --trace -j 0 $(TOP).cpp $(TOP).v $(ADDITIONAL_FILES) $(PARAMETERS)
	./obj_dir/V$(TOP)
	gtkwave wave.vcd wave.gtkw

$(TOP)_flat: clean
	@echo "Flattening $(TOP).v"
	@yosys -p "read_verilog $(TOP).v $(ADDITIONAL_FILES); \
				 hierarchy -top $(TOP); \
				 proc; opt; flatten; opt; \
				 write_verilog -noexpr $(TOP)_flat.v; \
				 techmap; stat" > $(TOP)_report.txt
	@echo "Removing (* src) attributes"
	@sed -i '/(\* src =/d' $(TOP)_flat.v
	@echo "Stripping Report Header"
	@sed -i '/^=== /,$$!d' $(TOP)_report.txt


