module FSM_Debug(clk, reset, start,mov_left, grid);

input logic clk;         //Señal del reloj
input logic reset;       //Señal de reinicio(activo en alto)
input logic start;
input logic mov_left;    // 

output int grid [0:3][0:3]; //Salida de la matriz del juego

typedef enum logic [2:0]
	{
		S_INIT = 3'b000,
		S_PLAY = 3'b001,
		S_NEW_BLOCK = 3'b010,
		S_WIN = 3'b011,
		S_LOSE = 3'b100
	} state_t;

	state_t state, next_state; //Estados actual y siguiente
	
//actual state logic
always_ff @ (posedge reset /*or posedge clk*/, negedge mov_left, negedge start) begin
	if (reset) state <= S_INIT;
	else begin

//next state logic

	
		case (state)
			S_INIT: begin
				
				
				if (~start) begin
					
					grid = '{'{2, 2, 2, 2}, '{2, 2, 2, 2}, '{2, 2, 2, 2}, '{2, 2, 2, 2}};
					state <= S_PLAY;
					
				end
				else state <= S_INIT;
				
			end
				
			S_PLAY: begin
				
				grid[0][0] <= 0;
				if (~mov_left) begin 
					
					state <= S_INIT;
				end
				
				state <= S_PLAY;
				
			end
			
			
			default: state <= S_INIT;
			
		endcase
		end
end

endmodule