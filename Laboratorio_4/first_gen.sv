module first_gen(input logic clk,
					  input logic [3:0] grid [0:3][0:3],
					  output logic [3:0] grid_first_gen [0:3][0:3],
					  output logic ready);
	
	logic [1:0] _x1, _y1, _x2, _y2;
	int x1, y1, x2, y2;
	
	
	random _random (clk, _x1, _y1, _x2, _y2);
	
	assign x1 = {30'd_0, _x1};
	assign y1 = {30'd_0, _y1};
	assign x2 = {30'd_0, _x2};
	assign y2 = {30'd_0, _y2};
		
	always_comb begin
		
		if(x1 != x2 | y1 != y2) begin
			
			for(int i = 0; i < 4; i++) begin
				for(int j = 0; j < 4; j++) begin
					
					if (i == x1 & j == y1) grid_first_gen[i][j] = 4'd_1;
					else if (i == x2 & j == y2) grid_first_gen[i][j] = 4'd_1;
					else grid_first_gen[i][j] = grid[i][j];
				
				end
			end
			ready = 1;
			
		end
		else begin
			grid_first_gen = grid;
			ready = 0;
		end
		
	end
	
endmodule