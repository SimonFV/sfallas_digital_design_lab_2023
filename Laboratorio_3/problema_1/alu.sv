module alu #(parameter N = 4)(input logic [N-1:0] a, b, 
										output logic [N-1:0] z, 
										output logic co);

<<<<<<< Updated upstream

//right_shift_logic #(N) shift_RL (a, b, z);										
//left_shift_logic #(N) shift_LL (a, b, z);
//right_shift_arithmetic #(N) shift_RA (a, b, z);
left_shift_arithmetic #(N) shift_LA (a, b, z);
//nbit_adder #(N) _adder(a, b, co, z );
//alu_not #(N) _not(a, z);

=======
//nbit_adder _adder(a, b, co, z );
//alu_not _not(a, z);
//andGate _and(a, b, z);
//orGate _or(a, b, z);
xorGate _xor(a, b, z);
>>>>>>> Stashed changes
endmodule
