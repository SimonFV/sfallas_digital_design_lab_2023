module vga_driver_tb();
	timeunit 1ns;

	logic clk = 0;
	logic reset = 0;
	logic h_sync, v_sync;
	logic [23:0] pixel_color = 24'b111111111001100111001100;
	logic [7:0] red_out, green_out, blue_out;
	logic sync_n_out, clk_out, blank_out;
	logic [31:0] next_x, next_y;
	
	
	vga_driver vga (clk, reset, pixel_color, h_sync, v_sync, red_out, green_out, blue_out, sync_n_out, clk_out, blank_out, next_x, next_y);
	
	always begin
		pixel_color = 24'b110011000110011001100110;
		#5 clk = 1;
		#5 clk = 0;
	end

endmodule
