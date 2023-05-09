module color(input logic [3:0] value,
				 input logic [31:0] x, y,
				 input logic win, defeat,
				 output logic [23:0] pixel_color);
				 
				
	// signal declarations
	logic [10:0] rom_addr;           // 11-bit text ROM address
	logic [6:0] ascii_char;          // 7-bit ASCII character code
	logic [3:0] char_row;            // 4-bit row of ASCII character
	logic [2:0] bit_addr;            // column number of ROM data
	logic [7:0] rom_data;            // 8-bit row data from text ROM
	logic ascii_bit, ascii_bit_on;     // ROM bit and status signal

	
	letters_rom _letters_rom(rom_addr, rom_data);
	
	
	// ASCII ROM interface
	assign rom_addr = {ascii_char, char_row};   // ROM address is ascii code + row
	assign ascii_bit = rom_data[~bit_addr];     // reverse bit order
	
	assign char_row = y[3:0];               // row number of ascii character rom
	assign bit_addr = x[2:0];               // column number of ascii character rom
	
	// "on" region in center of screen
	assign ascii_bit_on = ((x >= 0 & x < 80) & (y >= 32 & y < 48)) ? ascii_bit : 1'b0;
 
	
	always_comb begin
		case (value)
			// 0
			4'd_0: begin 
				ascii_char = 7'h00;
				pixel_color = 24'h_cdc0b4;
			end
			
			// 2
			4'd_1: begin
				if(x >= 40 & x < 48) ascii_char = 7'h32;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_776e65;
				else pixel_color = 24'h_eee4da;
			end
			
			// 4
			4'd_2: begin
				if(x >= 40 & x < 48) ascii_char = 7'h34;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_776e65;
				else pixel_color = 24'h_eee1c9;
			end
			
			// 8
			4'd_3: begin
				if(x >= 40 & x < 48) ascii_char = 7'h38;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_f3b27a;
			end
			
			// 16
			4'd_4: begin
				if(x >= 40 & x < 48) ascii_char = 7'h36;
				else if(x >= 32 & x < 40) ascii_char = 7'h31;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_f69664;
			end
			
			// 32
			4'd_5: begin
				if(x >= 40 & x < 48) ascii_char = 7'h32;
				else if(x >= 32 & x < 40) ascii_char = 7'h33;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_f77c5f;
			end
			
			// 64
			4'd_6: begin
				if(x >= 40 & x < 48) ascii_char = 7'h34;
				else if(x >= 32 & x < 40) ascii_char = 7'h36;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_f7653e;
			end
			
			// 128
			4'd_7: begin
				if(x >= 48 & x < 56) ascii_char = 7'h38;
				else if(x >= 40 & x < 48) ascii_char = 7'h32;
				else if(x >= 32 & x < 40) ascii_char = 7'h31;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_f9d768;
			end
			
			// 256
			4'd_8: begin
				if(x >= 48 & x < 56) ascii_char = 7'h36;
				else if(x >= 40 & x < 48) ascii_char = 7'h35;
				else if(x >= 32 & x < 40) ascii_char = 7'h32;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_fcd453;
			end
			
			// 512
			4'd_9: begin
				if(x >= 48 & x < 56) ascii_char = 7'h32;
				else if(x >= 40 & x < 48) ascii_char = 7'h31;
				else if(x >= 32 & x < 40) ascii_char = 7'h35;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_ffd13b;
			end
			
			// 1024
			4'd_10: begin
				if(x >= 48 & x < 56) ascii_char = 7'h34;
				else if(x >= 40 & x < 48) ascii_char = 7'h32;
				else if(x >= 32 & x < 40) ascii_char = 7'h30;
				else if(x >= 24 & x < 32) ascii_char = 7'h31;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_ffe325;
			end
			
			// 2048
			4'd_11: begin
				if(x >= 48 & x < 56) ascii_char = 7'h38;
				else if(x >= 40 & x < 48) ascii_char = 7'h34;
				else if(x >= 32 & x < 40) ascii_char = 7'h30;
				else if(x >= 24 & x < 32) ascii_char = 7'h32;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h_f9f6f2;
				else pixel_color = 24'h_fff700;
			end
			
			// mensaje
			4'd_12: begin
				if(win == 1) begin
					if(x >= 0 & x < 8) ascii_char = 7'h56;				//V
					else if(x >= 8 & x < 16) ascii_char = 7'h49;		//I
					else if(x >= 16 & x < 24) ascii_char = 7'h43;	//C
					else if(x >= 24 & x < 32) ascii_char = 7'h54;	//T
					else if(x >= 32 & x < 40) ascii_char = 7'h4f;	//O
					else if(x >= 40 & x < 48) ascii_char = 7'h52;	//R
					else if(x >= 48 & x < 56) ascii_char = 7'h59;	//Y
					else if(x >= 56 & x < 64) ascii_char = 7'h21;	//!
					else ascii_char = 7'h00;
					
					if(ascii_bit_on) pixel_color = 24'h_00ff80;
					else pixel_color = 24'h_bbada0;
				end
				else if(defeat == 1) begin
					if(x >= 0 & x < 8) ascii_char = 7'h47;				//G
					else if(x >= 8 & x < 16) ascii_char = 7'h41;		//A
					else if(x >= 16 & x < 24) ascii_char = 7'h4d;	//M
					else if(x >= 24 & x < 32) ascii_char = 7'h45;	//E
					else if(x >= 32 & x < 40) ascii_char = 7'h00;	//
					else if(x >= 40 & x < 48) ascii_char = 7'h4f;	//O
					else if(x >= 48 & x < 56) ascii_char = 7'h56;	//V
					else if(x >= 56 & x < 64) ascii_char = 7'h45;	//E
					else if(x >= 64 & x < 72) ascii_char = 7'h52;	//R
					else if(x >= 72 & x < 80) ascii_char = 7'h21;	//!
					else ascii_char = 7'h00;
					
					if(ascii_bit_on) pixel_color = 24'h_ff9933;
					else pixel_color = 24'h_bbada0;
				end
				else begin
					ascii_char = 7'h00;
					pixel_color = 24'h_bbada0;
				end
				
			end
			
			// background
			4'd_13: begin
				ascii_char = 7'h00;
				pixel_color = 24'h_bbada0;
			end
			
			default: begin
				ascii_char = 7'h00;
				pixel_color = 24'h_bbada0;
			end
			
		endcase
	end
	
endmodule