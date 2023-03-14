module alu_tb();

parameter N = 4;

logic [N-1:0] a, b, z;
logic [3:0] selector;
logic co;

alu #(N) _alu(a, b, selector, z, co);

initial begin

//Pruebas and

selector = 4'b0011;
a = 4'b0001;
b = 4'b0001;
#10;
assert (z === 4'b0001) else $error("and failed.");
#40;

a = 4'b1001;
b = 4'b0110;
#10;
assert (z === 4'b0000) else $error("and failed.");
#40;

//Pruebas or

selector = 4'b0100;
a = 4'b0001;
b = 4'b0001;
#10;
assert (z === 4'b0001) else $error("or failed.");
#40;

a = 4'b1001;
b = 4'b0110;
#10;
assert (z === 4'b1111) else $error("or failed.");
#40;

//Pruebas xor

selector = 4'b0101;
a = 4'b0001;
b = 4'b0001;
#10;
assert (z === 4'b0000) else $error("xor failed.");
#40;

a = 4'b1001;
b = 4'b0110;
#10;
assert (z === 4'b1111) else $error("xor failed.");
#40;

//Pruebas shift left arit

selector = 4'b1001;
a = 4'b0001;
b = 4'b0001;
#40;

a = 4'b1011;
b = 4'b0010;
#40;

end

/*
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
*/


endmodule
