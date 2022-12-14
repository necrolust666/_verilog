
module addSub_modTB;

reg [3:0]A_IN, B_IN;
reg K, CIN;

wire [3:0]OUT, COUT;

addSub_mod dut(
				.a_in(A_IN),
				.b_in(B_IN),
				.cin(CIN),
				.k(K),
				.out(OUT),
				.cout(COUT)
				);

initial
	begin
		
		// Initializing I/Ps
			 K = 1'bx; A_IN = 0; B_IN = 0; CIN = 0;
		
		// Addition
		#100 K = 1'b0; A_IN = 4'b0001; B_IN = 4'b0010; CIN = 0;
		#100 K = 1'b0; A_IN = 4'b0011; B_IN = 4'b0101; CIN = 0;		
		#100 K = 1'b0; A_IN = 4'b0101; B_IN = 4'b1001; CIN = 0;

		// Subtraction
		#100 K = 1'b1; A_IN = 4'b0001; B_IN = 4'b0010; CIN = 1;
		#100 K = 1'b1; A_IN = 4'b0011; B_IN = 4'b0101; CIN = 1;		
		#100 K = 1'b1; A_IN = 4'b0101; B_IN = 4'b1001; CIN = 1;
		
	end
		
endmodule
