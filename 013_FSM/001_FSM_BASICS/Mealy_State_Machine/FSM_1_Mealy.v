// 1-Process Methodology

module FSM_1_Mealy(
				input clk,
				input rst,
				input din,
				
				output reg dout,
				
				// Use only one state for single methodology
				output reg [1:0] state				
											);
localparam idle = 2'b00,
		   s0	= 2'b01,
		   s1	= 2'b10;
 	
	
// 3-Methodologies in one always block	
always @(posedge clk)
begin

	// Reset Logic/State Sequencer
	if(!rst)
		begin 
			state 	<= 	idle;
			dout	<= 	1'b0;
		end
		
	else
		begin
							
				case(state)
				
				idle:	begin
							dout 	<= 	1'b0;		// Output Decode
							state	<= 	s0; 	
						end
						
				s0:		begin
							if(din == 1'b1)
									begin 		
									state	<= 	s1; 
									dout 	<= 	1'b1;
									end
							else
									begin	
									state <= s0;	
									dout  <= 1'b0;
									end				
						end
				
				s1:		begin
							if(din == 1'b1)
								begin 
									state <= s0; 
									dout  <= 1'b0;
								end
							else
								begin
									state <= s1;
									dout  <= 1'b0;
								end
						end		
						
				default 
						begin 
							state <= idle; dout <= 1'b0;	end
				endcase
		end
end

endmodule