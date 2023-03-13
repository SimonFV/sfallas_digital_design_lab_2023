module alu_not#(parameter N)(input logic [N-1:0] a, output logic [N-1:0] z);

assign z = ~a;

endmodule
