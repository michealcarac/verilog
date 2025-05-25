// =============================================================================
// Parameterized Up/Down Counter with Optional Rollover and Status Flags
// -----------------------------------------------------------------------------
// - Configurable bit-width and programmable minimum/maximum count value
// - Optional wraparound behavior controlled via WRAP_EN parameter
// - Includes both pipelined and combinational min/max status flags
// - Asynchronous active-high reset and gated counting via enable signal
//
// Author: Empyrea (@michealcarac)
// =============================================================================

module cntr_updn_flags #(
    parameter WIDTH = 5,
    parameter MAX_CNT = (1 << WIDTH) -1, // Default =  2^WIDTH - 1
    parameter MIN_CNT = 0,
    parameter WRAP_EN = 0                // 1 = Wrap, 0 = Clamp
)
(
    input  wire            i_clk,
    input  wire            i_arst,       // Async Reset (active high)
    input  wire            i_en,         // Enable
    input  wire            i_updn,       // 1 = up, 0 = down
    output reg [WIDTH-1:0] o_count,
    output wire            o_max,
    output wire            o_min,
    output wire            o_max_pipe,   // Pipelined max flag (Delayed by 1 cycle)
    output wire            o_min_pipe    // Pipelined min flag (Delayed by 1 cycle)
    );

    // Safe Truncation
    reg             wrap_en = WRAP_EN[0];
    reg [WIDTH-1:0] min_cnt = MIN_CNT[WIDTH-1:0];
    reg [WIDTH-1:0] max_cnt = MAX_CNT[WIDTH-1:0];

    // Registered flags (pipelined)
    reg r_max,r_min;
    reg flag_valid; // Prevent flags triggering off Resets

    // Counter Logic
    always @(posedge i_clk or posedge i_arst) begin
        if (i_arst) begin
            o_count    <= min_cnt;
            r_max      <= 1'b0;
            r_min      <= 1'b0;
            flag_valid <= 1'b0;
        end else if (i_en) begin  
            // Direction
            if (i_updn) begin
                if (wrap_en)
                    o_count <= (o_count == max_cnt) ? min_cnt : o_count + 1;
                else if (o_count < max_cnt)
                    o_count <= o_count + 1;
            end else begin
                if (wrap_en)
                    o_count <= (o_count == min_cnt) ? max_cnt : o_count - 1; 
                else if (o_count > min_cnt)
                    o_count <= o_count - 1;
            end

            // Pipelined Flags (Delayed by 1 cycle)
            flag_valid <= 1'b1;
            r_max      <= (flag_valid && o_count == max_cnt);
            r_min      <= (flag_valid && o_count == min_cnt);        
        end 
    end
    
    // Not Pipelined
    assign o_max = i_arst ? 1'b0 : (o_count == max_cnt);
    assign o_min = i_arst ? 1'b0 : (o_count == min_cnt);

    // Pipelined
    assign o_max_pipe = r_max;
    assign o_min_pipe = r_min;
        
endmodule
