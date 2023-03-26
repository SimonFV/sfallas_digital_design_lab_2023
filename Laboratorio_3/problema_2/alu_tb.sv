module alu_tb();

parameter N = 4;

logic [N-1:0] a, b, result;
logic [3:0] selector;
logic Cin, Neg, Zero, Cout, Overflow;

alu #(N) _alu(a, b, selector, Cin, result, Neg, Zero, Cout, Overflow);



initial begin

Cin = 0;

// Prueba Shift Left Logico
selector = 4'b0111;
a = 4'b0110;
b = 4'b0001;
#40;
b = 4'b0000;
#40;
b = 4'b0011;
#40;
b = 4'b0010;
#40;

// Prueba Shift Right Logico
selector = 4'b0110;
a = 4'b0110;
b = 4'b0001;
#40;
b = 4'b0000;
#40;
b = 4'b0011;
#40;
b = 4'b0010;
#40;


// Prueba Shift Left Aritmetico
selector = 4'b1001;
a = 4'b0110;
b = 4'b0001;
#40;
b = 4'b0000;
#40;
b = 4'b0011;
#40;
b = 4'b0010;
#40;

// Prueba Shift Right Aritmetico
selector = 4'b1000;
a = 4'b1001;
b = 4'b0001;
#40;
b = 4'b0000;
#40;
b = 4'b0011;
#40;
b = 4'b0010;
#40;

//Pruebas not

selector = 4'b0010;
a = 4'b0001;
#10;
assert (result === 4'b1110) else $error("and failed.");
#40;

a = 4'b1001;
#10;
assert (result === 4'b0110) else $error("and failed.");
#40;


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


//Pruebas suma

Cin = 1;
selector = 4'b0000;
a = 4'b0001;
b = 4'b1010;
#40;

Cin = 0;
a = 4'b1011;
b = 4'b0110;
#40;

//Pruebas resta

Cin = 0;
selector = 4'b0001;
a = 4'b1111;
b = 4'b0000;
#40;

Cin = 0;
a = 4'b0011;
b = 4'b0011;
#40;


end

endmodule
