module first_gen(input int grid [0:3][0:3], output int grid_first_gen [0:3][0:3]);
	
	assign grid_first_gen = '{'{4'd_4, 4'd_4, 4'd_1, 4'd_0},
									'{4'd_0, 4'd_1, 4'd_0, 4'd_1},
									'{4'd_0, 4'd_3, 4'd_0, 4'd_0},
									'{4'd_2, 4'd_3, 4'd_3, 4'd_1}};
	
endmodule