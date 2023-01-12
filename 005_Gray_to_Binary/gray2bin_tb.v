module gray2bin_tb;

reg [3:0]GRAY;
wire [3:0]BIN;

bin2gray dut(
		.bin(BIN),
		.gray(GRAY)
				);
				
initial 
begin


	// Initialize 
		GRAY = 4'b0000;

#100	GRAY = 4'b0000;	
#100	GRAY = 4'b0001;	
#100	GRAY = 4'b0010;	
#100	GRAY = 4'b0011;	
#100	GRAY = 4'b0100;	
#100	GRAY = 4'b0101;	
#100	GRAY = 4'b0110;	
#100	GRAY = 4'b0111;	
#100	GRAY = 4'b1000;	
#100	GRAY = 4'b1001;	
#100	GRAY = 4'b1010;	
#100	GRAY = 4'b1011;	
#100	GRAY = 4'b1100;	
#100	GRAY = 4'b1101; 	
#100	GRAY = 4'b1110;
#100	GRAY = 4'b1111;	

//*/


// User Input 
// $value$plusargs("BIN=%b", BIN);

end 

initial begin #2000 $finish; end

endmodule
