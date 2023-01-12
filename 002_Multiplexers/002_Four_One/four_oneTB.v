`timescale 1ns/1ns

module four_oneTb;

reg [1:0]S;
reg [3:0]I;

wire Y;

// Instantiate
four_one dut(
		// For 2x1 Check
		/*
		.i0(I[0]),
		.i1(I[1]),
		.s(S),
		.y(Y)
		*/

	       I,
	       S,
	       Y	);

initial

begin
	// Initialize
	S[0] = 0; S[1] = 0; I = 4'b0000;

	#100	S = 2'b00; I = 4'b1010;
	#100	S = 2'b01; I = 4'b0101;
	#100	S = 2'b10; I = 4'b0110;
	#100	S = 2'b11; I = 4'b1001;
	#100	S = 2'b00; I = 4'b1001;
	#100	S = 2'b01; I = 4'b0110;
	#100	S = 2'b10; I = 4'b1100;
	#100	S = 2'b11; I = 4'b0011;
	#100	S = 2'b00; I = 4'b0101;
	#100	S = 2'b01; I = 4'b1010;
	#100	S = 2'b10; I = 4'b1101;
	#100	S = 2'b11; I = 4'b0010;
	#100	S = 2'b00; I = 4'b1100;
	#100	S = 2'b01; I = 4'b1110;
	#100	S = 2'b10; I = 4'b1000;
	#100	S = 2'b11; I = 4'b0001;

















	/*
	// Initialize 
	S = 0; I = 2'b00;
	
	#100	S = 1; I = 2'b01; 
	#100	S = 0; I = 2'b01; 
	#100	S = 1; I = 2'b01; 
	#100	S = 0; I = 2'b01; 
	#100	S = 1; I = 2'b01; 
	#100	S = 0; I = 2'b01; 
	#100	S = 1; I = 2'b01; 
	#100	S = 0; I = 2'b01;
       */


end

initial 
begin 
	#3000 $finish;
end

endmodule
