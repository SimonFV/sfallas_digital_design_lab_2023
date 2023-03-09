module alu #(parameter N = 4)(input logic [N-1:0] a, b, output logic [N-1:0] z);


alu_not _not(a, z);

endmodule
