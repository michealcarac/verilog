TOP              := ripple_adder
PARAMETERS       := -GWIDTH=4
ADDITIONAL_FILES := 

include $(ENV_MAKEFILE)

.PHONY: clean $(TOP) $(TOP)_flat

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

$(TOP): clean
	@echo "Running Verilator for $(TOP)"
	verilator -Wall -cc --exe --build --trace -j 0 $(TOP).cpp $(TOP).v $(ADDITIONAL_FILES) $(PARAMETERS)
	./obj_dir/V$(TOP)
	gtkwave wave.vcd wave.gtkw



