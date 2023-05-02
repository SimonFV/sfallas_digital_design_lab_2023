module interpreter(input int matrix [0:3][0:3],
						 input [31:0] next_x, next_y,
						 output [23:0] pixel_color);
	
	int value = 0;
	color col (value, pixel_color);
	
	always_comb begin
	
		// FILA 0
	
		if 	  (next_x > 10 & next_x < 90 & next_y > 10 & next_y < 90) value = matrix[0][0];
		else if (next_x > 100 & next_x < 180 & next_y > 10 & next_y < 90) value = matrix[1][0];
		else if (next_x > 190 & next_x < 270 & next_y > 10 & next_y < 90) value = matrix[2][0];
		else if (next_x > 280 & next_x < 360 & next_y > 10 & next_y < 90) value = matrix[3][0];
		else if (next_x > 10 & next_x < 90 & next_y > 100 & next_y < 180) value = matrix[0][1]; // FILA 1
		else if (next_x > 100 & next_x < 180 & next_y > 100 & next_y < 180) value = matrix[1][1];
		else if (next_x > 190 & next_x < 270 & next_y > 100 & next_y < 180) value = matrix[2][1];
		else if (next_x > 280 & next_x < 360 & next_y > 100 & next_y < 180) value = matrix[3][1];
		else if (next_x > 10 & next_x < 90 & next_y > 190 & next_y < 270) value = matrix[0][2]; // FILA 2
		else if (next_x > 100 & next_x < 180 & next_y > 190 & next_y < 270) value = matrix[1][2];
		else if (next_x > 190 & next_x < 270 & next_y > 190 & next_y < 270) value = matrix[2][2];
		else if (next_x > 280 & next_x < 360 & next_y > 190 & next_y < 270) value = matrix[3][2];
		else if (next_x > 10 & next_x < 90 & next_y > 280 & next_y < 360) value = matrix[0][3]; // FILA 3
		else if (next_x > 100 & next_x < 180 & next_y > 280 & next_y < 360) value = matrix[1][3];
		else if (next_x > 190 & next_x < 270 & next_y > 280 & next_y < 360) value = matrix[2][3];
		else if (next_x > 280 & next_x < 360 & next_y > 280 & next_y < 360) value = matrix[3][3];
		else 	  value = 12;
	
	end
	
endmodule
