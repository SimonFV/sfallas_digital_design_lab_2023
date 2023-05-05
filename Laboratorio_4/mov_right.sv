module mov_right( input logic count,
						input logic [3:0] grid [0:3][0:3], 
						output logic [3:0] grid_right [0:3][0:3]);


	always_comb begin
		
		if(count != 4) begin
			
			
			for(int j = 0; j < 4; j++) begin
				
				//3
				if(grid[3][j] == 4'd_0) grid_right[3][j] = grid[2][j];
				else grid_right[3][j] = grid[3][j];
				
				//2
				if(grid[2][j] == 4'd_0) grid_right[2][j] = grid[1][j];
				else begin
					if(grid[3][j] == 4'd_0) grid_right[2][j] = grid[1][j];
					else grid_right[2][j] = grid[2][j];
				end
				
				//1
				if(grid[1][j] == 4'd_0) grid_right[1][j] = grid[0][j];
				else begin
					if(grid[2][j] == 4'd_0) grid_right[1][j] = grid[0][j];
					else grid_right[1][j] = grid[1][j];
				end
				
				//0
				if(grid[1][j] == 4'd_0) grid_right[0][j] = 4'd_0;
				else grid_right[0][j] = grid[0][j];
				
			end //for
			
		end
		else begin
			
			for(int j = 0; j < 4; j++) begin
				
				//3
				if(grid[3][j] == 4'd_0) grid_right[3][j] = grid[2][j];
				else grid_right[3][j] = grid[3][j];
				
				//2
				if(grid[2][j] == 4'd_0) grid_right[2][j] = grid[1][j];
				else begin
					if(grid[3][j] == 4'd_0) grid_right[2][j] = grid[1][j];
					else grid_right[2][j] = grid[2][j];
				end
				
				//1
				if(grid[1][j] == 4'd_0) grid_right[1][j] = grid[0][j];
				else begin
					if(grid[2][j] == 4'd_0) grid_right[1][j] = grid[0][j];
					else grid_right[1][j] = grid[1][j];
				end
				
				//0
				if(grid[1][j] == 4'd_0) grid_right[0][j] = 4'd_0;
				else grid_right[0][j] = grid[0][j];
				
			end //for
			
		end
		
	end //always_comb
	
endmodule

