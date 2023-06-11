module top_arm(input logic clk_50Mhz, reset,
					output logic [6:0] s0, s1, s2,s3,
					output logic led_success);
	
	logic [31:0] WriteData = 32'd_0;
	logic [31:0] DataAdr = 32'd_0;
	logic MemWrite = 0;
	
	logic [31:0] PC = 32'd_0;
	logic [31:0] Instr, ReadData;
	logic clk;
	
	logic [7:0] pixel;
	logic [17:0] pixelAdr;
	assign pixelAdr = PC[19:2];
	
	// Procesador ARM uniciclo
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
				WriteData, ReadData);
	
	// RAM con las instrucciones del algoritmo ecualizador
	imem imem(PC, clk, Instr);
	
	// RAM para guardar la imagen ecualizada
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	
	// ROM que guarda los datos de la imagen (512x512 tamaño máximo)
	ROM image_rom(pixelAdr, clk, pixel);
	
	
	display7 d0(PC % 10, s0);
	display7 d1((PC/10) % 10, s1);
	display7 d2((PC/100) % 10, s2);
	display7 d3(ReadData[3:0] % 10, s3);
	
	always_comb begin
		
		if(PC > 32'd_100) clk = 0;
		else clk = clk_50Mhz;
		
		/*
		if(DataAdr === 100 & WriteData === 7) begin
			led_success = 1;
		end 
		else begin
			led_success = 0;
		end
		*/
		
	end
	
endmodule