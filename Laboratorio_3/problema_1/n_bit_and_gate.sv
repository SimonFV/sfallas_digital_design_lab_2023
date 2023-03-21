module n_bit_and_gate #(parameter N)(
	input logic [N-1:0]a,
	input logic [N-1:0]b,
	output logic [N-1:0]out
);

	genvar i;

	generate
	
		for(i = 0; i < N; i = i + 1)
		begin: generate_n_bit_and
		
			andGate f (a[i], b[i], out[i]);
				
		end
		
	endgenerate

endmodule