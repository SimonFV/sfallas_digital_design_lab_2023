module nbit_adder#(parameter N = 8)(
	input logic [N - 1:0] a, b, 
	output logic co,
	output logic [N-1:0] s);
	
	wire [N-1:0] c;
	
	genvar i;

	generate
	
		for(i = 0; i < N; i = i + 1)
		begin: generate_n_bit_adder
		
			if(i==0)
				half_adder f (a[0], b[0], s[0], c[0]);
			else
				full_adder f (a[i], b[i],  c[i-1], c[i], s[i]);
				
		end
		
		assign co = c[N - 1];
		
	endgenerate
	
endmodule