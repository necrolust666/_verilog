
module fullAdderTB;

// Data Type Declaration
reg VAL1, VAL2, CIN;
wire SUM, COUT;

// Instantiation of DUT/UUT
fullAdder dut(
		.val1(VAL1),
		.val2(VAL2),
		.cin(CIN),
		.sum(SUM),
		.cout(COUT)
		);
		
	initial begin
		
		// Initialize Inputs
		 VAL1 = 1'b0; VAL2 = 1'b0; CIN = 1'b0;
		
		// Wait 100ns for global reset to finish
		#100 VAL1 = 1'b0; VAL2 = 1'b0; CIN = 1'b1;
		#100 VAL1 = 1'b0; VAL2 = 1'b1; CIN = 1'b0;
		#100 VAL1 = 1'b0; VAL2 = 1'b1; CIN = 1'b1;
		#100 VAL1 = 1'b1; VAL2 = 1'b0; CIN = 1'b0;
		#100 VAL1 = 1'b1; VAL2 = 1'b0; CIN = 1'b1;
		#100 VAL1 = 1'b1; VAL2 = 1'b1; CIN = 1'b0;
		#100 VAL1 = 1'b1; VAL2 = 1'b1; CIN = 1'b1;
		
	end

endmodule 

