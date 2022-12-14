module add_sumTB;

reg		A, B, CIN, EN;
wire	SUM, CARRY, DIFF, BURROW;


add_sub dut(	
		.a(A),
		.b(B),
		.cin(CIN),
		.en(EN),
		.sum(SUM),
		.diff(DIFF),
		.carry(CARRY),
		.burrow(BURROW)
		);


initial 
	begin
// Initializing Inputs
			EN	= 1'bx;	A = 1'b0;	B = 1'b0;	CIN = 1'b0;

	// Addition Operation
	#100	EN	= 1'b1;	A = 1'b0;	B = 1'b0;	CIN = 1'b0;
	#100	EN	= 1'b1;	A = 1'b0;	B = 1'b0;	CIN = 1'b1;
	#100	EN	= 1'b1;	A = 1'b0;	B = 1'b1;	CIN = 1'b0;
	#100	EN	= 1'b1;	A = 1'b0;	B = 1'b1;	CIN = 1'b1;
	#100	EN	= 1'b1;	A = 1'b1;	B = 1'b0;	CIN = 1'b0;
	#100	EN	= 1'b1;	A = 1'b1;	B = 1'b0;	CIN = 1'b1;
	#100	EN	= 1'b1;	A = 1'b0;	B = 1'b1;	CIN = 1'b0;
	#100	EN	= 1'b1;	A = 1'b1;	B = 1'b1;	CIN = 1'b1;
	
	// Subtraction Operation
	#100	EN	= 1'b0;	A = 1'b0;	B = 1'b0;	CIN = 1'b0;
	#100	EN	= 1'b0;	A = 1'b0;	B = 1'b0;	CIN = 1'b1;
	#100	EN	= 1'b0;	A = 1'b0;	B = 1'b1;	CIN = 1'b0;
	#100	EN	= 1'b0;	A = 1'b0;	B = 1'b1;	CIN = 1'b1;
	#100	EN	= 1'b0;	A = 1'b1;	B = 1'b0;	CIN = 1'b0;
	#100	EN	= 1'b0;	A = 1'b1;	B = 1'b0;	CIN = 1'b1;
	#100	EN	= 1'b0;	A = 1'b1;	B = 1'b0;	CIN = 1'b0;
	#100	EN	= 1'b0;	A = 1'b1;	B = 1'b1;	CIN = 1'b1;
	
	end
	
endmodule



