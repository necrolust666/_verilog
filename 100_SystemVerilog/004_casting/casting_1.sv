module tb;

typedef enum {Red, Green, Blue} colour;	// colour is a datatype, enum is used to define
int i;
real r;

/* // create a variable of colour datatype
colour c1 = 2; // Here we assigned a out of the box CASTING,
			   // the tool (questa) MAYBE "implicitly" cause CASTING	
			   // though it a not allowed in SystemVerilog
 */
// Hence, we perform CASTING (using color datatype)
colour c1 = colour'(2);


initial
	begin
	
	i = real '(2.34	);

	
		$display(" c1 	= %s ", c1.name);	
		$display(" i 	= %f ", i);	
		
	end
	
initial
	begin
	
		#1000	$finish;
	end
	

endmodule