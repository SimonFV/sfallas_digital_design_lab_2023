module mov_right( input int count,
						input logic [3:0] grid [0:3][0:3], 
						output logic [3:0] grid_right [0:3][0:3]);


	always_comb begin
		
		if(count != 4) begin
			
			
			for(int j = 0; j < 4; j++) begin
				
				// 3 vacio
				if(grid[3][j] == 4'd_0) begin
					grid_right[3][j] = grid[2][j];
					grid_right[2][j] = grid[1][j];
					grid_right[1][j] = grid[0][j];
					grid_right[0][j] = 4'd_0;
				end
				// 2 vacio
				else if(grid[2][j] == 4'd_0) begin
					grid_right[3][j] = grid[3][j];
					grid_right[2][j] = grid[1][j];
					grid_right[1][j] = grid[0][j];
					grid_right[0][j] = 4'd_0;
				end
				// 1 vacio
				else if(grid[2][j] == 4'd_0) begin
					grid_right[3][j] = grid[3][j];
					grid_right[2][j] = grid[2][j];
					grid_right[1][j] = grid[0][j];
					grid_right[0][j] = 4'd_0;
				end
				// ninguno disponible
				else begin
					grid_right[3][j] = grid[3][j];
					grid_right[2][j] = grid[2][j];
					grid_right[1][j] = grid[1][j];
					grid_right[0][j] = grid[0][j];
				end
				
			end //for
			
		end
		else begin
			
			for(int j = 0; j < 4; j++) begin
			
				// 2 y 3 iguales y diferentes de 0
				if(grid[2][j] == grid[3][j] & grid[2][j] != 4'd_0) begin
				
					// 0 y 1 iguales y diferentes de 0
					if(grid[0][j] == grid[1][j] & grid[0][j] != 4'd_0) begin
						grid_right[0][j] = 4'd_0;
						grid_right[1][j] = grid[1][j] + 4'd_1;
						grid_right[2][j] = 4'd_0;
						grid_right[3][j] = grid[3][j] + 4'd_1;
					end
					// 0 y 1 diferentes
					else begin
						grid_right[0][j] = grid[0][j];
						grid_right[1][j] = grid[1][j];
						grid_right[2][j] = 4'd_0;
						grid_right[3][j] = grid[3][j] + 4'd_1;
					end
				end
				// 2 y 3 diferentes
				else begin
				
					// 1 y 2 iguales y diferentes de 0
					if(grid[1][j] == grid[2][j] & grid[1][j] != 4'd_0) begin
						grid_right[0][j] = grid[0][j];
						grid_right[1][j] = 4'd_0;
						grid_right[2][j] = grid[2][j] + 4'd_1;
						grid_right[3][j] = grid[3][j];
					end
					// 1 y 2 diferentes
					else begin
						// 0 y 1 iguales y diferentes de 0
						if(grid[0][j] == grid[1][j] & grid[0][j] != 4'd_0) begin
							grid_right[0][j] = 4'd_0;
							grid_right[1][j] = grid[1][j] + 4'd_1;
							grid_right[2][j] = grid[2][j];
							grid_right[3][j] = grid[3][j];
						end
						// 0 y 1 diferentes
						else begin
							grid_right[0][j] = grid[0][j];
							grid_right[1][j] = grid[1][j];
							grid_right[2][j] = grid[2][j];
							grid_right[3][j] = grid[3][j];
						end
					end
					
				end
				
			end //for
			
		end
		
	end //always_comb
	
endmodule

