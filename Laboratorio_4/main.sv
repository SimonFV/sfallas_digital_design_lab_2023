module main(input clk_50Mhz, mov_left, mov_right, mov_up, mov_down,
				input reset,
				output VGA_HS, VGA_VS, 
				output [7:0] VGA_R, VGA_G, VGA_B, 
				output VGA_SYNC_N, VGA_CLK, VGA_BLANK_N);
	
	logic clk_25Mhz = 0;
	logic _reset = 0;
	
	logic clk_game = 0;
	logic [9:0] count_clk_game = 10'd_0;
	
	logic [23:0] pixel_color = 24'd_0;
	
	// Controla la posicion del siguiente pixel
	logic [31:0] next_x = 32'd_0;
	logic [31:0] next_y = 32'd_0;
	
	// Matriz que contiene los datos de casillas del juego
	logic [3:0] matrix [0:3][0:3];
	
	
	logic win_flag = 0;      //Señal de victoria (activo en alto)
	logic lose_flag = 0;     //Señal de derrota (activo en alto)
	logic [3:0] score = 0;
	
	
	FSM_Debug _FSM_Debug(clk_25Mhz, reset, mov_right, mov_left, mov_up, mov_down, matrix);
	
	// Se procesa la matriz del juego con la posicion del pixel actual para
	// determinar cual debera ser su color
	interpreter inter (matrix, next_x, next_y, pixel_color);
	
	
	// El interprete retorna el valor de color que debe dibujar el driver VGA
	// El driver tambien retorna la posicion del siguiente pixel que dibujara
	vga_driver draw (clk_25Mhz, _reset, pixel_color,
							VGA_HS, VGA_VS, 
							VGA_R, VGA_G, VGA_B, 
							VGA_SYNC_N, VGA_CLK, VGA_BLANK_N,
							next_x, next_y
							);
	
	// Reloj para la salida VGA
	always_ff @ (posedge clk_50Mhz)
		clk_25Mhz <= ~clk_25Mhz;
	
	// Reloj para la fsm del juego
	always_ff @ (posedge clk_25Mhz) begin
		count_clk_game <= count_clk_game + 10'd_1;
		
		if(count_clk_game == 10'd_0) clk_game <= ~clk_game;
		else clk_game <= clk_game;
	end
		
endmodule
