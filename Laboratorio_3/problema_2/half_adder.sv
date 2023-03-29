// half adder module 
module half_adder (
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;   // sum of half adder
    assign carry = a & b; // carry of half adder
     
endmodule