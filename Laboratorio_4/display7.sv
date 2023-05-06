module sevenseg(input logic [3:0] data,
					output logic [6:0] segments);

	always_comb begin
		case(data)
			4'd_0: segments = 7'b111_1110;
			4'd_1: segments = 7'b011_0000;
			4'd_2: segments = 7'b110_1101;
			4'd_3: segments = 7'b111_1001;
			4'd_4: segments = 7'b011_0011;
			4'd_5: segments = 7'b101_1011;
			4'd_6: segments = 7'b101_1111;
			4'd_7: segments = 7'b111_0000;
			4'd_8: segments = 7'b111_1111;
			4'd_9: segments = 7'b111_0011;
			default: segments = 7'b000_0000;
		endcase
	end
endmodule