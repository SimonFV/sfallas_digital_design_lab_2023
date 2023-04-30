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
	int matrix [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
	
	
	
	
	logic start = 0;       //Señal para el inicio del juego
	logic mov_left = 1;    // 
	logic mov_right = 1;   // Señales de dirección de movimiento
	logic mov_up = 1;      // 
	logic mov_down = 1;
	
	logic win_flag = 0;      //Señal de victoria (activo en alto)
	logic lose_flag = 0;     //Señal de derrota (activo en alto)
	logic [3:0] score = 0;
	
	fsm_2048 _fsm_2048(clk_25Mhz, ~_reset, start, mov_left, mov_right, mov_up, mov_down, matrix, win_flag, lose_flag, score);
	
	
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
