// =============================================================================
// Parameterized Ripple Adder
// -----------------------------------------------------------------------------
// - Utilizes a Full Adder
//
// Author: Empyrea (@michealcarac)
// =============================================================================

module ripple_adder_prim #(
    parameter WIDTH = 4
)
(
    input wire i_carry,
    input wire [WIDTH-1:0] i_data0,
    input wire [WIDTH-1:0] i_data1,
    output reg [WIDTH-1:0] o_sum,
    output reg o_carry
);

wire [WIDTH:0] carry;
assign carry[0] = i_carry;

genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin : ADD_STAGE
        // Stage i: Add i_data0[i], i_data1[i], and i_carry[i], produce o_sum[i] and carry[i+1]
        full_adder u_full_adder (
            .i_data0 (i_data0[i]),
            .i_data1 (i_data1[i]),
            .i_carry (carry[i]),
            .o_sum (o_sum[i]),
            .o_carry (carry[i+1])
        );
    end
endgenerate

assign o_carry = carry[WIDTH];     

endmodule
