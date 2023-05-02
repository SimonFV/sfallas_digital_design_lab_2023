module mov_right(input int grid [0:3][0:3], output int grid_right [0:3][0:3]);
	
	assign grid_right = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{2, 2, 2, 2}};
	
endmodule