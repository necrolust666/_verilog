module d_ff_async(
			input clk,
			input reset_n,
			input d,

			output reg q,
			output reg qbar
						);

// Asynchronous Reset
always @(posedge clk or posedge reset_n)
	begin

	if(reset_n)
	begin
		q	=	1'b0;
		qbar	=	~q;
	end

	else
	begin
		q	=	d;
		qbar	=	~q;
	end

	end
					
endmodule
