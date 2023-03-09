module alu_tb();

parameter N = 4;

logic [N-1:0] a, b, z;

alu #(N) _alu(a, b, z);

initial begin

a = 4'b0000;
#40;
a = 4'b0101;
#40;

end

endmodule
