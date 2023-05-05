module color(input logic [3:0] value, output [23:0] pixel_color);
	
	always_comb begin
		case (value)
			4'd_0: pixel_color = 24'b000111000001110000011100;
			4'd_1: pixel_color = 24'b111111111111111111001100;
			4'd_2: pixel_color = 24'b111111111111111111100110;
			4'd_3: pixel_color = 24'b111111111100110010011001;
			4'd_4: pixel_color = 24'b111111111100110011001100;
			4'd_5: pixel_color = 24'b111111111100110010011001;
			4'd_6: pixel_color = 24'b111111111001100110011001;
			4'd_7: pixel_color = 24'b111111111100110011001100;
			4'd_8: pixel_color = 24'b111111111001100111001100;
			4'd_9: pixel_color = 24'b110011000110011001100110;
			4'd_10: pixel_color = 24'b100110010011001100110011;
			4'd_11: pixel_color = 24'b110011001111111111001100;
			4'd_12: pixel_color = 24'b000011000000110000001100;
			default: pixel_color = 24'b000011000000110000001100;
		endcase
	end
	
endmodule