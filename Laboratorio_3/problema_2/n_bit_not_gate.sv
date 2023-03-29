module n_bit_not_gate #(parameter N)(
	input logic [N-1:0]a,
	output logic [N-1:0]out
);

	genvar i;

	generate
	
		for(i = 0; i < N; i = i + 1)
		begin: generate_n_bit_not
			
			alu_not f (a[i], out[i]);
				
		end
		
	endgenerate

endmodule