module one_four(
		input  i,
		input  [1:0]s,
		output reg [3:0]y
		// output [3:0]y	
					);

wire s1_not;
wire s0_not;

/*
// Gate Level Modelling 
not(s1_not, s[1]);
not(s0_not, s[0]);

and(y[0], s1_not, s0_not, i);
and(y[1], s1_not, s[0], i);
and(y[2], s[1], s0_not, i);
and(y[3], s[1], s[0], i);
*/

// Conditional Operator 	
//assign y = s[1]?	( s[0]?( {i, 3'b000} ):({1'b0, i, 2'b00}) ) : ( s[0]?({2'b00,i,1'b0}):({3'b000,i}) ) ;

// Behavioral Modelling

always @(s)
	begin
	case(s)
		2'b00: y = {3'b000, i};	
		2'b01: y = {2'b00, i, 1'b0};	
		2'b10: y = {1'b0, i, 2'b00};	
		2'b11: y = {i, 3'b000};	
	endcase 
	end

endmodule
