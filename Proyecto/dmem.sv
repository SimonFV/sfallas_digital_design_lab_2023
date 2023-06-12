module dmem(input logic clk,
				input logic [31:0] a, b, wd_a,
				input logic we_a,
				output logic [31:0] rd_a, rd_b);
	
	/*
	logic [31:0] DRAM[63:0];
	
	assign rd = DRAM[a[31:2]]; // word aligned
	
	always_ff @(posedge clk)
		if (we) DRAM[a[31:2]] <= wd;
	*/
	
	
	
	logic [31:0] wd_b = 32'd_0;
	logic we_b = 0;
	
	RAM2 iram(a[19:2], b[19:2],
				 ~clk, 
				 wd_a, wd_b, 
				 we_a, we_b, 
				 rd_a, rd_b);
	
		
endmodule