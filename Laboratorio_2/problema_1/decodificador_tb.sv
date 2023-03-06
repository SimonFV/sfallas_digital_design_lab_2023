module decodificador_tb();

  logic [3:0] a;
  logic [7:0] y;
  logic [13:0] s;
  
  decodificador deco(a, y, s);

  initial
    begin
		$display("Iniciando simulacion...");
		
      a = 4'b0000;
		#5;
		assert(y === 8'b00000000) else $error("0000 fallo");
		#40;
		
		a = 4'b0001;
		#5;
		assert(y === 8'b00000001) else $error("0001 fallo");
		#40;
		
		a = 4'b0010;
		#5;
		assert(y === 8'b00000010) else $error("0010 fallo");
		#40;
		
		a = 4'b0011;
		#5;
		assert(y === 8'b00000011) else $error("0011 fallo");
		#40;
		
		a = 4'b1100;
		#5;
		assert(y === 8'b00010010) else $error("1100 fallo");
		#40;
		
		a = 4'b1101;
		#5;
		assert(y === 8'b00010011) else $error("1101 fallo");
		#40;
		
		a = 4'b1110;
		#5;
		assert(y === 8'b00010100) else $error("1110 fallo");
		#40;
		
		a = 4'b1111;
		#5;
		assert(y === 8'b00010101) else $error("1111 fallo");
		#40;
		
		$display("Prueba finalizada.");
		
    end
endmodule
