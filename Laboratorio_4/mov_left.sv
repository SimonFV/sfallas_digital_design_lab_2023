module mov_left(input [3:0] grid [0:3][0:3], output [3:0] grid_left [0:3][0:3]);
	
	assign grid_left = '{'{4'd_2, 4'd_2, 4'd_2, 4'd_2},
								'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
								'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
								'{4'd_0, 4'd_0, 4'd_0, 4'd_0}};
	
endmodule