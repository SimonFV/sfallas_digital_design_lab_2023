module alu_tb();

parameter N = 8;

logic [N-1:0] a, b, result;
logic [3:0] selector;
logic Cin, Neg, Zero, Cout, Overflow;

alu #(N) _alu(a, b, selector, result, Cin, Neg, Zero, Cout, Overflow);

/*
initial begin

//Pruebas and

selector = 4'b0011;
a = 4'b0001;
b = 4'b0001;
#10;
assert (result === 4'b0001) else $error("and failed.");
#40;

a = 4'b1001;
b = 4'b0110;
#10;
assert (result === 4'b0000) else $error("and failed.");
#40;

//Pruebas or

selector = 4'b0100;
a = 4'b0001;
b = 4'b0001;
#10;
assert (result === 4'b0001) else $error("or failed.");
#40;

a = 4'b1001;
b = 4'b0110;
#10;
assert (result === 4'b1111) else $error("or failed.");
#40;

//Pruebas xor

selector = 4'b0101;
a = 4'b0001;
b = 4'b0001;
#10;
assert (result === 4'b0000) else $error("xor failed.");
#40;

a = 4'b1001;
b = 4'b0110;
#10;
assert (result === 4'b1111) else $error("xor failed.");
#40;

//Pruebas shift left arit

selector = 4'b1001;
a = 4'b0010;
b = 4'b0001;
#40;

a = 4'b1011;
b = 4'b0010;
#40;


*/

initial begin

selector = 4'b0110;
a = 8'b00010110;
b = 8'b00000001;
#40;
a = 8'b00010110;
b = 8'b00000010;
#40;
a = 8'b10001000;
b = 8'b00000011;
#40;

end

//Pruebas suma

selector = 4'b0000;
a = 4'b0001;
b = 4'b1010;
cin = 0;
#40;
a = 4'b1011;
b = 4'b0110;
#40;

//Pruebas resta

selector = 4'b0001;
a = 4'b1010;
b = 4'b0001;
cin = 0;
#40;
a = 4'b0110;
b = 4'b1011;


#40;

end


endmodule
