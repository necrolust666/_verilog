module add_sub_min(
					input a, b, cin, en,
					output op1, op2
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

wire l;
assign l = (a^b);

// Minimized Expressions
assign op1 = (a^b^cin); 				// O/P is same irrespective of Sum/Difference

assign op2 = en?	((a&b) | (l&cin))	:	((~a&b)	|	(~l & cin));			
		//	en = 1; carry o/p
		//	en = 0; burrow o/p


endmodule