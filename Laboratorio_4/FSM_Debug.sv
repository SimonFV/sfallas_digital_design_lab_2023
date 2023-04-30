module FSM_Debug(input clk, reset, mov_right, mov_left, mov_up, mov_down,
					  output int grid [0:3][0:3]);

typedef enum logic [2:0]
	{
		S_INIT = 3'b000,
		S_PLAY = 3'b001,
		S_NEW_BLOCK = 3'b010,
		S_WIN = 3'b011,
		S_LOSE = 3'b100
	} state_t;

	state_t state, next_state; //Estados actual y siguiente
	
	
logic mov_right_prev, mov_left_prev, mov_up_prev, mov_down_prev;
	
//actual state logic
always_ff @ (posedge clk) begin

	if (reset) begin
		state <= S_INIT;
	end
	else begin
		mov_right_prev <= mov_right;
		mov_left_prev <= mov_left;
		mov_up_prev <= mov_up;
		mov_down_prev <= mov_down;
		
		state <= next_state;
	end
	
end


//next state logic
always_comb begin
	case (state)
		S_INIT: begin
				
			grid = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{1, 1, 1, 1}, '{1, 1, 1, 1}};
			
			if (~mov_right & mov_right_prev) next_state = S_PLAY;
			else next_state = S_INIT;
				
		end
				
		S_PLAY: begin
			
			grid = '{'{4, 4, 4, 4}, '{0, 0, 0, 0}, '{4, 4, 4, 4}, '{1, 1, 1, 1}};
			
			if (~mov_left & mov_left_prev) next_state = S_INIT;
			else next_state = S_PLAY;
				
		end
			
			
		default: next_state = S_INIT;
			
	endcase
	
end

endmodule