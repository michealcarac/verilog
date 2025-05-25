module full_adder
(
    input wire i_carry,
    input wire i_data0,
    input wire i_data1,
    output reg o_sum,
    output reg o_carry
);

always @(*) begin
    o_sum = i_data0 ^ i_data1 ^ i_carry;
    o_carry = (i_data0 & i_data1) | (i_carry & (i_data0 ^ i_data1));
end

endmodule
