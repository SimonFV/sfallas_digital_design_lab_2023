module decodificador_tb();

  logic [3:0] a;
  logic [7:0] y;
  logic [13:0] s;
  
  decodificador deco(a, y, s);

  initial
    begin
      a = 4'b0000;
		#40
		a = 4'b0001;
		#40;
		a = 4'b0010;
		#40;
		a = 4'b0011;
		#40
		a = 4'b0100;
		#40;
		a = 4'b0101;
		#40;
		a = 4'b0110;
		#40;
		a = 4'b0111;
		#40;
		a = 4'b1000;
		#40
		a = 4'b1001;
		#40;
		a = 4'b1010;
		#40;
		a = 4'b1011;
		#40
		a = 4'b1100;
		#40;
		a = 4'b1101;
		#40;
		a = 4'b1110;
		#40;
		a = 4'b1111;
		#40;
    end
endmodule
