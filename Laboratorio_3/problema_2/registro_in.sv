module registro_in #(parameter N = 2) (input logic clk,
												input logic reset,
												input logic [N-1:0] a_in, b_in,
												output logic [N-1:0] a_out, b_out);
	
	// reset asincronico
	always_ff @(posedge clk, posedge reset)
		if (reset) begin
			a_out <= 0;
			a_out <= 0;
		end
		else begin
			a_out <= a_in;
			b_out <= b_in;
		end
		
endmodule