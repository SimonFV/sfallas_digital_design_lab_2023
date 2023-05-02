module first_gen(input int grid [0:3][0:3], output int grid_first_gen [0:3][0:3]);
	
	assign grid_first_gen = '{'{8, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 32, 0, 0}, '{0, 0, 0, 0}};
	
endmodule