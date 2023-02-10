module string_();

// Declare the String Reg
// Syntax:	reg [8*n : 0]name;	// n = no. of bits
								// 8 = each character is 8 ASCII bits 

reg [8*6 : 0]s	 = "Mohor";

initial 
	begin
	
	$display("string = %s", s);
	
	end

initial	begin
	#1000 $finish;
end

endmodule