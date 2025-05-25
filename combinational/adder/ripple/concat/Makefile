.PHONY: clean ripple_adder

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

ripple_adder: clean
	@echo "Running Verilator for ripple adder"
	verilator -Wall -cc --exe --build --trace -j 0 ripple_adder.cpp ripple_adder.v -GWIDTH=4
	./obj_dir/Vripple_adder
	gtkwave wave.vcd wave.gtkw

