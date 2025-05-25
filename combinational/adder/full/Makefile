.PHONY: clean full_adder

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

full_adder: clean
	@echo "Running Verilator for full adder"
	verilator -Wall -cc --exe --build --trace -j 0 full_adder.cpp full_adder.v
	./obj_dir/Vfull_adder
	gtkwave wave.vcd wave.gtkw

