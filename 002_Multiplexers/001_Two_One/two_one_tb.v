`timescale 1ns/1ns

module two_one_tb;

reg I0, I1;
reg S0;
wire Y;

// Instantiation 
two_one dut(
		.i0(I0),
		.i1(I1),
		.s0(S0),
		.y(Y)
		);

initial 
begin 
// Initialize`
S0 = 0; {I1,I0} = 2'b00;

#100 S0 = 0; {I1,I0} = 2'b11;
#100 S0 = 1; {I1,I0} = 2'b10;
#100 S0 = 0; {I1,I0} = 2'b10;
#100 S0 = 1; {I1,I0} = 2'b01;
#100 S0 = 0; {I1,I0} = 2'b11;
#100 S0 = 1; {I1,I0} = 2'b10;
#100 S0 = 0; {I1,I0} = 2'b01;
end

initial
begin

	#1000 $finish;

end

endmodule
