module one_two(
		input i,
		input s,
	 	output [1:0]y
		//output reg [1:0]y
		);
wire s_not;

/*
// Gate Level Modelling
not(s_not, s);
and(y[0], s_not, i);
and(y[1], s,	 i);
*/

/*
// Data Flow Modelling
assign y[0] = (i & ~s);
assign y[1] = (i &  s);	
*/

// Conditional Operator
assign y = s?	( {i, 1'b0} )	: ( {1'b0,i} );	

/*
// Behavioral Modelling
always @(s)	
	begin
		case(s)
			1'b0 : y = {~i, i}; // as, y[1] = MSB and y[0] = LSB
			1'b1 : y = {i, ~i};
		endcase
	end
*/

endmodule
