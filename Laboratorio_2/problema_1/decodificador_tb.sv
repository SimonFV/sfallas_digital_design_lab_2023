module decodificador_tb();

  logic [2:0] a;
  logic [7:0] y;
  
  decodificador deco(a, y);

  initial
    begin
      a = 3'b000;
		#40
		a = 3'b001;
		#40;
		a = 3'b010;
		#40;
		a = 3'b011;
		#40
		a = 3'b100;
		#40;
		a = 3'b101;
		#40;
		a = 3'b110;
		#40;
		a = 3'b111;
		#40;
    end
endmodule
