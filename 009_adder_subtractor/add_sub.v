module add_sub(
		input a, b, cin, en,
		output sum, carry, diff, burrow
		);

// en = 1; Addition;
// en = 0; Subtraction;

// Dataflow Modelling

/*
// Sum 
assign sum	=	a^b^cin;
assign carry	=	(a&b) | ((a^b)&cin);

// Difference
assign diff	=	a^b^cin;
assign burrow	=	(~a & b) | (~(a^b) & cin);		
*/

// Conditional Operators
assign sum 	=	en?	(a^b^cin):(1'bx);
assign diff	=	en?	(1'bx):(a^b^cin);

assign carry	=	en?	( (a&b)|((a^b)&cin) ) : (1'bx);
assign burrow	=	en?	(1'bx)		      : ( (~a&b) | cin&(~(a^b) ));


endmodule


