`timescale 1ns/1ps
module lfsr4_tb;
    logic rst;
    logic clk;
    logic [3:0] data_out;

    // instantiate the DUT
    lfsr4 dut (
        .clk(clk),
        .rst(rst),
        .data_out(data_out)
    );

    initial begin
        $display("Start lfsr4 testbench ....");
        clk = 1'b0;
        rst = 1'b1;
        #1 clk = 1'b1;
        #1 clk = 1'b0;
	#1 rst = 1'b0;

	// clock generator
    	for (int i=0; i<20; i++) begin
        	#1 clk = 1'b1;
        	#1 clk = 1'b0;
	end
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, lfsr4_tb, dut);
    end
endmodule