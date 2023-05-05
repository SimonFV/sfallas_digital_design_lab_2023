module random (input logic clk, output logic [1:0] x, output logic [1:0] y);


always_ff @(posedge clk) begin
	x <= x + 2'd_1;
	y <= x + 2'd_2;
end
endmodule