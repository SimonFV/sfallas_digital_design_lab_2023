module mov_left(input int grid [0:3][0:3], output int grid_left [0:3][0:3]);
	
	assign grid_left = '{'{2, 2, 2, 2}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
	
endmodule