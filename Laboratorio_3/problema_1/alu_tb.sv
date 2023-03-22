module alu_tb();

parameter N = 4;

logic [N-1:0] a, b, result;
logic [3:0] selector;
logic Cin, Neg, Zero, Cout, Overflow;
logic [13:0] display_0;

alu #(N) _alu(a, b, ~selector, Cin, result, Neg, Zero, Cout, Overflow, display_0);



initial begin

$display("Starting simulation...");



//Pruebas suma
$display("Excecuting adding tests...");

Cin = 1;
selector = 4'b0000;
a = 4'b0001;
b = 4'b1010;
#10;
assert (result === 4'b1100) else $error("adding failed.");
#10;
assert (Cout === 4'b0) else $error("carry flag failed.");
#40;

Cin = 0;
a = 4'b1111;
b = 4'b1111;
#10;
assert (result === 4'b1110) else $error("adding failed.");
#10;
assert (Cout === 4'b1) else $error("carry flag failed.");
#40;


//Pruebas resta
$display("Excecuting subtraction tests...");

selector = 4'b0001;
a = 4'b0010;
b = 4'b0101;
#10;
assert (result === 4'b0011) else $error("subtraction failed.");
#10;
assert (Neg === 4'b0) else $error("negative flag failed.");
#40;

a = 4'b0011;
b = 4'b0011;
#10;
assert (result === 4'b0000) else $error("subtraction failed.");
#10;
assert (Zero === 1'b1) else $error("zero flag failed.");
#40;


//Pruebas not
$display("Excecuting not gate tests...");

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
$display("Excecuting and gate tests...");

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
$display("Excecuting or gate tests...");

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
$display("Excecuting xor gate tests...");

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


// Prueba Shift Left Logico
$display("Excecuting logic shift left tests...");

selector = 4'b0111;
a = 4'b1101;
b = 4'b0001;
#10;
assert (result === 4'b1010) else $error("logic shift left failed.");
#40;
a = 4'b0110;
b = 4'b0000;
#10;
assert (result === 4'b0110) else $error("logic shift left failed.");
#40;

// Prueba Shift Right Logico
$display("Excecuting logic shift right tests...");

selector = 4'b0110;
a = 4'b0110;
b = 4'b0001;
#10;
assert (result === 4'b0011) else $error("logic shift right failed.");
#40;
a = 4'b0110;
b = 4'b0011;
#10;
assert (result === 4'b0000) else $error("logic shift right failed.");
#40;



// Prueba Shift Left Aritmetico
$display("Excecuting arithmetic shift left tests...");

selector = 4'b1001;
a = 4'b0110;
b = 4'b0001;
#10;
assert (result === 4'b1100) else $error("arithmetic shift left failed.");
#40;
a = 4'b1011;
b = 4'b0011;
#10;
assert (result === 4'b1000) else $error("arithmetic shift left failed.");
#40;

// Prueba Shift Right Aritmetico
$display("Excecuting arithmetic shift right tests...");

selector = 4'b1000;
a = 4'b1011;
b = 4'b0001;
#10;
assert (result === 4'b1101) else $error("arithmetic shift right failed.");
#40;
a = 4'b0100;
b = 4'b0010;
#10;
assert (result === 4'b0001) else $error("arithmetic shift right failed.");
#40;

$display("Simulation finished");

end

endmodule
