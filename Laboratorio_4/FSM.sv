module FSM(input logic clk, reset, mov_right, mov_left, mov_up, mov_down,
			  input [3:0] goal_in,
			  output logic [3:0] grid_out [0:3][0:3],
			  output logic defeat, win, 
			  output int points_out);

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
		CHECK_CAN_MOVE = 4'b1010,
		CHECK_CAN_ADD = 4'b1011,
		DEFEAT = 4'b1100
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

logic [3:0] goal, goal_next;
int points = 0;
int point, point_right, point_left, point_up, point_down;


//instancias
first_gen _firs_gen(clk, grid, grid_first_gen, ready);

mov_right _mov_right(count, grid, grid_right, point_right);
mov_left _mov_left(count, grid, grid_left, point_left);
mov_up _mov_up(count, grid, grid_up, point_up);
mov_down _mov_down(count, grid, grid_down, point_down);

block_generator _b_generator(clk, grid, grid_block_added, added);

	
//logica estado actual
always_ff @ (posedge clk) begin

	if (reset) begin
		state <= INIT;
		points <= 0;
	end
	else begin
		mov_right_prev <= mov_right;
		mov_left_prev <= mov_left;
		mov_up_prev <= mov_up;
		mov_down_prev <= mov_down;
		
		state <= next_state;
		grid <= grid_next;
		points <= points + point;
		goal <= goal_next;
		
		if(move_done == 1) begin
			count <= 0;
			grid_prev <= grid;
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
			
			grid_next = '{'{4'd_1, 4'd_2, 4'd_3, 4'd_1},
							'{4'd_2, 4'd_1, 4'd_2, 4'd_1},
							'{4'd_3, 4'd_2, 4'd_1, 4'd_3},
							'{4'd_4, 4'd_3, 4'd_2, 4'd_1}};
			point = 0;
			move_done = 1;
			goal_next = (goal_in < 4'd_2 | goal_in > 4'd_11 ) ? 4'd_11 : goal_in;
			if ((~mov_right & mov_right_prev) | (~mov_left & mov_left_prev) |
				 (~mov_up & mov_up_prev) | (~mov_down & mov_down_prev)) next_state = PLAY;
			else next_state = INIT;
				
		end
				
		FIRST_GEN: begin
			
			point = 0;
			move_done = 1;
			goal_next = goal;
			grid_next = grid_first_gen;
			if(ready == 1) next_state = PLAY;
			else next_state = FIRST_GEN;
			
		end
		
		PLAY: begin
			
			point = 0;
			move_done = 1;
			goal_next = goal;
			if (~mov_right & mov_right_prev) next_state = RIGHT;
			else if (~mov_left & mov_left_prev) next_state = LEFT;
			else if (~mov_up & mov_up_prev) next_state = UP;
			else if (~mov_down & mov_down_prev) next_state = DOWN;
			else next_state = PLAY;
				
		end
		
		RIGHT: begin
			
			point = point_right;
			move_done = 0;
			goal_next = goal;
			grid_next = grid_right;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = RIGHT;
				
		end
		
		LEFT: begin
			
			point = point_left;
			move_done = 0;
			goal_next = goal;
			grid_next = grid_left;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = LEFT;
				
		end
		
		UP: begin
			
			point = point_up;
			move_done = 0;
			goal_next = goal;
			grid_next = grid_up;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = UP;
				
		end
		
		DOWN: begin
			
			point = point_down;
			move_done = 0;
			goal_next = goal;
			grid_next = grid_down;
			if(count > 8) begin
				if(grid_prev != grid_next) next_state = CHECK_WIN;
				else next_state = PLAY;
			end
			else next_state = DOWN;
				
		end
		
		CHECK_WIN: begin
			
			point = 0;
			goal_next = goal;
			move_done = 1;
			if(grid[0][0] == goal |
				grid[0][1] == goal |
				grid[0][2] == goal |
				grid[0][3] == goal |
				grid[1][0] == goal |
				grid[1][1] == goal |
				grid[1][2] == goal |
				grid[1][3] == goal |
				grid[2][0] == goal |
				grid[2][1] == goal |
				grid[2][2] == goal |
				grid[2][3] == goal |
				grid[3][0] == goal |
				grid[3][1] == goal |
				grid[3][2] == goal |
				grid[3][3] == goal ) next_state = WIN;
			else next_state = GEN;
				
		end
		
		WIN: begin
			
			point = 0;
			goal_next = goal;
			move_done = 1;
			next_state = WIN;
				
		end
		
		GEN: begin
			
			point = 0;
			goal_next = goal;
			move_done = 1;
			grid_next = grid_block_added;
			if(added == 1) next_state = CHECK_CAN_MOVE;
			else next_state = GEN;
				
		end
		
		CHECK_CAN_MOVE: begin
			
			point = 0;
			goal_next = goal;
			move_done = 0;
			if(grid_next == grid_left &
				grid_next == grid_up &
				grid_next == grid_down &
				grid_next == grid_right) next_state = CHECK_CAN_ADD;
			else next_state = PLAY;
			
		end
		
		CHECK_CAN_ADD: begin
			
			point = 0;
			goal_next = goal;
			move_done = 0;
			if(count == 4) begin
				if(grid_next == grid_left &
					grid_next == grid_up &
					grid_next == grid_down &
					grid_next == grid_right) next_state = DEFEAT;
				else next_state = PLAY;
			end
			else next_state = CHECK_CAN_ADD;
			
		end
		
		DEFEAT: begin
			
			point = 0;
			goal_next = goal;
			move_done = 1;
			next_state = DEFEAT;
				
		end
		
		default: begin
			goal_next = goal;
			point = 0;
			move_done = 1;
			next_state = INIT;
		end
			
	endcase
		
end

assign grid_out = grid;
assign defeat = (state == DEFEAT);
assign win = (state == WIN);
assign points_out = points;

endmodule