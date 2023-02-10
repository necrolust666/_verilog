module vars( output reg [3:0]op);

reg [3 : 0]val;

always @(*)
begin
	op = val;
end

endmodule