module down_counter_tb;

  // parametros
  parameter N = 4; // numero de bits del contador

  // señales
  logic clk;
  logic rst_n;
  logic [N-1:0] count;

  // módulo bajo prueba
  down_counter #(N) dut (
    .clk(clk),
    .rst_n(rst_n),
    .count(count)
  );

  // generador de reloj
  initial begin //a diferencia del proceso always, este solo se ejecuta una vez
    clk = 0;
    repeat (1000) begin
      #5 clk = ~clk; //el #5 es igual a un delay de 5 ns
    end
    $finish;
  end
  
  

  // estímulos y chequeos
  initial begin
  
    //clk = 0;
    // reset asincrónico
    rst_n = 0;
    #5 
	 rst_n = 1;
    assert (count === '0) else $error("Error en reset asincrónico");

    // contar hacia abajo desde 7
    count = 7;
    repeat (8) begin
      #5 
		assert (count === $unsigned(count-1)) else $error("Error en conteo1");
    end

    // contar hacia abajo desde 1
    count = 1;
    repeat (2) begin
      #5 
		assert (count === $unsigned(count-1)) else $error("Error en conteo2");
    end

    // contar hacia abajo desde 0
    count = 0;
    repeat (2**N-1) begin
      #5 
		assert (count === $unsigned(count-1)) else $error("Error en conteo3");
    end
  end
  
  //always #5 clk = ~clk;

endmodule