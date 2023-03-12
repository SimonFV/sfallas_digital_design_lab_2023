module alu_tb();

parameter N = 8;

logic [N-1:0] a, b, z;
logic co;

alu #(N) _alu(a, b, z, co);

initial begin

a = 8'b00010110;
b = 8'b10100101;
#40;
a = 8'b10110110;
b = 8'b01100000;
#40;

end

endmodule
