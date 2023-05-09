module block_generator(input logic clk,
					  input logic [3:0] grid [0:3][0:3],
					  output logic [3:0] grid_first_gen [0:3][0:3],
					  output logic added);
	
	logic [1:0] _x1, _y1, _x2, _y2;
	int x1, y1;
	
	
	random _random (clk, _x1, _y1, _x2, _y2);
	
	assign x1 = {30'd_0, _x1};
	assign y1 = {30'd_0, _y1};

		
	always_comb begin

		if(grid[x1][y1] == 4'd_0) begin
			
			for(int i = 0; i < 4; i++) begin
				for(int j = 0; j < 4; j++) begin
					
					if (i == x1 & j == y1) grid_first_gen[i][j] = 4'd_1;
					else grid_first_gen[i][j] = grid[i][j];
				
				end
			end
			added = 1;
			
		end
		else begin
			grid_first_gen = grid;
			added = 0;
		end
		
	end
	
endmodule