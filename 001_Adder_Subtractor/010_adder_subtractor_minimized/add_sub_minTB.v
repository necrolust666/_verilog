
module add_sub_minTB;

reg		A, B, CIN, EN;
wire	OP1, OP2;


add_sub_min dut(	
		.a(A),
		.b(B),
		.cin(CIN),
		.en(EN),
		.op1(OP1),
		.op2(OP2)
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



