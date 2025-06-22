module ripple_adder_prim_syn #(
    parameter WIDTH = 4
)
(input clk, input [3:0] a, b, input cin, output reg [3:0] sum, output reg cout);

  wire [3:0] internal_sum;
  wire internal_cout;

  ripple_adder_prim #(.WIDTH(WIDTH)) uut (.i_data0(a), .i_data1(b), .i_carry(cin), .o_sum(internal_sum), .o_carry(internal_cout));

  always @(posedge clk) begin
    sum <= internal_sum;
    cout <= internal_cout;
  end
endmodule