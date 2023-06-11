module imem(input logic [31:0] a,
				input logic clk,
				output logic [31:0] rd);
				
	
	logic [31:0] INST_RAM[63:0];
	initial
		$readmemh("memfile.dat",INST_RAM);
	
	assign rd = INST_RAM[a[31:2]]; // word aligned
	
endmodule