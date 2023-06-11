`timescale 1 ns / 1 ns

module arm_tb();

	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	logic [6:0] s0, s1, s2,s3;
	logic led_success;
	
	// instantiate device to be tested
	top_arm dut(clk, reset, s0, s1, s2,s3, led_success);
	
	// initialize test
	initial begin
		reset <= 1; # 16; reset <= 0;
	end
	
	// generate clock to sequence tests
	always begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

	// check that 7 gets written to address 0x64
	// at end of program
	always @(negedge clk)
	begin
		if(MemWrite) begin
			if(DataAdr === 100 & WriteData === 7) begin
				$display("Simulation succeeded");
			end else if (DataAdr !== 96) begin
				$display("Simulation failed");
			end
		end
	end
endmodule