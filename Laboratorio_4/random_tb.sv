module random_tb();
	
	timeunit 1ns;

	logic clk = 0;
	logic [1:0] x1 = 2'd_0;
	logic [1:0] y1 = 2'd_0; 
	logic [1:0] x2 = 2'd_0;
	logic [1:0] y2 = 2'd_0;
	
	random _random(clk, x1, y1, x2, y2);
	
	always begin
		#5 clk = 1;
		#5 clk = 0;
	end
	
endmodule