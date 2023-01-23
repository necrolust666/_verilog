module string_();

// Declare the String Reg
// Syntax:	reg [8*n : 0]name;	// n = no. of bits
								// 8 = each character is 8 ASCII bits 

reg [8*10 : 0]s	 = "Subharshi";

initial 
	begin
	
	$display("string = %s", s);
	
	end

endmodule