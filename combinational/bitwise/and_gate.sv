module and_gate #(
    parameter WIDTH = 4
)
(
    input logic [WIDTH-1:0] A,
    input logic [WIDTH-1:0] B,
    output logic [WIDTH-1:0] C
);

assign C = A & B; // Bitwise AND

endmodule