module main();
	
	logic clk, reset;
	logic [31:0] PC;
	logic [31:0] Instr;
	logic MemWrite;
	logic [31:0] ALUResult, WriteData;
	logic [31:0] ReadData;
	
	arm processor (clk, reset,
					  PC,
					  Instr,
					  MemWrite,
					  ALUResult, WriteData,
					  ReadData);

endmodule