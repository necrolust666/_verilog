 module siso(
		input clk,
		input reset_n,	// Active Low Reset
		input sdi,	// Serial Data In
		
		// output sdo,	// Serial Data Out - Placed as Continuous statement
		output reg sdo,	// Serial Data Out - Placed in Procedural Block
		
		output reg [3:0]siso_r	
					);

always @(posedge clk or negedge reset_n)
	begin
		if(!reset_n)
		begin	siso_r = 4'b0000;	end

		else
			begin
				
				// Various Shifting Techniques
				
				// 1. 
				// siso_r[3:0]	<=	{siso_r[2:0],sdi};

				// 2.
				// siso_r[3:0]	<=	(siso_r[3:0]<<1)	+ sdi;

				// 3. 
				siso_r[3:0]	<=	siso_r[3:0]<<1;
				siso_r[0]	<=	sdi;
				
				assign sdo	=	siso_r[3];

			end

	end

	// Serially Receiving Output
	// assign sdo	=	siso_r[3];

endmodule
