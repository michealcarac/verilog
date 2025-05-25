#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include "Vcntr_updn_flags.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

// Global simulation time
vluint64_t main_time = 0;

// Required by Verilator for $time and waveform timing
double sc_time_stamp(){
    return main_time;
}

void run_cycles(Vcntr_updn_flags* tb, VerilatedVcdC* vcd, vluint64_t& main_time, int cycles) {

    for (int i = 0; i < cycles; i++) {
        // Clock cycle (2 edges per full cycle)
        for (int j = 0; j < 2; j++) {
            tb->i_clk = !tb->i_clk;
            tb->eval();
            vcd->dump(main_time++);
        }

        //printf("i = %3d | clk = %d | arst = %d | dir = %d | out = %2d | max_flag = %d | min_flag = %d\n",
        //       i, tb->clk, tb->arst, tb->dir, tb->out, tb->max_flag, tb->min_flag);
    }
}

int main(int argc, char **argv) {
    // Call commandArgs first!
    Verilated::commandArgs(argc,argv);

    // Instantiate the design
    Vcntr_updn_flags *tb = new Vcntr_updn_flags;

    // Tracing/Dump VCD
    VerilatedVcdC* vcd = new VerilatedVcdC;
    Verilated::traceEverOn(true);
    tb->trace(vcd, 99);
    vcd->open("wave.vcd");

    // Parameters
    const int WIDTH = 4;
    const int MAX_CNT = 7;

    // Reset (0 for waiting for reset)
    tb->i_arst = 0;
    tb->i_clk = 0;
    tb->eval();
    vcd->dump(main_time++);

    // Init
    tb->i_arst = 1;
    tb->i_updn = 1;
    tb->i_en = 0;
    run_cycles(tb, vcd, main_time, 1);

    // Test Enable
    tb->i_arst = 0;
    tb->i_en = 1;
    run_cycles(tb, vcd, main_time, 2);
    tb->i_en = 0;
    run_cycles(tb, vcd, main_time, 2);
    tb->i_arst = 1;
    run_cycles(tb, vcd, main_time, 2);
    tb->i_arst = 0;
    tb->i_en = 1;

    // Set Ports (UP direction)
    tb->i_updn = 1;
    run_cycles(tb, vcd, main_time, MAX_CNT + 5);

    // Set Ports (DOWN direction)
    tb->i_updn = 0;
    run_cycles(tb, vcd, main_time, MAX_CNT + 5);
    
    vcd->close();
    return 0;
}

