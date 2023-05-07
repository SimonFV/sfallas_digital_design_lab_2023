module matriz_tb();
	
	timeunit 1ns;
	
	logic clk;
	logic reset;
	
	logic mov_left, mov_right, mov_up, mov_down, defeat, win;
	logic [3:0] matrix [0:3][0:3];
	int points;
	
	FSM _FSM(clk, reset, mov_right, mov_left, mov_up, mov_down, matrix, defeat, win, points);
	
	always begin
		#10 clk = 1;
		#10 clk = 0;
	end
	
	initial begin
		clk = 0;
		reset = 0;
		mov_right = 1;
		mov_left = 1;
		mov_up = 1;
		mov_down = 1;
		
		matrix = '{'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
						'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
						'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
						'{4'd_0, 4'd_0, 4'd_0, 4'd_0}};
		
		// Se empieza el juego
		#500;
		mov_right = 0;
		#100;
		mov_right = 1;
		
		
		// Movimiento a la derecha
		#500;
		mov_right = 0;
		#100;
		mov_right = 1;
		
		
		// Movimiento a la abajo
		#500;
		mov_down = 0;
		#100;
		mov_down = 1;
		
		
		// Movimiento a la izquierda
		#500;
		mov_left = 0;
		#100;
		mov_left = 1;
		
		// Movimiento a la arriba
		#500;
		mov_up = 0;
		#100;
		mov_up = 1;
		
		
	end
	
	
endmodule