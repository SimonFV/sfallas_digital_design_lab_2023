module left_shift_arithmetic #(parameter N)(input logic [N-1:0] a, b, 
													output logic [N-1:0] result);
													
		genvar i, j;
		
		generate
			for(i = 0; i<N; i++) begin:b1
				
				logic a_u[N-1:0];
				for(j = 0; j<N; j++) begin:b2
					if (j < N-i) 
						assign a_u[j] = a[N-1-i-j];
					else
						assign a_u[j] = 1'b0;
					
				end
					
				N_mux #(N, 1) mx(a_u, b, result[N-1-i]);
				
			end
		endgenerate

endmodule
