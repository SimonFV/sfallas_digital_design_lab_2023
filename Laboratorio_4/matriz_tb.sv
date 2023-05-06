module matriz_tb();
	
	
	logic [3:0] matrix1 [0:3][0:3];
	logic [3:0] matrix2 [0:3][0:3];
	
	int count = 0;
	mov_right _mov_right(count, matrix1, matrix2);
	
	initial begin
		
		count = 0;
		matrix1 = '{'{4'd_4, 4'd_4, 4'd_1, 4'd_0},
						'{4'd_0, 4'd_1, 4'd_0, 4'd_1},
						'{4'd_0, 4'd_3, 4'd_0, 4'd_0},
						'{4'd_2, 4'd_3, 4'd_3, 4'd_1}};
		#40;
		
		count = 1;
		matrix1 = matrix2;
		#40;
		
		count = 2;
		matrix1 = matrix2;
		#40;
		
		count = 3;
		matrix1 = matrix2;
		#40;
		
		count = 4;
		matrix1 = matrix2;
		#40;
		
		count = 5;
		matrix1 = matrix2;
		#40;
		
		count = 6;
		matrix1 = matrix2;
		#40;
		
		count = 7;
		matrix1 = matrix2;
		#40;
		
		count = 8;
		matrix1 = matrix2;
		#40;
		
	
	end
	
	
endmodule