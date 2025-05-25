.PHONY: clean ripple_adder_prim

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

ripple_adder_prim: clean
	@echo "Running Verilator for ripple adder w/ primitives"
	verilator -Wall -cc --exe --build --trace -j 0 ripple_adder_prim.cpp ripple_adder_prim.v ../../full/full_adder.v -GWIDTH=4
	./obj_dir/Vripple_adder_prim
	gtkwave wave.vcd wave.gtkw


