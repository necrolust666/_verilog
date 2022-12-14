/*
for half adder
*/

module fullAdder_instantiationTB_HA;

reg A, B;
wire SUM, COUT;

halfAdder dut(
					.a(A),
					.b(B),
					.sum(SUM),
					.cout(COUT)
				 );
				 
		
		initial begin
		
		// Initializer IPs
		A = 1'b0; B = 1'b0;

		// Wait 100ns for global reset to finish		
		#100 		A = 1'b0; B = 1'b1;
		#100 		A = 1'b1; B = 1'b0;
		#100 		A = 1'b1; B = 1'b1;
		
		end 
		
endmodule

