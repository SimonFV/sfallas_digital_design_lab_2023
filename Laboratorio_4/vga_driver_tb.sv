module vga_driver_tb();
	timeunit 1ns;

	logic clk = 0;
	logic reset = 0;
	logic h_sync, v_sync;
	logic [7:0] pixel_color;
	logic [7:0] red_out, green_out, blue_out;
	logic sync_n_out, clk_out, blank_out;
	
	
	vga_driver vga (clk, reset, pixel_color, h_sync, v_sync, red_out, green_out, blue_out, sync_n_out, clk_out, blank_out);
	
	always begin
		pixel_color = 8'b11111111;
		#5 clk = 1;
		#5 clk = 0;
	end

endmodule
