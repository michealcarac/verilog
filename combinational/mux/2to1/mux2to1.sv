module mux2to1 #(
    parameter WIDTH = 1
)
(
    input logic [WIDTH-1:0] in0,
    input logic [WIDTH-1:0] in1,
    input logic  sel,
    output logic [WIDTH-1:0] out
);

// Selects between in0 and in1 based on sel
assign out = sel ? in1 : in0;

endmodule
