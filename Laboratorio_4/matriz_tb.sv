module matriz_tb();
	
	
	logic [3:0] matrix1 [0:3][0:3];
	logic [3:0] matrix2 [0:3][0:3];
	
	mov_right _mov_right(matrix1, matrix2);
	
	initial begin
	
		matrix1 = '{'{4'd_0, 4'd_0, 4'd_2, 4'd_0},
						'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
						'{4'd_2, 4'd_0, 4'd_0, 4'd_2},
						'{4'd_0, 4'd_2, 4'd_2, 4'd_0}};
		#40;
		matrix1 = matrix2;
		#40;
		matrix1 = matrix2;
		#40;
		
	
	end
	
	
endmodule