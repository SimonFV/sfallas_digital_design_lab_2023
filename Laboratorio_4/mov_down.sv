module mov_down(input [3:0] grid [0:3][0:3], output [3:0] grid_down [0:3][0:3]);
	
	assign grid_down = '{'{4'd_0, 4'd_0, 4'd_0, 4'd_2},
								'{4'd_0, 4'd_0, 4'd_0, 4'd_2},
								'{4'd_0, 4'd_0, 4'd_0, 4'd_2},
								'{4'd_0, 4'd_0, 4'd_0, 4'd_2}};
	
endmodule