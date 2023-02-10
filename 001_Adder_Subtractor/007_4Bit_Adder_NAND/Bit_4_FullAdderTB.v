
/* 
fullAdderNAND_TB
*/

module fullAdderNAND_TB;

reg [3:0]A;
reg [3:0]B;
reg [3:0]CIN;

wire [3:0]SUM;
wire CARRY;

// Instantiation
Bit_4_FullAdder dut(
					.a_fa(A),
					.b_fa(B),
					.c_fa(CIN),
					.sum_fa(SUM),
					.cout_fa(CARRY)
					);

	initial begin
			
			// Initialize IPs
			#100 A = 4'b1011; B = 4'b0111; CIN = 4'b0000;
			
			// Wait 100ns for global reset to finish
			// #100 A = 4'b0011; B = 4'b0011; CIN = 4'b0000;

		
	end	

endmodule 
