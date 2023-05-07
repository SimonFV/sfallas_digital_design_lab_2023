module display7(input logic [3:0] data,
					output logic [6:0] segments);

	always_comb begin
		case(data)
			4'd_0: segments = 7'b000_0001;
			4'd_1: segments = 7'b100_1111;
			4'd_2: segments = 7'b001_0010;
			4'd_3: segments = 7'b000_0110;
			4'd_4: segments = 7'b100_1100;
			4'd_5: segments = 7'b010_0100;
			4'd_6: segments = 7'b010_0000;
			4'd_7: segments = 7'b000_1111;
			4'd_8: segments = 7'b000_0000;
			4'd_9: segments = 7'b000_1100;
			default: segments = 7'b111_1111;
		endcase
	end
endmodule