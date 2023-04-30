module main(input clk_50Mhz, 
				output VGA_HS, VGA_VS, 
				output [7:0] VGA_R, VGA_G, VGA_B, 
				output VGA_SYNC_N, VGA_CLK, VGA_BLANK_N);
	
	logic clk_25Mhz = 0;
	logic _reset = 0;
	
	logic [23:0] pixel_color = 24'd_0;
	
	// Controla la posicion del siguiente pixel
	logic [31:0] next_x = 32'd_0;
	logic [31:0] next_y = 32'd_0;
	
	// Matriz que contiene los datos de casillas del juego
	int matrix [3:0][3:0];
	assign matrix[0][0] = 1;
	assign matrix[0][1] = 2;
	assign matrix[0][2] = 3;
	assign matrix[0][3] = 4;
	assign matrix[1][0] = 5;
	assign matrix[1][1] = 6;
	assign matrix[1][2] = 7;
	assign matrix[1][3] = 8;
	assign matrix[2][0] = 9;
	assign matrix[2][1] = 10;
	assign matrix[2][2] = 11;
	assign matrix[2][3] = 12;
	assign matrix[3][0] = 13;
	assign matrix[3][1] = 14;
	assign matrix[3][2] = 15;
	assign matrix[3][3] = 0;
	
	
	// Se procesa la matriz del juego con la posicion del pixel actual para
	// determinar cual debera ser su color
	interpreter inter (matrix, next_x, next_y, pixel_color);
	
	// El interprete retorna el valor de color que debe dibujar el driver VGA
	// El driver tambien retorna la posicion del siguiente pixel que dibujara
	vga_driver_old draw (clk_25Mhz, _reset, pixel_color,
							VGA_HS, VGA_VS, 
							VGA_R, VGA_G, VGA_B, 
							VGA_SYNC_N, VGA_CLK, VGA_BLANK_N,
							next_x, next_y
							);
	
	always_ff @ (posedge clk_50Mhz)
		clk_25Mhz <= ~clk_25Mhz;
	

endmodule
