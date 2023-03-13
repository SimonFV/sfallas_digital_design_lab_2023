module left_shift_logic #(parameter N)(input logic [N-1:0] a, b, 
													output logic [N-1:0] z);

assign z = a << b;

endmodule
