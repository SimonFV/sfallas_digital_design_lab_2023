module vga_driver(input clk_in, reset,			//clk: 25MHz
						input [7:0] pixel_color, 	//RRRGGGBB (8 bits)
						output h_sync, v_sync,
						output [7:0] red_out, green_out, blue_out,//Color del VGA DAC
						output sync_n_out, clk_out, blank_out		//Señales del VGA DAC
						);
						
	
	//Parametros de la señal horizontal (en pixeles)
	parameter ACTIVE_H_SIZE = 635,
				 FRONT_H_SIZE = 15,
				 PULSE_H_SIZE = 95,
				 BACK_H_SIZE = 47,
						 
	//Parametros de la señal vertical (lineas)
				 ACTIVE_V_SIZE = 479,
				 FRONT_V_SIZE = 9,
				 PULSE_V_SIZE = 1,
				 BACK_V_SIZE = 32;
	
	//Estados
	typedef enum int {ACTIVE, FRONT, PULSE, BACK} state;
	state state_h;
	state state_v;
	

	//Registros
	int counter_h, counter_v, line_completed;
	logic h_sync_reg, v_sync_reg;
	logic [7:0] red_reg, green_reg, blue_reg;
	
	
	
	
	always_ff @ (posedge clk_in) begin
	
		if (reset) begin
         counter_h <= 0;
         counter_v <= 0;
         state_h <= ACTIVE;
         state_v <= ACTIVE;
         // Deassert line done
         line_completed <= 0;
		end
		
		else begin
		
			// HORIZONTAL
		
			if (state_h == ACTIVE) begin
            counter_h <= (counter_h == ACTIVE_H_SIZE) ? 0 : (counter_h + 1);
            h_sync_reg <= 1;
            line_completed <= 0;
            state_h <= (counter_h == ACTIVE_H_SIZE) ? FRONT : ACTIVE;
         end
			
			if (state_h == FRONT) begin
				counter_h <= (counter_h == FRONT_H_SIZE) ? 0 : (counter_h + 1) ;
				h_sync_reg <= 1;
				state_h <= (counter_h == FRONT_H_SIZE) ? PULSE : FRONT;
         end
			
			if (state_h == PULSE) begin
				counter_h <= (counter_h == PULSE_H_SIZE) ? 0 : (counter_h + 1) ;
				h_sync_reg <= 0;
				state_h <= (counter_h == PULSE_H_SIZE) ? BACK : PULSE;
			end
			
			if (state_h == BACK) begin
				counter_h <= (counter_h == BACK_H_SIZE) ? 0 : (counter_h + 1);
				h_sync_reg <= 1;
				state_h <= (counter_h == BACK_H_SIZE) ? ACTIVE : BACK;
				line_completed <= (counter_h == (BACK_H_SIZE - 1)) ? 1 : 0;
         end
			
			
			// VERTICAL
			
			if (state_v == ACTIVE) begin
				counter_v <= (line_completed == 1) ? ((counter_v == ACTIVE_V_SIZE) ? 0 : (counter_v + 1)) : counter_v;
				v_sync_reg <= 1;
				state_v <= (line_completed == 1) ? ((counter_v == ACTIVE_V_SIZE) ? FRONT : ACTIVE) : ACTIVE;
         end
			
         if (state_v == FRONT) begin
				counter_v <= (line_completed == 1) ? ((counter_v == FRONT_V_SIZE) ? 0 : (counter_v + 1)) : counter_v;
				v_sync_reg <= 1;
				state_v <= (line_completed == 1) ? ((counter_v == FRONT_V_SIZE) ? PULSE : FRONT) : FRONT;
         end
			
         if (state_v == PULSE) begin
				counter_v <= (line_completed == 1) ? ((counter_v == PULSE_V_SIZE) ? 0 : (counter_v + 1)) : counter_v;
				v_sync_reg <= 0;
				state_v <= (line_completed == 1) ? ((counter_v == PULSE_V_SIZE) ? BACK : PULSE) : PULSE;
         end
			
         if (state_v == BACK) begin
            counter_v <= (line_completed == 1) ? ((counter_v == BACK_V_SIZE) ? 0 : (counter_v + 1)) : counter_v;
            v_sync_reg <= 1;
            state_v <= (line_completed == 1) ? ((counter_v == BACK_V_SIZE) ? ACTIVE : BACK) : BACK;
         end
			
			red_reg <= (state_h == ACTIVE) ? ((state_v == ACTIVE) ? {pixel_color[7:5], 5'b00000} : 8'd_0) : 8'd_0;
         green_reg <= (state_h == ACTIVE) ? ((state_v == ACTIVE) ? {pixel_color[4:2], 5'b00000} : 8'd_0) : 8'd_0;
         blue_reg <= (state_h == ACTIVE) ? ((state_v == ACTIVE) ? {pixel_color[1:0], 6'b000000} : 8'd_0) : 8'd_0;
			
		end
	
	end
	
	
	assign h_sync = h_sync_reg;
   assign v_sync = v_sync_reg;
   assign red_out = red_reg;
   assign green_out = green_reg;
   assign blue_out = blue_reg;
   assign clk_out = clk_in;
   assign sync_n_out = 0;
   assign blank_out = h_sync_reg & v_sync_reg;

endmodule