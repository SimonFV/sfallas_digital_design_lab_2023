module alu #(parameter N = 8)(input logic [N-1:0] a, b,
										input logic Cin,
										input logic [3:0] selector,
										output logic [N-1:0] result, 
										output logic Neg, Zero, Cout, Overflow);

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
		nbit_adder #(N) _adder(a, b, Cin, Cout, resultSuma);
		alu_not #(N) _not(a, resultNot);
		andGate #(N) _and(a, b, resultAnd);
		orGate #(N) _or(a, b, resultOr);
		xorGate #(N) _xor(a, b, resultXor);

always_comb begin
	case (selector)
		4'b0000: begin			//0) suma
		result = resultSuma;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0001: begin			//1) resta
		result = resultSuma;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0010: begin			//2) not
		result = resultNot;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0011: begin			//3) and
		result = resultAnd;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0100: begin			//4) or
		result = resultOr;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0101: begin			//5) xor
		result = resultXor;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0110: begin			//6) shift right lógico
		result = resultSRL;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b0111: begin			//7) shift left lógico
		result = resultSLL;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b1000: begin			//8) shift right aritmético
		result = resultSRA;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		4'b1001: begin			//9) shift left aritmético
		result = resultSLA;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
		
		default: begin			//operación inválida
		result = 0;
		Overflow = 0;
		Neg = 0;
		Zero = result ? 0 : 1;
		end
	endcase
end

endmodule
