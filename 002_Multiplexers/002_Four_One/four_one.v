module four_one(
		input [3:0]i,
		input [1:0]s,
		output y
		);

wire [1:0]w;

/*
* 	// Using 2x1 Mux

	two_one m1(i[0], i[1], s[0], w[0]);
	two_one m2(i[2], i[3], s[0], w[1]);

	two_one m3(w[0], w[1], s[1], y);
*/

// Using Dataflow Model
// assign y = 	(~s[1] & ~s[0] & i[0]) | (~s[1] & s[0] & i[1]) | (s[1] & ~s[0] & i[2]) | (s[1] & s[0] & i[3]);

// Dataflow - Conditional Operator
assign y = s[1] ? (s[0]? (i[3]]):(i[2])	)	:	(s[0]?	(i[1]):(i[0])	);	



endmodule



module two_one(i0, i1, s, y);

input i0;
input i1;
input s;

output y;


begin

	assign y = (~s & i0) | (s & i1);

end	

endmodule
