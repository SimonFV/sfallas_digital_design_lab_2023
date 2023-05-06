module matriz_tb();
	
	timeunit 1ns;
	
	logic clk;
	logic reset;
	
	logic mov_left, mov_right, mov_up, mov_down;
	logic [3:0] matrix [0:3][0:3];
	
	FSM _FSM(clk, reset, mov_right, mov_left, mov_up, mov_down, matrix);
	
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
		
		// Se empieza el juego
		#400;
		mov_right = 0;
		#100;
		mov_right = 1;
		
		
		// Movimiento a la derecha
		#400;
		mov_right = 0;
		#100;
		mov_right = 1;
		
	end
	
	
endmodule