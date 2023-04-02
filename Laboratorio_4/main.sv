module main(input clk_50Mhz);
	
	logic clk_25Mhz = 0;
	logic _reset = 0;
	logic [7:0] pixel_color = 8'b11111111;
	
	vga_driver draw  (clk_25Mhz, _reset, pixel_color,
							VGA_HS, VGA_VS, 
							VGA_R, VGA_G, VGA_B, 
							VGA_SYNC_N, VGA_CLK, VGA_BLANK_N
							);
	
	always_ff @ (posedge clk_50Mhz)
		clk_25Mhz <= ~clk_25Mhz ;
	

endmodule
