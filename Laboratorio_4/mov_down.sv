module mov_down( input int count,
						input logic [3:0] grid [0:3][0:3], 
						output logic [3:0] grid_down [0:3][0:3]);


	always_comb begin
		
		if(count != 4) begin
			
			
			for(int i = 0; i < 4; i++) begin
				
				// 3 vacio
				if(grid[i][3] == 4'd_0) begin
					grid_down[i][3] = grid[i][2];
					grid_down[i][2] = grid[i][1];
					grid_down[i][1] = grid[i][0];
					grid_down[i][0] = 4'd_0;
				end
				// 2 vacio
				else if(grid[i][2] == 4'd_0) begin
					grid_down[i][3] = grid[i][3];
					grid_down[i][2] = grid[i][1];
					grid_down[i][1] = grid[i][0];
					grid_down[i][0] = 4'd_0;
				end
				// 1 vacio
				else if(grid[i][1] == 4'd_0) begin
					grid_down[i][3] = grid[i][3];
					grid_down[i][2] = grid[i][2];
					grid_down[i][1] = grid[i][0];
					grid_down[i][0] = 4'd_0;
				end
				// ninguno disponible
				else begin
					grid_down[i][3] = grid[i][3];
					grid_down[i][2] = grid[i][2];
					grid_down[i][1] = grid[i][1];
					grid_down[i][0] = grid[i][0];
				end
				
			end //for
			
		end
		else begin
			
			for(int i = 0; i < 4; i++) begin
			
				// 2 y 3 iguales y diferentes de 0
				if(grid[i][2] == grid[i][3] & grid[i][2] != 4'd_0) begin
				
					// 0 y 1 iguales y diferentes de 0
					if(grid[i][0] == grid[i][1] & grid[i][0] != 4'd_0) begin
						grid_down[i][0] = 4'd_0;
						grid_down[i][1] = grid[i][1] + 4'd_1;
						grid_down[i][2] = 4'd_0;
						grid_down[i][3] = grid[i][3] + 4'd_1;
					end
					// 0 y 1 diferentes
					else begin
						grid_down[i][0] = grid[i][0];
						grid_down[i][1] = grid[i][1];
						grid_down[i][2] = 4'd_0;
						grid_down[i][3] = grid[i][3] + 4'd_1;
					end
				end
				// 2 y 3 diferentes
				else begin
				
					// 1 y 2 iguales y diferentes de 0
					if(grid[i][1] == grid[i][2] & grid[i][1] != 4'd_0) begin
						grid_down[i][0] = grid[i][0];
						grid_down[i][1] = 4'd_0;
						grid_down[i][2] = grid[i][2] + 4'd_1;
						grid_down[i][3] = grid[i][3];
					end
					// 1 y 2 diferentes
					else begin
						// 0 y 1 iguales y diferentes de 0
						if(grid[i][0] == grid[i][1] & grid[i][0] != 4'd_0) begin
							grid_down[i][0] = 4'd_0;
							grid_down[i][1] = grid[i][1] + 4'd_1;
							grid_down[i][2] = grid[i][2];
							grid_down[i][3] = grid[i][3];
						end
						// 0 y 1 diferentes
						else begin
							grid_down[i][0] = grid[i][0];
							grid_down[i][1] = grid[i][1];
							grid_down[i][2] = grid[i][2];
							grid_down[i][3] = grid[i][3];
						end
					end
					
				end
				
			end //for
			
		end
		
	end //always_comb
	
endmodule