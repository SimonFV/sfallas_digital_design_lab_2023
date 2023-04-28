module fsm_2048_tb;

  // Parameters
  parameter CLK_PERIOD = 10;

  // Inputs
  logic clk;
  logic reset;
  
  logic mov_left;
  logic mov_right;
  logic mov_up;
  logic mov_down;
  logic start;
  
  logic win_flag; //Señal de victoria (activo en alto)
  logic lose_flag; //Señal de derrota (activo en alto)

  int grid [3:0][3:0]; //Salida de la matriz del juego
  logic [3:0] score;//salida de puntuación del jugador
  

  fsm_2048 game2048 (
    .clk(clk),
    .reset(reset),
	 .start(start),
    .mov_left(mov_left),
    .mov_right(mov_right),
    .mov_up(mov_up),
    .mov_down(mov_down),
	 .grid(grid),
	 .win_flag(win_flag),
	 .lose_flag(lose_flag),
	 .score(score)
  );

  // Clock generation
  initial begin
    clk = 1'b0;
    repeat(1000) #((CLK_PERIOD)/2) clk = ~clk;
  end

  // reset
  initial begin
    reset = 1'b0;
    #((CLK_PERIOD)*10) reset = 1'b1;
  end

  // Testbench
  initial begin

    // Wait for the reset to complete
    #((CLK_PERIOD)*10)

    // Move the tiles to the left
	 
	 start = 1'b0;
	 #((CLK_PERIOD)*2) 
	 start = 1'b1;
	 
	 // Wait for the move to complete
    //#((CLK_PERIOD)*10)
	 
    //mov_left = 1'b0;
    //#((CLK_PERIOD)*2) 
	 //mov_left = 1'b1;

    // Wait for the move to complete
    #((CLK_PERIOD)*10)
	 
	 

    // Move the tiles to the right
    mov_right = 1'b0;
    #((CLK_PERIOD)*2) 
	 mov_right = 1'b1;

    // Wait for the move to complete
    #((CLK_PERIOD)*10)
	 
	 // Move the tiles to the right
    mov_right = 1'b0;
    #((CLK_PERIOD)*2) 
	 mov_right = 1'b1;

    // Wait for the move to complete
    #((CLK_PERIOD)*10)
	 
	 // Move the tiles down
    mov_down = 1'b0;
    #((CLK_PERIOD)*2) 
	 mov_down = 1'b1;

    // Wait for the move to complete
    #((CLK_PERIOD)*10)
	 
	 /*

    // Move the tiles up
    mov_up = 1'b0;
    #((CLK_PERIOD)*10) 
	 mov_up = 1'b1;

    // Wait for the move to complete
    #((CLK_PERIOD)*50)

    // Move the tiles down
    mov_down = 1'b0;
    #((CLK_PERIOD)*10) 
	 mov_down = 1'b1;

    // Wait for the move to complete
    #((CLK_PERIOD)*50) 
	 */

    // End of simulation
    $finish;
  end

endmodule