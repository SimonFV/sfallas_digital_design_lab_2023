module dmem(input logic clk, we,
				input logic [31:0] a, wd,
				output logic [31:0] rd);
				
	logic [31:0] DRAM[63:0];
	
	assign rd = DRAM[a[31:2]]; // word aligned
	
	always_ff @(posedge clk)
		if (we) DRAM[a[31:2]] <= wd;
		
endmodule