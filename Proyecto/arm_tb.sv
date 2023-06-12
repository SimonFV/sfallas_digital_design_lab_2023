`timescale 1 ns / 1 ns

module arm_tb();

	logic clk;
	logic reset;
	logic [6:0] s0, s1, s2,s3;
	logic led_success;
	
	logic h_sync, v_sync;
	logic [7:0] red_out, green_out, blue_out;
	logic sync_n_out, clk_out, blank_out;
	
	// instantiate device to be tested
	main dut(clk, reset, 
				
				h_sync, v_sync,
				red_out, green_out, blue_out,
				sync_n_out, clk_out, blank_out,
				
				s0, s1, s2,s3,
				led_success);
	
	// initialize test
	initial begin
		reset <= 1; # 16; reset <= 0;
	end
	
	// generate clock to sequence tests
	always begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

endmodule