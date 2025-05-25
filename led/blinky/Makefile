.PHONY: clean blinky

clean:
	@if [ -f wave.vcd ]; then rm wave.vcd; fi
	@if [ -d obj_dir ]; then rm -rf obj_dir; fi

blinky: clean
	@echo "Running Verilator for blinky"
	verilator -Wall -cc --exe --build --trace -j 0 blinky.cpp blinky.v -GDIVIDER=10
	./obj_dir/Vblinky
	gtkwave wave.vcd wave.gtkw


