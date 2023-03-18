module left_shift_arithmetic #(parameter N)(input logic signed [N-1:0] a,
															input logic [N-1:0] b, 
															output logic [N-1:0] result);

assign result = a <<< b;

endmodule
