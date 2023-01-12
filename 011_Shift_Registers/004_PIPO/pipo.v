module pipo(	
		input clk,
		input reset_n,
		input [3:0]pdi,	// Parallel Data Input

		output reg [3:0]pdo // Parallel Data Output
								);
always @(posedge clk or negedge reset_n)
	begin	
		if(!reset_n)
		begin 	
				pdo[3:0] <= 4'b0000; 	
		
		end
	
		else
			begin
				pdo[3:0] <= pdi[3:0]; 
			end
	
	end


endmodule
