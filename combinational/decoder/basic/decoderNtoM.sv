module decoderNtoM #(
    parameter N_WIDTH = 2
)
(
    input logic [N_WIDTH-1:0] dec_i,
    output logic [(1 << N_WIDTH)-1:0] dec_o // 2^N_WIDTH
);

always_comb begin
    dec_o = 1 << dec_i; // assign minterms, shift 1 left based on dec_i value
end

endmodule
