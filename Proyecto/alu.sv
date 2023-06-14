module alu #(parameter N = 32)
	    (input  logic [N-1:0] a, b,
	     input  logic [2:0]   ALUControl,
		  input logic [4:0] Shamt,
		  input logic [1:0] ShiftType,
	     output logic [N-1:0] Result,
	     output logic [3:0] ALUFlags);

   logic [N-1:0] resultADD, resultSUB, resultAND, resultOR, resultShift;
   logic	 cout, coutADD, coutSUB;

   adderalu #(32) adder_inst(a, b, 1'b0, resultADD, coutADD);
   adderalu #(32) subtractor_inst(a, ~b, 1'b1, resultSUB, coutSUB);
	
	barrel_shifter b_shifter(b, ShiftType, Shamt, resultShift);
	
   assign resultAND = a & b;
   assign resultOR = a | b;

   always_comb begin 
		case (ALUControl)
			3'b000:	// Add
			begin
				Result = resultADD;
				cout = coutADD;
			end
			
			3'b001:	// Subtract
			begin
				Result = resultSUB;
				cout = coutSUB;
			end
			
			3'b010:	// AND
			begin
				Result = resultAND;
				cout = 0;
			end
			
			3'b011:	// OR
			begin
				Result = resultOR;
				cout = 0;
			end
			
			3'b100:	// Shift
			begin
				Result = resultShift;
				cout = 0;
			end
			
			default: 
			begin
				Result = 32'b0;
				cout = 0;
			end
			
      endcase
   end
	
   // ALUFlags: [3] = Negative     [2] = Zero     [1] = Carry out     [0] = oVerflow
   assign ALUFlags[3] = Result[N-1];
   assign ALUFlags[2] = &(~Result);
   assign ALUFlags[1] = ((~ALUControl[1]) & cout);
   assign ALUFlags[0] = ~(a[N-1]^b[N-1]^ALUControl[0]) & (a[N-1]^Result[N-1])&~ALUControl[1];
	
endmodule