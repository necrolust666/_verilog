module sipo(
		input clk,
		input reset_n,	// Active Low Reset
		input sdi,	// Serial Data In

		output pdo,	// Parallel Data Out
		
		output reg [3:0]sipo_r	
					);

always @(posedge clk or negedge reset_n)
	begin
		if(!reset_n)
		begin	sipo_r = 4'b0000;	end

		else
			begin
				
				// Various Shifting Techniques
				
				// 1. 
				// sipo_r[3:0]	<=	{sipo_r[2:0],sdi};

				// 2.
				// sipo_r[3:0]	<=	(sipo_r[3:0]<<1)	+ sdi;

				// 3. 
				sipo_r[3:0]	<=	sipo_r[3:0]<<1;
				sipo_r[0]	<=	sdi;
								


			end

	end

	// Parallelly Receiving Output
	assign pdo	=	sipo_r;

endmodule
