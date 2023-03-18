module N_mux #(parameter N = 2, parameter WIDTH = 1)
					(input logic [WIDTH-1:0] mux_in [N-1:0],
					 input logic [N-1:0] sel,
					output logic [WIDTH-1:0] mux_out);
					
  logic [$clog2(N)-1:0] shamt;
  always_comb begin
	  for(int i = 0; i<$clog2(N); i++) begin
			shamt[i] = sel[i];
	  end
  end
  
  assign mux_out = mux_in[sel];
    
endmodule
