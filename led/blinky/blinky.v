// =============================================================================
// Blink an LED
// -----------------------------------------------------------------------------
// - Configurable DIVIDER, input number of clock cycles between each blink
//
// Author: Empyrea (@michealcarac)
// =============================================================================


module blinky #(
    parameter DIVIDER = 25 // CLK_FREQ for real hw
)
(
    input wire i_clk,
    input wire i_arst,
    input wire i_en,
    output reg o_led
    );

    reg [$clog2(DIVIDER)-1:0] counter;
    reg [$clog2(DIVIDER)-1:0] divider = DIVIDER[$clog2(DIVIDER)-1:0];

    always @(posedge i_clk or posedge i_arst) begin
        if (i_arst) begin
            o_led   <= 1'b0;
            counter <= 0;
        end else if (i_en) begin
            if (counter == divider-1) begin
                o_led <= ~o_led;
                counter <= 0;
            end else
                counter <= counter+1;
        end
    end

endmodule

