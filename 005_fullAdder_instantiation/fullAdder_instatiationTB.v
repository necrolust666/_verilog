/*
	fullAdder_instantiationTB
	for fullAdder
*/

module fullAdder_instantiationTB;

reg A, B, CIN;
wire SUM, COUT;

fullAdder_instantiation dut2(
								.a(A),
								.b(B),
								.cin(CIN),
								.sum(SUM),
								.cout(COUT)
								);
								
				initial begin
				A = 1'b0; B = 1'b0; CIN = 1'b0;
				
				// Delay 100 ns
				#100 				A = 1'b0; B = 1'b0; CIN = 1'b1;
				#100 				A = 1'b0; B = 1'b1; CIN = 1'b0;
				#100 				A = 1'b0; B = 1'b1; CIN = 1'b1;
				#100 				A = 1'b1; B = 1'b0; CIN = 1'b0;
				#100 				A = 1'b1; B = 1'b0; CIN = 1'b1;
				#100 				A = 1'b1; B = 1'b1; CIN = 1'b0;
				#100 				A = 1'b1; B = 1'b1; CIN = 1'b1;
				
				end
				
endmodule

