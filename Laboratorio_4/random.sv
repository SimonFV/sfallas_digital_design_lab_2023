module random (input clk, output [1:0] x1_out, y1_out, x2_out, y2_out);

logic [7:0] data = {1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0}; 
logic feedback;

assign feedback = data[7] ^ data[0];

always_ff @(posedge clk) begin
	
	data <= {data[6:0], feedback} ;

end

assign x1_out = {data[0], data[1]};
assign y1_out = {data[2], data[3]};
assign x2_out = {data[4], data[5]};
assign y2_out = {data[6], data[7]};

endmodule