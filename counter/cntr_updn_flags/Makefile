.PHONY: clean cntr

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

wrap: clean
	@echo "Running Verilator for cntr_updn_flags"
	verilator -Wall -cc --exe --build --trace -j 0 cntr_updn_flags.cpp cntr_updn_flags.v -GWIDTH=4 -GWRAP_EN=1 -GMAX_CNT=7 -GMIN_CNT=1
	./obj_dir/Vcntr_updn_flags
	gtkwave wave.vcd wave.gtkw

clamp: clean
	@echo "Running Verilator for cntr_updn_flags"
	verilator -Wall -cc --exe --build --trace -j 0 cntr_updn_flags.cpp cntr_updn_flags.v -GWIDTH=4 -GWRAP_EN=0 -GMAX_CNT=7 -GMIN_CNT=1
	./obj_dir/Vcntr_updn_flags
	gtkwave wave.vcd wave.gtkw

