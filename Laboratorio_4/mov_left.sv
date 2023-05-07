module mov_left(input int count, 
					 input logic [3:0] grid [0:3][0:3],
					 output logic [3:0] grid_left [0:3][0:3],
					 output int total);
	
	
	int point [3:0];
	assign total = point[0] + point[1] + point[2] + point[3];
	
	always_comb begin
		
		if(count != 4) begin
			
			for(int j = 0; j < 4; j++) begin
				point[j] = 0;
				
				// 0 vacio
				if(grid[0][j] == 4'd_0) begin
					grid_left[0][j] = grid[1][j];
					grid_left[1][j] = grid[2][j];
					grid_left[2][j] = grid[3][j];
					grid_left[3][j] = 4'd_0;
				end
				// 1 vacio
				else if(grid[1][j] == 4'd_0) begin
					grid_left[0][j] = grid[0][j];
					grid_left[1][j] = grid[2][j];
					grid_left[2][j] = grid[3][j];
					grid_left[3][j] = 4'd_0;
				end
				// 2 vacio
				else if(grid[2][j] == 4'd_0) begin
					grid_left[0][j] = grid[0][j];
					grid_left[1][j] = grid[1][j];
					grid_left[2][j] = grid[3][j];
					grid_left[3][j] = 4'd_0;
				end
				// ninguno disponible
				else begin
					grid_left[0][j] = grid[0][j];
					grid_left[1][j] = grid[1][j];
					grid_left[2][j] = grid[2][j];
					grid_left[3][j] = grid[3][j];
				end
				
			end //for
			
		end
		else begin
			
			for(int j = 0; j < 4; j++) begin
			
				// 0 y 1 iguales y diferentes de 0
				if(grid[0][j] == grid[1][j] & grid[0][j] != 4'd_0) begin
				
					// 2 y 3 iguales y diferentes de 0
					if(grid[2][j] == grid[3][j] & grid[2][j] != 4'd_0) begin
						grid_left[3][j] = 4'd_0;
						grid_left[2][j] = grid[2][j] + 4'd_1;
						grid_left[1][j] = 4'd_0;
						grid_left[0][j] = grid[0][j] + 4'd_1;
						point[j] = 2**(grid[2][j] + 4'd_1) + 2**(grid[0][j] + 4'd_1);
					end
					// 2 y 3 diferentes
					else begin
						grid_left[3][j] = grid[3][j];
						grid_left[2][j] = grid[2][j];
						grid_left[1][j] = 4'd_0;
						grid_left[0][j] = grid[0][j] + 4'd_1;
						point[j] = 2**(grid[0][j] + 4'd_1);
					end
				end
				// 1 y 0 diferentes
				else begin
				
					// 1 y 2 iguales y diferentes de 0
					if(grid[1][j] == grid[2][j] & grid[1][j] != 4'd_0) begin
						grid_left[3][j] = grid[3][j];
						grid_left[2][j] = 4'd_0;
						grid_left[1][j] = grid[1][j] + 4'd_1;
						grid_left[0][j] = grid[0][j];
						point[j] = 2**(grid[2][j] + 4'd_1);
					end
					// 1 y 2 diferentes
					else begin
						// 2 y 3 iguales y diferentes de 0
						if(grid[2][j] == grid[3][j] & grid[2][j] != 4'd_0) begin
							grid_left[3][j] = 4'd_0;
							grid_left[2][j] = grid[2][j] + 4'd_1;
							grid_left[1][j] = grid[1][j];
							grid_left[0][j] = grid[0][j];
							point[j] = 2**(grid[2][j] + 4'd_1);
						end
						// 2 y 3 diferentes
						else begin
							grid_left[3][j] = grid[3][j];
							grid_left[2][j] = grid[2][j];
							grid_left[1][j] = grid[1][j];
							grid_left[0][j] = grid[0][j];
							point[j] = 0;
						end
					end
					
				end
				
			end //for
			
		end
		
	end //always_comb
	
endmodule