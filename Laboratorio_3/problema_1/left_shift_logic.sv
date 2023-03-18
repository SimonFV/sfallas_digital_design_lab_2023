module left_shift_logic #(parameter N)(input logic [N-1:0] a, b, 
													output logic [N-1:0] result);

assign result = a << b;

endmodule
