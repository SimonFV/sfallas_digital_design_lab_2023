module n_bit_xor_gate #(parameter N)(
	input logic [N-1:0]a,
	input logic [N-1:0]b,
	output logic [N-1:0]out
);

	genvar i;

	generate
	
		for(i = 0; i < N; i = i + 1)
		begin: generate_n_bit_xor
		
			if(i==0)
				xorGate f (a[0], b[0], out[0]);
			else
				xorGate f (a[i], b[i], out[i]);
				
		end
		
	endgenerate

endmodule