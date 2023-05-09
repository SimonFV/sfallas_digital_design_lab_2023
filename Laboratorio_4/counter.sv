module counter (input logic clk, input logic reset, output int q);


always_ff @(posedge clk)
	if (reset) begin 
		q <= 0; 
	end
	else begin 
		q <= q + 1;
	end
endmodule