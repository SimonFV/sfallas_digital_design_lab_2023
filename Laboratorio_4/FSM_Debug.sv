module FSM_Debug(input clk, reset, mov_right, mov_left, mov_up, mov_down,
					  output int grid [3:0][3:0]);

typedef enum logic [3:0]
	{
		INIT = 4'b0000,
		FIRST_GEN = 4'b0001,
		PLAY = 4'b0010,
		RIGHT = 4'b0011,
		LEFT = 4'b0100,
		UP = 4'b0101,
		DOWN = 4'b0110,
		CHECK = 4'b0111,
		WIN = 4'b1000,
		GEN = 4'b1001,
		LOSE = 4'b1010
	} state_t;

	state_t state, next_state; //Estados actual y siguiente
	
	
logic mov_right_prev, mov_left_prev, mov_up_prev, mov_down_prev;
int grid_next [3:0][3:0]  = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
int grid_first_gen [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
int grid_play [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
int grid_right [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
int grid_left [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
int grid_up [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
int grid_down [3:0][3:0] = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};

first_gen _firs_gen(grid, grid_first_gen);

mov_right _mov_right(grid, grid_right);
mov_left _mov_left(grid, grid_left);
mov_up _mov_up(grid, grid_up);
mov_down _mov_down(grid, grid_down);



	
//logica estado actual
always_ff @ (posedge clk) begin

	if (reset) begin
		state <= INIT;
	end
	else begin
		mov_right_prev <= mov_right;
		mov_left_prev <= mov_left;
		mov_up_prev <= mov_up;
		mov_down_prev <= mov_down;
		
		state <= next_state;
		grid <= grid_next;
	end
	
end


//logica estado siguiente
always_comb begin

	case (state)
	
		INIT: begin
			
			grid_next = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
			next_state = FIRST_GEN;
				
		end
				
		FIRST_GEN: begin
			
			grid_next = grid_first_gen;
			next_state = PLAY;
				
		end
		
		
		PLAY: begin
			
			if (~mov_right & mov_right_prev) next_state = RIGHT;
			else if (~mov_left & mov_left_prev) next_state = LEFT;
			else if (~mov_up & mov_up_prev) next_state = UP;
			else if (~mov_down & mov_down_prev) next_state = DOWN;
			else next_state = PLAY;
				
		end
		
		RIGHT: begin
			
			grid_next = grid_right;
			next_state = PLAY;
				
		end
		
		LEFT: begin
			
			grid_next = grid_left;
			next_state = PLAY;
				
		end
		
		UP: begin
			
			grid_next = grid_up;
			next_state = PLAY;
				
		end
		
		DOWN: begin
			
			grid_next = grid_down;
			next_state = PLAY;
				
		end
		
			
			
		default: next_state = INIT;
			
	endcase
		
end


endmodule