module mov_up(input int grid [0:3][0:3], output int grid_up [0:3][0:3]);
	
	assign grid_up = '{'{2, 0, 0, 0}, '{2, 0, 0, 0}, '{2, 0, 0, 0}, '{2, 0, 0, 0}};
	
endmodule