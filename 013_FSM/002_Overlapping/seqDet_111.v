// Mealy FSM for 111 Seq Overlapping
// State Sequencer / Output Decoder / Next State Decoder - 1_Process_Methodology 
// Refer to the state diagram (IMP)

module seqDet_111(
					input clk,
					input rst,
					input din,
					
					output reg dout,
					output reg [1:0]state
											);
										
localparam idle = 2'b00,
			s0	= 2'b01,
			s1	= 2'b10,
			s2 	= 2'b11;
		

		
always @(posedge clk)
begin

	if(!rst)
		begin 
			state <= idle;
			dout  <= 1'b0;
		end
		
	else
		begin
			case(state)
			
				idle:	begin 
						dout <= 1'b0;	// Output Decoding
						if(rst)			// If Reset is Removed
							begin 
								state <= s0;	// Next State Decoding
								dout  <= 1'b0;
							end
						
						else
							begin
								state <= idle;	
								dout  <= 1'b0;
							end
						end
						
						
				s0:		begin 
						dout <= 1'b0;	// Output Decoding
						if(din == 1'b1)
							begin 
								state <= s1;	// Next State Decoding
								dout  <= 1'b0;
							end
						
						else
							begin
								state <= s0;	
								dout  <= 1'b0;
							end
						end

				s1:		begin 
						dout <= 1'b0;	// Output Decoding
						if(din == 1'b1)
							begin 
								state <= s2;	// Next State Decoding
								dout  <= 1'b0;
							end
						
						else
							begin
								state <= s0;	
								dout  <= 1'b0;
							end
						end

				s2:		begin 
						dout <= 1'b0;	// Output Decoding
						if(din == 1'b1)
							begin 
								state <= s2;	// Next State Decoding	// OVERLAPPING STEP
								dout  <= 1'b1;
							end
						
						else
							begin
								state <= s0;	
								dout  <= 1'b0;
							end
						end						
			
			endcase
		end
		
end


endmodule