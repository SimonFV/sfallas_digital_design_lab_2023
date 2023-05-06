module FSM(input logic clk, reset, mov_right, mov_left, mov_up, mov_down,
			  output logic [3:0] grid_out [0:3][0:3],
			  output logic defeat);

typedef enum logic [3:0]
	{
		INIT = 4'b0000,
		FIRST_GEN = 4'b0001,
		PLAY = 4'b0010,
		RIGHT = 4'b0011,
		LEFT = 4'b0100,
		UP = 4'b0101,
		DOWN = 4'b0110,
		CHECK_WIN = 4'b0111,
		WIN = 4'b1000,
		GEN = 4'b1001,
		CHECK_DEFEAT = 4'b1010,
		DEFEAT = 4'b1011
	} state_t;

	state_t state, next_state; //Estados actual y siguiente
	

// Para detectar cuando se presiona un boton
logic mov_right_prev, mov_left_prev, mov_up_prev, mov_down_prev;

// Para procesar los movimientos de la matriz
logic [3:0] grid [0:3][0:3];
logic [3:0] grid_next [0:3][0:3];
logic [3:0] grid_first_gen [0:3][0:3];
logic [3:0] grid_play [0:3][0:3];
logic [3:0] grid_right [0:3][0:3];
logic [3:0] grid_left [0:3][0:3];
logic [3:0] grid_up [0:3][0:3];
logic [3:0] grid_down [0:3][0:3];
logic [3:0] grid_prev [0:3][0:3];
logic [3:0] grid_block_added [0:3][0:3];

logic ready;
logic added;

logic move_done = 1;
int count = 0;

first_gen _firs_gen(clk, grid, grid_first_gen, ready);

mov_right _mov_right(count, grid, grid_right);
mov_left _mov_left(count, grid, grid_left);
mov_up _mov_up(count, grid, grid_up);
mov_down _mov_down(count, grid, grid_down);

block_generator _b_generator(clk, grid, grid_block_added, added);


	
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
		
		if(move_done == 1) begin
			grid_prev <= grid;
			count <= 0;
		end
		else begin
			grid_prev <= grid_prev;
			count <= count + 1;
		end
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
			move_done = 1;
			if ((~mov_right & mov_right_prev) | (~mov_left & mov_left_prev) |
				 (~mov_up & mov_up_prev) | (~mov_down & mov_down_prev)) next_state = PLAY;
			else next_state = INIT;
				
		end
				
		FIRST_GEN: begin
			
			move_done = 1;
			grid_next = grid_first_gen;
			if(ready == 1) next_state = PLAY;
			else next_state = FIRST_GEN;
			
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
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = RIGHT;
				
		end
		
		LEFT: begin
			
			move_done = 0;
			grid_next = grid_left;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = LEFT;
				
		end
		
		UP: begin
			
			move_done = 0;
			grid_next = grid_up;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = UP;
				
		end
		
		DOWN: begin
			
			move_done = 0;
			grid_next = grid_down;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = DOWN;
				
		end
		
		CHECK_WIN: begin
			
			move_done = 1;
			next_state = GEN;
				
		end
		
		WIN: begin
			
			move_done = 1;
			next_state = INIT;
				
		end
		
		GEN: begin
			
			move_done = 1;
			grid_next = grid_block_added;
			if(added == 1) next_state = CHECK_DEFEAT;
			else next_state = GEN;
				
		end
		
		CHECK_DEFEAT: begin
			
			move_done = 0;
			if(count > 8) begin
				if(grid_right == grid_left &
					grid_left == grid_up &
					grid_up == grid_down &
					grid_down == grid_right) next_state = DEFEAT;
				else next_state = PLAY;
			end
			else next_state = CHECK_DEFEAT;
				
		end
		
		DEFEAT: begin
			
			move_done = 1;
			next_state = DEFEAT;
				
		end
		
			
			
		default: begin
			next_state = INIT;
		end
			
	endcase
		
end

assign grid_out = grid;
assign defeat = (state == DEFEAT);

endmodule