module random (input clk, output [1:0] x1_out, y1_out, x2_out, y2_out);

logic [3:0] data = {1'b1, 1'b0, 1'b1, 1'b0}; 
logic feedback;

assign feedback = data[3] ^ data[0];

always_ff @(posedge clk) begin
	
	data <= {data[2:0], feedback} ;

end

assign x1_out = {data[0], data[1]};
assign y1_out = {data[2], data[3]};
assign x2_out = {data[1], data[2]};
assign y2_out = {data[0], data[3]};

endmodule