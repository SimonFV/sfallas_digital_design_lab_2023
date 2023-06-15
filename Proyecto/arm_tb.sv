`timescale 1 ns / 1 ns

module arm_tb();
	logic clk = 0;
	logic reset;
	logic [31:0] WriteData, DataAdrA, DataAdrB;
	logic MemWriteEnable;
	
	logic [31:0] PC = 32'd_0;
	logic [31:0] Instr, ReadDataA, ReadDataB;

	
	arm arm(clk, reset, PC, Instr, MemWriteEnable, DataAdrA,
				WriteData, ReadDataA);
				
	
	dmem dmem(clk, 
				 DataAdrA, DataAdrB, 
				 WriteData, MemWriteEnable,
				 ReadDataA, ReadDataB);
	
	initial begin
		reset = 1; # 22; reset <= 0;
		
		Instr = 32'h_E04F000F;
		clk = 0; # 5;
		clk = 1; # 5;
		
		Instr = 32'h_E2802005;
		clk = 0; # 5;
		clk = 1; # 5;
		
		Instr = 32'h_E280300C;
		clk = 0; # 5;
		clk = 1; # 5;
		
		Instr = 32'h_E5823000;
		clk = 0; # 5;
		clk = 1; # 5;
		
		clk = 0; # 5;
		clk = 1; # 5;
		
		assert (MemWriteEnable === 1) else begin
			$error("Write enable deberia estar activo.");
			$stop;
		end
		assert (WriteData === 32'd_12) else begin
			$error("El dato a escribir deberia ser 12.");
			$stop;
		end
		assert (DataAdrA === 32'd_5) else begin
			$error("La direccion de escritura deberia ser 0x5.");
			$stop;
		end
		
		$display("Simulacion del procesador ARM exitosa.");
	end
	
endmodule