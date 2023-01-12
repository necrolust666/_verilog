module ringC(
		input [3:0]ip,
		input clk,
		input [1:0]sel,

		output reg [3:0]buff,
		output reg [3:0]op		);


always @(posedge clk)
begin
	case(sel)
	
	2'b00:	begin
		buff[3:0] = ip[3:0];		
		end	

	// Left Shift Operation
	2'b01:	begin
		buff[3:0] = { buff[2:0], buff[3] };
		end

	// Right Shift Operation
	2'b10:	begin 
		buff[3:0] = { buff[0],	buff[3:1]};
		end

	endcase
end

endmodule


