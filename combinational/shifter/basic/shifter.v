// Basic Shifter

module shifter #(
    parameter WIDTH = 8
)
(
    input wire [WIDTH-1:0] i_data,
    input wire [$clog2(WIDTH)-1:0] i_shamt, // Shift Amount
    input wire i_dir, // 0 -> left, 1 = right
    output wire [WIDTH-1:0] o_result
);

    // Idea: 
    //  assign o_result = i_dir ? {{i_shamt{1'b0}}, i_data[WIDTH-1:i_shamt-1]} : {i_data[(WIDTH-i_shamt-1):0], {i_shamt{1'b0}}};
    // Issue: Synthesis tools do not allow variable replication values (i_shamt in this instance)

    // Using generate to precompute shifts
    wire [WIDTH-1:0] computed_shifts [0:WIDTH-1];
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin: gen_compute_shift
            // Direction:                       Right Shift                      Left Shift
            assign computed_shifts[i] = i_dir ? {{i{1'b0}}, i_data[WIDTH-1:i]} : {i_data[(WIDTH-i-1):0], {i{1'b0}}};
        end
    endgenerate

    // Result is the correct computed shift
    assign o_result = computed_shifts[i_shamt];

endmodule
