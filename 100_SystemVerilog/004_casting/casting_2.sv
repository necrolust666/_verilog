module tb;

// Creating a datatype - nibble
typedef bit[3:0] nibble;		// bit is to create the definition of nibble
typedef enum {Red, Green, Blue} colour;	// colour is a datatype, enum is used to define

// create a variable of nibble datatype
nibble var1 = 4'b1011;

// create a variable of colour datatype
colour c1 = Red;

initial
	begin
	
		$display(" var1 = %b ", var1);
		$display(" c1 	= %s ", c1);	
	
	end
	
initial
	begin
	
		#1000	$finish;
	end
	

endmodule