/* 
*/

module two_one(	
		input i0, 
		input i1, 
		input s0,
		
		// input [1:0]i,
		//output y,
		output reg y // for behavorial
	);

wire [1:0]w;
wire s0_not;

/*

// Gate Level
not(s0_not, s0);

and(w[0], i0, s0_not);
and(w[1], i1, s0);

or(y, w[0],w[1]);

*/

// RTL/Dataflow Model
// assign y = (~s0&i0) | (s0&i1); 

// Behavioral Modelling

always @(*)
begin 
		
		case(s0)
			1'b0:	y = i0;
			1'b1:	y = i1;
		endcase
end


endmodule
