// =============================================================================
// Parameterized Ripple Adder
// -----------------------------------------------------------------------------
// - Utilizes a Full Adder
//
// Author: Empyrea (@michealcarac)
// =============================================================================

module ripple_adder #(
    parameter WIDTH = 4
)
(
    input wire i_carry,
    input wire [WIDTH-1:0] i_data0,
    input wire [WIDTH-1:0] i_data1,
    output wire [WIDTH-1:0] o_sum,
    output wire o_carry
);

assign {o_carry, o_sum} = i_data0 + i_data1 + {{(WIDTH-1){1'b0}},i_carry}; 

endmodule
