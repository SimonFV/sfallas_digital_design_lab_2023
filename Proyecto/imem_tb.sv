`timescale 1 ns / 1 ns

module imem_tb();
	
	logic [31:0] PC = 32'd_0;
	logic [31:0] Instr;

	imem imem(PC, Instr);
	
	initial begin
		# 5;
		PC = 32'd_0;
		# 5;
		assert (Instr === 32'h_E24F0008) else begin
			$error("La instruccion deberia ser E24F0008.");
			$stop;
		end
		
		# 5;
		PC = 32'd_20;
		# 5;
		assert (Instr === 32'h_0A000009) else begin
			$error("La instruccion deberia ser 0A000009.");
			$stop;
		end
		
		# 5;
		PC = 32'd_400;
		# 5;
		assert (Instr === 32'h_EAFFFFF4) else begin
			$error("La instruccion deberia ser EAFFFFF4.");
			$stop;
		end
		
		# 5;
		
		$display("Simulacion de la memoria de instrucciones exitosa.");
	end
	
endmodule