module FSM_Debug(input clk, reset, mov_right, mov_left, mov_up, mov_down,
					  output logic [3:0] grid [0:3][0:3]);

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

logic [3:0] grid_next [0:3][0:3];
logic [3:0] grid_first_gen [0:3][0:3];
logic [3:0] grid_play [0:3][0:3];
logic [3:0] grid_right [0:3][0:3];
logic [3:0] grid_left [0:3][0:3];
logic [3:0] grid_up [0:3][0:3];
logic [3:0] grid_down [0:3][0:3];

logic move_done = 1;
int count = 0;

first_gen _firs_gen(grid, grid_first_gen);

mov_right _mov_right(count, grid, grid_right);
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
		
		if(move_done == 1) count <= 0;
		else count <= count + 1;
	end
	
end


//logica estado siguiente
always_comb begin

	case (state)
	
		INIT: begin
			
			move_done = 1;
			grid_next = '{'{4'd_0, 4'd_0, 4'd_0, 4'd_0},
							  '{4'd_0, 4'd_0, 4'd_0, 4'd_0},
							  '{4'd_0, 4'd_0, 4'd_0, 4'd_0},
							  '{4'd_0, 4'd_0, 4'd_0, 4'd_0}};
			next_state = FIRST_GEN;
				
		end
				
		FIRST_GEN: begin
			
			move_done = 1;
			grid_next = grid_first_gen;
			next_state = PLAY;
			
		end
		
		
		PLAY: begin
			
			move_done = 1;
			if (~mov_right & mov_right_prev) next_state = RIGHT;
			else if (~mov_left & mov_left_prev) next_state = LEFT;
			else if (~mov_up & mov_up_prev) next_state = UP;
			else if (~mov_down & mov_down_prev) next_state = DOWN;
			else next_state = PLAY;
				
		end
		
		RIGHT: begin
			
			move_done = 0;
			grid_next = grid_right;
			if(count > 8) next_state = PLAY;
			else next_state = RIGHT;
				
		end
		
		LEFT: begin
			
			move_done = 0;
			grid_next = grid_left;
			next_state = PLAY;
				
		end
		
		UP: begin
			
			move_done = 0;
			grid_next = grid_up;
			next_state = PLAY;
				
		end
		
		DOWN: begin
			
			move_done = 0;
			grid_next = grid_down;
			next_state = PLAY;
				
		end
		
			
			
		default: begin
			move_done = 1;
			next_state = INIT;
		end
			
	endcase
		
end


endmodule