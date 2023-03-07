module down_counter_tb2;

  // parametros
  parameter N = 2; // numero de bits del contador

  // señales
  logic clk;
  logic reset;
  logic [N-1:0] q;
  logic [13:0] s;

  // módulo bajo prueba
  down_counter #(N) dut (
    .clk(clk),
    .reset(reset),
    .q(q),
	 .s(s)
  );

  // generador de reloj
  initial begin //a diferencia del proceso always, este solo se ejecuta una vez
    clk = 0;
    repeat (1000) begin
      #5 clk = ~clk; //el #5 es igual a un delay de 5 ns
    end
  end
  
  

  // estímulos y chequeos
  initial begin
 
    // reset asincrónico
    reset = 0;
	 #5 reset = 1;
    assert (q === 2**N-1) else $error("Error en reset asincrónico");
	 
  end

endmodule