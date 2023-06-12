module main(input logic clk_50Mhz_in, reset,

				output VGA_HS, VGA_VS, 
				output [7:0] VGA_R, VGA_G, VGA_B, 
				output VGA_SYNC_N, VGA_CLK, VGA_BLANK_N,
					
				output logic [6:0] s0, s1, s2,s3,
				output logic led_success);
	
	logic [31:0] WriteData, DataAdrA, DataAdrB;
	logic MemWriteEnable;
	
	logic [31:0] PC = 32'd_0;
	logic [31:0] Instr, ReadDataA, ReadDataB;
	logic clk_50Mhz;
	
	
	
	// Para acceder a los pixeles de la imagen en la ROM
	logic [7:0] pixel_a, pixel_b;
	logic [15:0] pixelAdrA, pixelAdrB;
	
	
	// Para controlar los puertos del Driver VGA
	logic [23:0] pixel_color;
	
	// Controla la posicion del siguiente pixel del DriverVGA
	logic [31:0] next_x = 32'd_0;
	logic [31:0] next_y = 32'd_0;
	
	logic clk_25Mhz = 0;
	logic reset_vga = 0;
	
	
	
	// Procesador ARM uniciclo
	arm arm(clk_50Mhz, reset, PC, Instr, MemWriteEnable, DataAdrA,
				WriteData, ReadDataA);
	
	// RAM con las instrucciones del algoritmo ecualizador
	imem imem(PC, clk_50Mhz, Instr);
	
	// RAM para guardar la imagen ecualizada y los datos de las operaciones
	dmem dmem(clk_50Mhz, 
				 DataAdrA, DataAdrB, 
				 WriteData, MemWriteEnable,
				 ReadDataA, ReadDataB);
	
	
	// ROM que guarda los datos de la imagen (256x256 tamaño máximo)
	ROM2 image_rom(pixelAdrA, pixelAdrB, clk_50Mhz, pixel_a, pixel_b);
	
	
	
	// Interprete para ayudarle al Driver VGA a dibujar las dos imagenes
	interpreter inter(next_x, next_y,
						   pixel_b, ReadDataB[7:0],
							pixelAdrB, DataAdrB,
						   pixel_color);
	
	// Driver VGA (para mostrar las dos imagenes en pantalla)
	vga_driver draw(clk_25Mhz, reset_vga, pixel_color,
						 VGA_HS, VGA_VS, 
						 VGA_R, VGA_G, VGA_B, 
						 VGA_SYNC_N, VGA_CLK, VGA_BLANK_N,
						 next_x, next_y);
	
	// Reloj para la salida VGA
	always_ff @ (posedge clk_50Mhz_in)
		clk_25Mhz <= ~clk_25Mhz;
	
	
	
	
	
	
	
	display7 d0(PC[3:0] % 4'd_10, s0);
	display7 d1((PC[3:0]/10) % 4'd_10, s1);
	display7 d2((PC[3:0]/100) % 4'd_10, s2);
	display7 d3(ReadDataA[3:0] % 4'd_10, s3);
	
	always_comb begin
		
		if(PC > 32'd_100) clk_50Mhz = 0;
		else clk_50Mhz = clk_50Mhz_in;
		
		/*
		if(DataAdr === 100 & WriteData === 7) begin
			led_success = 1;
		end 
		else begin
			led_success = 0;
		end
		*/
		
	end
	
	assign led_success = 0;
	
endmodule