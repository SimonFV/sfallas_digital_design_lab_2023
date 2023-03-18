module right_shift_logic #(parameter N)(input logic [N-1:0] a, b, 
													output logic [N-1:0] result);
													
													
		reg [1:0] a_temp;
		reg [1:0] result_temp;
		right_shift_logic_1bit inst(a_temp, result_temp);
		
		always_comb begin
			for(int i = 0; i < b-2; i++) begin
			
				a_temp[0] = a[i];
				a_temp[1] = a[i+1];
				result[i] = result_temp[0];
				result[i+1] = result_temp[1];
				
			end
		end
		

endmodule


module right_shift_logic_1bit (input logic [1:0] a,
										output logic [1:0] result);							

	assign result = a >> 1;

endmodule
