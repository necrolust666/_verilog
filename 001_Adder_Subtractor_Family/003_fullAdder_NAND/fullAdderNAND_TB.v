/* 
fullAdderNAND_TB
*/

module fullAdderNAND_TB;

reg A, B, CIN;
wire SUM, CARRY;

// Instantiation
fullAdderNAND dut(
					.a(A),
					.b(B),
					.cin(CIN),
					.sum(SUM),
					.cout(COUT)
					);

	initial begin
			
			// Initialize IPs
			A = 1'b0; B = 1'b0; CIN = 1'b0;
			
			
			// Wait 100ns for global reset to finish
			#100 A = 1'b0; B = 1'b0; CIN = 1'b1;
			#100 A = 1'b0; B = 1'b1; CIN = 1'b0;
			#100 A = 1'b0; B = 1'b1; CIN = 1'b1;
			#100 A = 1'b1; B = 1'b0; CIN = 1'b0;
			#100 A = 1'b1; B = 1'b0; CIN = 1'b1;
			#100 A = 1'b1; B = 1'b1; CIN = 1'b0;
			#100 A = 1'b1; B = 1'b1; CIN = 1'b1;	
		
	end	

endmodule 