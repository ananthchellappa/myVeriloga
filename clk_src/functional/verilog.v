module clk_src (
    output reg clk
);

    // Cadence-preferred: parameters declared inside the module
    parameter integer PERIOD_NS = 100;
    parameter integer DELAY_NS  = 100;
    parameter         INIT_VAL  = 1'b0;  // Initial logic level of clk

    integer HALF_PERIOD_NS;

    initial begin
        // Initialize clock to requested starting value
        clk = INIT_VAL;

        // Compute half period
        HALF_PERIOD_NS = PERIOD_NS / 2;

        // Startup delay before clock starts toggling
        #(DELAY_NS);

        // Free-running clock
        forever begin
            #(HALF_PERIOD_NS) clk = ~clk;
        end
    end

endmodule
