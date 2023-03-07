module decodificador(input logic [3:0] a, output logic [7:0] y, output logic [13:0] s);
	
	logic [5:0] display_in;
	
	display_7 my_display(display_in, s);
	
	always_comb
	case(a)
		4'b0000: begin y = 8'b00000000; display_in = 6'b000000; end
		4'b0001: begin y = 8'b00000001; display_in = 6'b000001; end
		4'b0010: begin y = 8'b00000010; display_in = 6'b000010; end
		4'b0011: begin y = 8'b00000011; display_in = 6'b000011; end
		4'b0100: begin y = 8'b00000100; display_in = 6'b000100; end
		4'b0101: begin y = 8'b00000101; display_in = 6'b000101; end
		4'b0110: begin y = 8'b00000110; display_in = 6'b000110; end
		4'b0111: begin y = 8'b00000111; display_in = 6'b000111; end
		4'b1000: begin y = 8'b00001000; display_in = 6'b001000; end
		4'b1001: begin y = 8'b00001001; display_in = 6'b001001; end
		4'b1010: begin y = 8'b00010000; display_in = 6'b001010; end
		4'b1011: begin y = 8'b00010001; display_in = 6'b001011; end
		4'b1100: begin y = 8'b00010010; display_in = 6'b001100; end
		4'b1101: begin y = 8'b00010011; display_in = 6'b001101; end
		4'b1110: begin y = 8'b00010100; display_in = 6'b001110; end
		4'b1111: begin y = 8'b00010101; display_in = 6'b001111; end
		default: begin y = 8'bxxxxxxxx; display_in = 6'b000000; end
	endcase
	
	

endmodule


module display_7(input logic [5:0] display_in, output logic [13:0] display_out);

	always_comb
	case(display_in)
		6'b000000: display_out = 14'b10000001000000; //00
		6'b000001: display_out = 14'b10000001111001; //01
		6'b000010: display_out = 14'b10000000100100; //02
		6'b000011: display_out = 14'b10000000110000; //03
		6'b000100: display_out = 14'b10000000011001; //04
		6'b000101: display_out = 14'b10000000010010; //05
		6'b000110: display_out = 14'b10000000000010; //06
		6'b000111: display_out = 14'b10000001111000; //07
		6'b001000: display_out = 14'b10000000000000; //08
		6'b001001: display_out = 14'b10000000011000; //09
		6'b001010: display_out = 14'b11110011000000; //10
		6'b001011: display_out = 14'b11110011111001; //11
		6'b001100: display_out = 14'b11110010100100; //12
		6'b001101: display_out = 14'b11110010110000; //13
		6'b001110: display_out = 14'b11110010011001; //14
		6'b001111: display_out = 14'b11110010010010; //15
		
		6'b010000: display_out = 14'b11110010000010; //16
		6'b010001: display_out = 14'b11110011111000; //17
		6'b010010: display_out = 14'b11110010000000; //18
		6'b010011: display_out = 14'b11110010011000; //19
		6'b010100: display_out = 14'b01001001000000; //20
		6'b010101: display_out = 14'b01001001111001; //21
		6'b010110: display_out = 14'b01001000100100; //22
		6'b010111: display_out = 14'b01001000110000; //23
		6'b011000: display_out = 14'b01001000011001; //24
		6'b011001: display_out = 14'b01001000010010; //25
		6'b011010: display_out = 14'b01001000000010; //26
		6'b011011: display_out = 14'b01001001111000; //27
		6'b011100: display_out = 14'b01001000000000; //28
		6'b011101: display_out = 14'b01001000011000; //29
		6'b011110: display_out = 14'b01100001000000; //30
		6'b011111: display_out = 14'b01100001111001; //31
		
		6'b100000: display_out = 14'b01100000100100; //32
		6'b100001: display_out = 14'b01100000110000; //33
		6'b100010: display_out = 14'b01100000011001; //34
		6'b100011: display_out = 14'b01100000010010; //35
		6'b100100: display_out = 14'b01100000000010; //36
		6'b100101: display_out = 14'b01100001111000; //37
		6'b100110: display_out = 14'b01100000000000; //38
		6'b100111: display_out = 14'b01100000011000; //39
		6'b101000: display_out = 14'b00110011000000; //40
		6'b101001: display_out = 14'b00110011111001; //41
		6'b101010: display_out = 14'b00110010100100; //42
		6'b101011: display_out = 14'b00110010110000; //43
		6'b101100: display_out = 14'b00110010011001; //44
		6'b101101: display_out = 14'b00110010010010; //45
		6'b101110: display_out = 14'b00110010000010; //46
		6'b101111: display_out = 14'b00110011111000; //47
		
		6'b110000: display_out = 14'b00110010000000; //48
		6'b110001: display_out = 14'b00110010011000; //49
		6'b110010: display_out = 14'b00100101000000; //50
		6'b110011: display_out = 14'b00100101111001; //51
		6'b110100: display_out = 14'b00100100100100; //52
		6'b110101: display_out = 14'b00100100110000; //53
		6'b110110: display_out = 14'b00100100011001; //54
		6'b110111: display_out = 14'b00100100010010; //55
		6'b111000: display_out = 14'b00100100000010; //56
		6'b111001: display_out = 14'b00100101111000; //57
		6'b111010: display_out = 14'b00100100000000; //58
		6'b111011: display_out = 14'b00100100011000; //59
		6'b111100: display_out = 14'b00000101000000; //60
		6'b111101: display_out = 14'b00000101111001; //61
		6'b111110: display_out = 14'b00000100100100; //62
		6'b111111: display_out = 14'b00000100110000; //63
		default: display_out = 14'b00000000000000;
	endcase


endmodule
