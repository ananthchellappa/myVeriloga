module clk_src_en (
    input  en,
    output reg clk
);

    parameter integer PERIOD_NS = 100;
    parameter integer DELAY_NS  = 1;
    parameter INIT_VAL = 1'b0;

    integer HALF_PERIOD_NS;
    reg started;

    initial begin
        clk     = INIT_VAL;
        started = 1'b0;

        HALF_PERIOD_NS = PERIOD_NS / 2;
    end

    // Wait for enable to go high, then start clock after delay
    always @(posedge en) begin
        if (!started) begin
            started = 1'b1;

            // Startup delay from enable
            #(DELAY_NS);

            // Free-running clock
            forever begin
                #(HALF_PERIOD_NS) clk = ~clk;
            end
        end
    end

endmodule
