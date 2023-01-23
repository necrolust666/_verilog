// 1-Process Methodology

module FSM_1(
				input clk,
				input rst,
				input din,
				
				output reg dout,
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
			state <= idle;
			dout	<= 1'b0;
		end
		
	else
		begin
							
				case(state)
				
				idle:	begin
						dout <= 1'b0;		// Output Decode
							if(din == 1'b1)
								begin state <= s0; end
							else
								state <= idle;
						end
						
				s0:		begin
						dout <= 1'b0;		// Output Decode
							if(din == 1'b1)
								begin state <= s1; 
									  dout 	<= 1'b1;	end
							else
								state <= s0;				
						end
				
				s1:		begin
						dout <= 1'b1;		// Output Decode
							if(din == 1'b1)
								begin state <= s0; 
									  dout 	<= 1'b0;	end
							else
								state <= s1;				
						end		
						
				default state = idle;
				
				endcase
		end
end

endmodule