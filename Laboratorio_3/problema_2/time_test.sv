module time_test #(parameter N = 2) (input logic clk, reset,
												input logic [N-1:0] a_in, b_in,
												input logic [3:0] selector_in,
												input logic Cin_in,
												output logic [N-1:0] result_out,
												output logic Neg_out, Zero_out, Cout_out, Overflow_out);

	logic [N-1:0] a_out, b_out, result;
	logic [3:0] selector;
	logic Cin, Neg, Zero, Cout, Overflow;

	
	alu #(N) _alu(a_out, b_out, selector, Cin, result, Neg, Zero, Cout, Overflow);
	
	always_ff @(posedge clk)
	
		if (reset) begin 
			a_out <= 0;
			b_out <= 0;
			Cin = 0;
			selector = 0;
			result_out <= 0;
			Neg_out <= 0;
			Zero_out <= 0;
			Cout_out <= 0;
			Overflow_out <= 0;
		end
		else begin
			a_out <= a_in;
			b_out <= b_in;
			Cin = Cin_in;
			selector = selector_in;
			result_out <= result;
			Neg_out <= Neg;
			Zero_out <= Zero;
			Cout_out <= Cout;
			Overflow_out <= Overflow;
		end
	
endmodule

