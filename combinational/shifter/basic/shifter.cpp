#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include "Vshifter.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

// Global simulation time
vluint64_t main_time = 0;

// Required by Verilator for $time and waveform timing
double sc_time_stamp(){
    return main_time;
}

void run_cycles(Vshifter* tb, VerilatedVcdC* vcd, vluint64_t& main_time, int cycles) {

    for (int i = 0; i < cycles; i++) {
        tb->eval();
        vcd->dump(main_time++);
        
        // Clock cycle (2 edges per full cycle)
        //for (int j = 0; j < 2; j++) {
        //    tb->i_clk = !tb->i_clk;
        //    tb->eval();
        //    vcd->dump(main_time++);
        //}

        //printf("i = %3d | clk = %d | arst = %d | dir = %d | out = %2d | max_flag = %d | min_flag = %d\n",
        //       i, tb->clk, tb->arst, tb->dir, tb->out, tb->max_flag, tb->min_flag);
    }
}

int main(int argc, char **argv) {
    // Call commandArgs first!
    Verilated::commandArgs(argc,argv);

    // Instantiate the design
    Vshifter *tb = new Vshifter;

    // Tracing/Dump VCD
    VerilatedVcdC* vcd = new VerilatedVcdC;
    Verilated::traceEverOn(true);
    tb->trace(vcd, 99);
    vcd->open("wave.vcd");

    tb->i_data  = 3;
    tb->i_dir   = 0;
    tb->i_shamt = 4;
    run_cycles(tb, vcd, main_time, 5);

    tb->i_data  = 3;
    tb->i_dir   = 0;
    tb->i_shamt = 2;
    run_cycles(tb, vcd, main_time, 5);

    tb->i_data  = 192;
    tb->i_dir   = 1;
    tb->i_shamt = 4;
    run_cycles(tb, vcd, main_time, 5);

    tb->i_data  = 192;
    tb->i_dir   = 1;
    tb->i_shamt = 2;
    run_cycles(tb, vcd, main_time, 5);


    vcd->close();
    return 0;
}

