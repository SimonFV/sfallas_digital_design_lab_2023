module color(input logic [3:0] value,
				 input logic [31:0] x, y,
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
	assign ascii_bit_on = ((x >= 32 & x < 64) & (y >= 32 & y < 48)) ? ascii_bit : 1'b0;
 
	
	always_comb begin
		case (value)
			// 0
			4'd_0: begin 
				ascii_char = 7'h00;
				pixel_color = 24'b110000001100000011000000;
			end
			
			// 2
			4'd_1: begin
				if(x >= 48 & x < 56) ascii_char = 7'h32;
				else ascii_char = 7'h00;
				
				if(ascii_bit_on) pixel_color = 24'h000000;
				else pixel_color = 24'b111111111001100111001100;
			end
			
			// 4
			4'd_2: begin
				ascii_char = 7'h00;
				pixel_color = 24'b110011001001100111111111;
			end
			
			// 8
			4'd_3: begin
				ascii_char = 7'h00;
				pixel_color = 24'b100110011001100111111111;
			end
			
			// 16
			4'd_4: begin
				ascii_char = 7'h00;
				pixel_color = 24'b100110011100110011111111;
			end
			
			// 32
			4'd_5: begin
				ascii_char = 7'h00;
				pixel_color = 24'b100110011111111111111111;
			end
			
			// 64
			4'd_6: begin
				ascii_char = 7'h00;
				pixel_color = 24'b100110011111111111001100;
			end
			
			// 128
			4'd_7: begin
				ascii_char = 7'h00;
				pixel_color = 24'b100110011111111110011001;
			end
			
			// 256
			4'd_8: begin
				ascii_char = 7'h00;
				pixel_color = 24'b110011001111111110011001;
			end
			
			// 512
			4'd_9: begin
				ascii_char = 7'h00;
				pixel_color = 24'b111111111111111110011001;
			end
			
			// 1024
			4'd_10: begin
				ascii_char = 7'h00;
				pixel_color = 24'b111111111100110011111111;
			end
			
			// 2048
			4'd_11: begin
				ascii_char = 7'h00;
				pixel_color = 24'b111111111001100110011001;
			end
			
			// background
			4'd_12: begin
				ascii_char = 7'h00;
				pixel_color = 24'b111000001110000011100000;
			end
			
			default: begin
				ascii_char = 7'h00;
				pixel_color = 24'b111000001110000011100000;
			end
			
		endcase
	end
	
endmodule