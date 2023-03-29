module registro_out #(parameter N = 2) (input logic clk,
												input logic reset,
												input logic [N-1:0] d,
												output logic [N-1:0] q);
	
	// reset asincronico
	always_ff @(posedge clk, posedge reset)
		if (reset) begin
			q <= 0;
		end
		else begin
			q <= d;
		end
		
endmodule