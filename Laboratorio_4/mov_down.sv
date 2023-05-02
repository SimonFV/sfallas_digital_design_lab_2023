module mov_down(input int grid [0:3][0:3], output int grid_down [0:3][0:3]);
	
	assign grid_down = '{'{0, 0, 0, 2}, '{0, 0, 0, 2}, '{0, 0, 0, 2}, '{0, 0, 0, 2}};
	
endmodule