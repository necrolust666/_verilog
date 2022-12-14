/*

*/

module fullSubtractorTB;

reg A_FA, B_FA, Bur_FA;
wire DIFF_FA, BURROW_FA;

// Module Instantiation
fullSubtractor dut(
				.a_fa(A_FA), 
				.b_fa(B_FA), 
				.bur_fa(Bur_FA),
				
				.difference_fa(DIFF_FA), 
				.burrow_fa(BURROW_FA)
			  );
				
// Stimulus
		// Initializing Values 
		
		initial
			begin
		
					 A_FA = 1'b0; B_FA = 1'b0; Bur_FA = 1'b0;
				
				#100 A_FA = 1'b0; B_FA = 1'b0; Bur_FA = 1'b1;
				#100 A_FA = 1'b0; B_FA = 1'b1; Bur_FA = 1'b0;
				#100 A_FA = 1'b0; B_FA = 1'b1; Bur_FA = 1'b1;
				#100 A_FA = 1'b1; B_FA = 1'b0; Bur_FA = 1'b0;
				#100 A_FA = 1'b1; B_FA = 1'b0; Bur_FA = 1'b1;
				#100 A_FA = 1'b1; B_FA = 1'b1; Bur_FA = 1'b0;
				#100 A_FA = 1'b1; B_FA = 1'b1; Bur_FA = 1'b1;
			end
endmodule