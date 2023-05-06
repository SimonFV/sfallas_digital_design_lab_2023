module color(input logic [3:0] value, output [23:0] pixel_color);
	
	always_comb begin
		case (value)
			4'd_0: pixel_color = 24'b110000001100000011000000;
			4'd_1: pixel_color = 24'b111111111001100111001100;
			4'd_2: pixel_color = 24'b110011001001100111111111;
			4'd_3: pixel_color = 24'b100110011001100111111111;
			4'd_4: pixel_color = 24'b100110011100110011111111;
			4'd_5: pixel_color = 24'b100110011111111111111111;
			4'd_6: pixel_color = 24'b100110011111111111001100;
			4'd_7: pixel_color = 24'b100110011111111110011001;
			4'd_8: pixel_color = 24'b110011001111111110011001;
			4'd_9: pixel_color = 24'b111111111111111110011001;
			4'd_10: pixel_color = 24'b111111111100110011111111;
			4'd_11: pixel_color = 24'b111111111001100110011001;
			4'd_12: pixel_color = 24'b111000001110000011100000;
			default: pixel_color = 24'b111000001110000011100000;
		endcase
	end
	
endmodule