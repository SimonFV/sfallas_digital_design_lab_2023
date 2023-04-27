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
	logic [3:0][3:0][3:0] matrix;
	assign matrix[0][0] = 4'b0000;
	assign matrix[0][1] = 4'b0001;
	assign matrix[0][2] = 4'b0010;
	assign matrix[0][3] = 4'b0011;
	assign matrix[1][0] = 4'b0100;
	assign matrix[1][1] = 4'b0101;
	assign matrix[1][2] = 4'b0110;
	assign matrix[1][3] = 4'b0111;
	assign matrix[2][0] = 4'b1000;
	assign matrix[2][1] = 4'b1001;
	assign matrix[2][2] = 4'b1010;
	assign matrix[2][3] = 4'b1011;
	assign matrix[3][0] = 4'b1100;
	assign matrix[3][1] = 4'b1101;
	assign matrix[3][2] = 4'b1110;
	assign matrix[3][3] = 4'b1111;
	
	
	// Se procesa la matriz del juego con la posicion del pixel actual para
	// determinar cual debera ser su color
	interpreter inter (matrix, next_x, next_y, pixel_color);
	
	// El interprete retorna el valor de color que debe dibujar el driver VGA
	// El driver tambien retorna la posicion del siguiente pixel que dibujara
	vga_driver draw  (clk_25Mhz, _reset, pixel_color,
							VGA_HS, VGA_VS, 
							VGA_R, VGA_G, VGA_B, 
							VGA_SYNC_N, VGA_CLK, VGA_BLANK_N,
							next_x, next_y
							);
	
	always_ff @ (posedge clk_50Mhz)
		clk_25Mhz <= ~clk_25Mhz;
	

endmodule
