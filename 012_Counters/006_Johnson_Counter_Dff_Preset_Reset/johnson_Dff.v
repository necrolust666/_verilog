// Synchronous
// Mod of Johnson Counter is: 2N where, N = number of bits
module johnson_Dff(
			input clk,
			input [3:0]rst,		// Individual FFs Resets
			input [3:0]preset,	// Individual FFs Presets
			input d,

			output [3:0]q,			// Don't use Reg
			output [3:0]qb		);	// Don't use Reg


// Ring FF topology
// d_ff d( clk, rst, preset, d, q, qb );

d_ff d0( clk, rst[3], preset[3], qb[0], q[3], qb[3] );

d_ff d1( clk, rst[2], preset[2], q[3], q[2], qb[2] );
d_ff d2( clk, rst[1], preset[1], q[2], q[1], qb[1] );
d_ff d3( clk, rst[0], preset[0], q[1], q[0], qb[0] );



endmodule



module d_ff(
		input clk,
	       	input rst,
		input preset,
		input d,

		output reg q,
		output reg qb	
								);

always@(posedge clk)
	begin	
		if(!rst)
			begin
				qb	=	 1;
				q	=      ~qb;
			end

		else if(!preset)
			begin
				q	=	 1;
				qb	=	~q;
			end

		else
				q	=	d;	
				qb	=	~q;

	end

endmodule
