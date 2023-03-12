module alu #(parameter N = 8)(input logic [N-1:0] a, b, output logic [N-1:0] z, output logic co);

nbit_adder _adder(a, b, co, z );
//alu_not _not(a, z);

endmodule
