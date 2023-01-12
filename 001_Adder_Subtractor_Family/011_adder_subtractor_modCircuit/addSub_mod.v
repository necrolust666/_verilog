/*
4-bit
*/

module addSub_mod(	
					input wire [3 : 0]a_in, 
					input wire [3 : 0]b_in,
					input wire cin, k,
					
					output reg [3 : 0]out,	// behavioral - 4bit
					output reg [3 : 0]cout	// during sum, extra bit/carry bit
					);


always@(*)
	begin
		
		case(k)
		
		1'b0:	begin
					// Addition
					{cout,out}	= a_in + b_in + cin;
						// sum will hold 4 bits, cout will hold extra/carry bit
				end
				
		1'b1:	begin
					// Subtraction
					out	=	a_in + ( (~b_in) + cin ); // 2's Compliment O/P
					out =	(~out) + 1;	// BCD 8421 O/P
						// no cout in carry because of subtraction o/p less than 15 for 4 bits 
						
				end
		
		
		default: out = 4'bxxxx;
		
		endcase
	
	end
					
endmodule
