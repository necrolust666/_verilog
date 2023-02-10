module four_bit_comp(
			input [4:1]a,
			input [4:1]b,
			// output g, e, s,
			output reg g, e, s
						);

// g = greater;	e = equal; s = smaller
// Concept:
/*
a[4] > b[4] 	logic:		a[4] & 	~b[4]
a[4] = b[4]		logic:		a[4] ~^ b[4]
a[4] < b[4]		logic: 		~a[4] &	b[4]
*/



/*
// RTL Modelling
assign g = (a[4] & ~b[4]) + 
	(	(a[4] ~^ b[4]) & (a[3] & ~b[3]) 	) + 
	(	(a[4] ~^ b[4]) & (a[3] ~^ b[3]) & (a[2] & ~a[2])	) +
	(	(a[4] ~^ b[4]) & (a[3] ~^ b[3]) & (a[2] ~^ a[2]) & (a[1] & ~a[1])	);

assign e = (a[4] ~^ b[4]) & (a[3] ~^ b[3]) & (a[2] ~^ b[2]) & (a[1] ~^ b[1]);


assign s = (~a[4] & b[4]) + 
	(	(a[4] ~^ b[4]) & (~a[3] & b[3]) 	) + 
	(	(a[4] ~^ b[4]) & (a[3] ~^ b[3]) & (~a[2] & a[2])	) +
	(	(a[4] ~^ b[4]) & (a[3] ~^ b[3]) & (a[2] ~^ a[2]) & (~a[1] & a[1])	);

*/


// Behavioral Modelling - Best Method
always @(a or b)
	begin
		
		if (a > b)
		begin 
			g <= 1'b1;
			e <= 1'b0;
			s <= 1'b0;	end

		else if (a<b)
		begin

			g <= 1'b0;
			e <= 1'b0;
			s <= 1'b1;	end
		
		else if (a == b)
		begin
			g <= 1'b0;
			e <= 1'b1;
			s <= 1'b0;	end


	end

endmodule
