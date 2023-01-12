module tst;

reg [3:0]OPCODE;
reg [3:0]A;
reg [3:0]B;

wire [7:0]OP;
wire FLAG;

integer i;

alu dut(
	.opcode(OPCODE),
	.a(A),
	.b(B),	
	.op(OP),
	.flag(FLAG)
			);
initial

begin
// INITIALIZE 
A = 4'b0000; B = 4'b0000; OPCODE = 4'b0000;

	for(i = 4'd0; i<4'd11; i = i + 1'd1)
	begin
		OPCODE = i; A = 0001; B = 0010;
		#100;
	end	
	
end

initial 

begin
	#2000 $finish;
end

endmodule
