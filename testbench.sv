`timescale 1ns/1ps

module tb_cpu;

    reg clk = 0;
    reg reset = 1;
    wire [7:0] pc;
    wire [7:0] out_val;
    wire halted;

    // Instantiate CPU
    cpu_acc UUT (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .acc(out_val),
        .halted(halted)
    );

    // Clock: 20 ns period
    always #10 clk = ~clk;

    initial begin
        $dumpfile("cpu_wave.vcd");
        $dumpvars(0, tb_cpu);

        // Release reset after 25 ns
        #25 reset = 0;

        // Wait until HALT
        wait(halted == 1);
        #20;

        // Check expected value
        if (out_val == 8'd7)
            $display("✅ TEST PASSED: ACC = %0d", out_val);
        else
            $display("❌ TEST FAILED: ACC = %0d (Expected 7)", out_val);

        $finish;
    end

endmodule
