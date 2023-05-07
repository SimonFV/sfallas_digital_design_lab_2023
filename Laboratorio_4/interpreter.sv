module interpreter(input logic clk,
						 input logic [3:0] matrix [0:3][0:3],
						 input logic [31:0] next_x, next_y,
						 output logic [23:0] pixel_color);
	
	logic [3:0] value = 4'd_0;
	logic [31:0] x, y, x_offset, y_offset;
	
	color col (value, x, y, pixel_color);
	
	assign x = next_x - x_offset;
	assign y = next_y - y_offset;
	
	always_comb begin
	
		// FILA 0
		if (next_x >= 10 & next_x < 90 & next_y >= 10 & next_y < 90) begin
			value = matrix[0][0];
			x_offset = 10;
			y_offset = 10;
		end
		else if (next_x >= 100 & next_x < 180 & next_y >= 10 & next_y < 90) begin
			value = matrix[1][0];
			x_offset = 100;
			y_offset = 10;
		end
		else if (next_x >= 190 & next_x < 270 & next_y >= 10 & next_y < 90) begin
			value = matrix[2][0];
			x_offset = 190;
			y_offset = 10;
		end
		else if (next_x >= 280 & next_x < 360 & next_y >= 10 & next_y < 90) begin
			value = matrix[3][0];
			x_offset = 280;
			y_offset = 10;
		end
		
		 // FILA 1
		else if (next_x >= 10 & next_x < 90 & next_y >= 100 & next_y < 180) begin
			value = matrix[0][1];
			x_offset = 10;
			y_offset = 100;
		end
		else if (next_x >= 100 & next_x < 180 & next_y >= 100 & next_y < 180) begin
			value = matrix[1][1];
			x_offset = 100;
			y_offset = 100;
		end
		else if (next_x >= 190 & next_x < 270 & next_y >= 100 & next_y < 180) begin
			value = matrix[2][1];
			x_offset = 190;
			y_offset = 100;
		end
		else if (next_x >= 280 & next_x < 360 & next_y >= 100 & next_y < 180) begin
			value = matrix[3][1];
			x_offset = 280;
			y_offset = 100;
		end
		
		// FILA 2
		else if (next_x >= 10 & next_x < 90 & next_y >= 190 & next_y < 270) begin
			value = matrix[0][2];
			x_offset = 10;
			y_offset = 190;
		end
		else if (next_x >= 100 & next_x < 180 & next_y >= 190 & next_y < 270) begin
			value = matrix[1][2];
			x_offset = 100;
			y_offset = 190;
		end
		else if (next_x >= 190 & next_x < 270 & next_y >= 190 & next_y < 270) begin
			value = matrix[2][2];
			x_offset = 190;
			y_offset = 190;
		end
		else if (next_x >= 280 & next_x < 360 & next_y >= 190 & next_y < 270) begin
			value = matrix[3][2];
			x_offset = 280;
			y_offset = 190;
		end
		
		// FILA 3
		else if (next_x >= 10 & next_x < 90 & next_y >= 280 & next_y < 360) begin
			value = matrix[0][3];
			x_offset = 10;
			y_offset = 280;
		end
		else if (next_x >= 100 & next_x < 180 & next_y >= 280 & next_y < 360) begin
			value = matrix[1][3];
			x_offset = 100;
			y_offset = 280;
		end
		else if (next_x >= 190 & next_x < 270 & next_y >= 280 & next_y < 360) begin
			value = matrix[2][3];
			x_offset = 190;
			y_offset = 280;
		end
		else if (next_x >= 280 & next_x < 360 & next_y >= 280 & next_y < 360) begin
			value = matrix[3][3];
			x_offset = 280;
			y_offset = 280;
		end
		else begin
			value = 4'd_12;
			x_offset = 0;
			y_offset = 0;
		end
		
	end
	
endmodule
