module fsm_2048(clk,reset,start,mov_left,mov_right,mov_up,mov_down,grid,win_flag,lose_flag,score);

input logic clk;         //Señal del reloj
input logic reset;       //Señal de reinicio(activo en alto)
input logic start;       //Señal para el inicio del juego
input logic mov_left;    // 
input logic mov_right;   // Señales de dirección de movimiento
input logic mov_up;      // 
input logic mov_down;    // 

output int grid [0:3][0:3]; //Salida de la matriz del juego
output logic win_flag=0;      //Señal de victoria (activo en alto)
output logic lose_flag=0;     //Señal de derrota (activo en alto)
output logic [3:0] score=0;         //salida de puntuación del jugador

int number = 5;      
int random_number=0;
logic counter=0;

typedef enum logic [2:0]
	{
		S_INIT = 3'b000,
		S_PLAY = 3'b001,
		S_NEW_BLOCK = 3'b010,
		S_WIN = 3'b011,
		S_LOSE = 3'b100
	} state_t;
	
	state_t curr_state, next_state; //Estados actual y siguiente

int row, col;


//actual state logic
always @ (negedge clk, negedge reset)
	if (~reset) begin
		curr_state = S_INIT;
		end
		else begin
			curr_state = next_state;
		end


//next state logic
always @ (negedge clk, negedge ~mov_left, negedge ~mov_right, negedge ~mov_up, negedge ~mov_down)
		case (curr_state)
			S_INIT: begin
							if(~start)
							begin
								grid = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
								number = 5;       
								random_number=0;
								counter=0;
								score=0;
								row = 0; col = 0;
									 repeat(2) begin
										random_number = (counter + number) % 4;
										counter = counter + 1;
										row = random_number;
										random_number = (counter + number) % 4;
										counter = counter + 1;
										col = random_number; 
										grid[row][col] = 2; 
									 end
							next_state = S_PLAY;
							end
						end
					
			
			S_PLAY: begin
					if(win_flag) next_state = S_WIN;
			
					if(lose_flag) next_state = S_LOSE;
					
					if(~mov_left) begin
						if (lose_flag == 0) begin
						  int row, col, i, j, k;
						  for (row = 0; row < 4; row++) begin
							 // Mover los valores hacia la izquierda en la fila actual
							 i = 0;
							 j = 0;
							 while (i < 4) begin
								if (grid[row][i] != 0) begin
								  grid[row][j] = grid[row][i];
								  if (i != j) // Si no se copió el valor a sí mismo
									 grid[row][i] = 0;
								  j++;
								end
								i++;
							 end
							 
							 // combinar los bloques adyacentes si son iguales
							 k = 0;
							 while (k < 3) begin
								if (grid[row][k] == grid[row][k+1]) begin
								  grid[row][k] *= 2;
								  grid[row][k+1] = 0;
								end
								k++;
							 end
							 
							 // Mover los valores hacia izquierda después de la unión
							 i = 0;
							 j = 0;
							 while (i < 4) begin
								if (grid[row][i] != 0) begin
								  grid[row][j] = grid[row][i];
								  if (i != j) // Si no se copió el valor a sí mismo
									 grid[row][i] = 0;
								  j++;
								end
								i++;
							 end
						  end
							score++;
							next_state = S_NEW_BLOCK;
						end
						
					end
					
					if(~mov_right) begin
						//
						if (lose_flag == 0) begin
							int row, col, i, j, k;
							  for (row = 0; row < 4; row++) begin
								 // Mover los valores hacia la derecha en la fila actual
								 i = 3;
								 j = 3;
								 while (i >= 0) begin
									if (grid[row][i] != 0) begin
									  grid[row][j] = grid[row][i];
									  if (i != j) // Si no se copió el valor a sí mismo
										 grid[row][i] = 0;
									  j--;
									end
									i--;
								 end
								 
								 // combinar los bloques adyacentes si son iguales
								 k = 3;
								 while (k > 0) begin
									if (grid[row][k] == grid[row][k-1]) begin
									  grid[row][k] *= 2;
									  grid[row][k-1] = 0;
									end
									k--;
								 end
								 
								 // Mover los valores hacia la derecha después de la unión
								 i = 3;
								 j = 3;
								 while (i >= 0) begin
									if (grid[row][i] != 0) begin
									  grid[row][j] = grid[row][i];
									  if (i != j) // Si no se copió el valor a sí mismo
										 grid[row][i] = 0;
									  j--;
									end
									i--;
								 end
							  end
							score++;
							next_state = S_NEW_BLOCK;
						end
					end
					
					if(~mov_up) begin
						
						if (lose_flag == 0) begin
						  int row, col, i, j, k;
  
						  for (col = 0; col < 4; col++) begin
							 // Mover los valores hacia arriba en la columna actual
							 i = 0;
							 j = 0;
							 while (i < 4) begin
								if (grid[i][col] != 0) begin
								  grid[j][col] = grid[i][col];
								  if (i != j) // Si no se copió el valor a sí mismo
									 grid[i][col] = 0;
								  j++;
								end
								i++;
							 end
							 
							 // combinar los bloques adyacentes si son iguales
							 k = 0;
							 while (k < 3) begin
								if (grid[k][col] == grid[k+1][col]) begin
								  grid[k][col] *= 2;
								  grid[k+1][col] = 0;
								end
								k++;
							 end
							 
							 // Mover los valores hacia arriba después de la unión
							 i = 0;
							 j = 0;
							 while (i < 4) begin
								if (grid[i][col] != 0) begin
								  grid[j][col] = grid[i][col];
								  if (i != j) // Si no se copió el valor a sí mismo
									 grid[i][col] = 0;
								  j++;
								end
								i++;
							 end
						  end
							score++;
							next_state = S_NEW_BLOCK;
						end
					end
					
					if(~mov_down) begin
						if (lose_flag == 0) begin
							  int row, col, i, j, k;
  
							  for (col = 0; col < 4; col++) begin
								 // Mover los valores hacia abajo en la columna actual
								 i = 3;
								 j = 3;
								 while (i >= 0) begin
									if (grid[i][col] != 0) begin
									  grid[j][col] = grid[i][col];
									  if (i != j) // Si no se copió el valor a sí mismo
										 grid[i][col] = 0;
									  j--;
									end
									i--;
								 end
								 
								 // combinar los bloques adyacentes si son iguales
								 k = 3;
								 while (k > 0) begin
									if (grid[k][col] == grid[k-1][col]) begin
									  grid[k][col] *= 2;
									  grid[k-1][col] = 0;
									end
									k--;
								 end
								 
								 // Mover los valores hacia abajo después de la unión
								 i = 3;
								 j = 3;
								 while (i >= 0) begin
									if (grid[i][col] != 0) begin
									  grid[j][col] = grid[i][col];
									  if (i != j) // Si no se copió el valor a sí mismo
										 grid[i][col] = 0;
									  j--;
									end
									i--;
								 end
							  end
							score++;
							next_state = S_NEW_BLOCK;
						end
					end
				end
			
			S_NEW_BLOCK:
						begin
					  int row, col;
					  logic counter;
					  counter=0;
					  // Se revisa si hay celdas vacías y si encuentra alguna agrega un 2 ahí
					  for (row = 0; row < 4; row++) begin
						 for (col = 0; col < 4; col++) begin
							if (grid[row][col] == 0 && ~counter) begin
								grid[1][0] = 2;
								counter=1; 
							end
						 end
					  end
						next_state = S_PLAY;
						end
			
			S_LOSE:
				begin
				//definir lógica para la detectar la derrota
					next_state = S_INIT;
				end
			
			S_WIN:
				begin
				//definir lógica para la detectar la victoria
					next_state = S_INIT;
				end

			
			default: next_state = S_INIT;
			
		endcase
		

endmodule