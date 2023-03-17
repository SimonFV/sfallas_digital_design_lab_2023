module alu #(parameter N = 4)(input logic [N-1:0] a, b,
										input logic cin,
										input logic [3:0] selector,
										output logic [N-1:0] z, 
										output logic co);

		logic [N-1:0] resultSuma;
		logic [N-1:0] resultResta;
		logic [N-1:0] resultNot;
		logic [N-1:0] resultAnd;
		logic [N-1:0] resultOr;
		logic [N-1:0] resultXor;
		logic [N-1:0] resultSRL;
		logic [N-1:0] resultSLL;
		logic [N-1:0] resultSRA;	
		logic [N-1:0] resultSLA;
									
		right_shift_logic #(N) shift_RL (a, b, resultSRL);										
		left_shift_logic #(N) shift_LL (a, b, resultSLL);
		right_shift_arithmetic #(N) shift_RA (a, b, resultSRA);
		left_shift_arithmetic #(N) shift_LA (a, b, resultSLA);
		nbit_adder #(N) _adder(a, b, cin, co, resultSuma);
		nbit_adder #(N) _subs(a, (~b), cin, X, resultResta);
		alu_not #(N) _not(a, resultNot);
		andGate #(N) _and(a, b, resultAnd);
		orGate #(N) _or(a, b, resultOr);
		xorGate #(N) _xor(a, b, resultXor);
		
always_comb begin
	case (selector)
		4'b0000: z = resultSuma;  //0) suma
		4'b0001: z = resultResta + 1; //1) resta
		4'b0010: z = resultNot;   //2) not
		4'b0011: z = resultAnd;   //3) and
		4'b0100: z = resultOr;    //4) or
		4'b0101: z = resultXor;   //5) xor
		4'b0110: z = resultSRL;   //6) shift right lógico
		4'b0111: z = resultSLL;   //7) shift left lógico
		4'b1000: z = resultSRA;   //8) shift right aritmético
		4'b1001: z = resultSLA;   //9) shift left aritmético
		default: z = 4'b0000;     //operación inválida
	endcase
end

endmodule
