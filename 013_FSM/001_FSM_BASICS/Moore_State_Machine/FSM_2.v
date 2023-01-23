// 2-process methodology
// Here, we have 2 different blocks:
//		- State Sequencer/Reset logic
//		- Output Decoder + Next State Decoder

module FSM_2(
			input 	clk,
			input	rst,
			input	din,	// Data Input
			
			output	reg dout,

			// Debugging Purpose
			output	reg [1:0] p_state,	// Present state
			output	reg [1:0] n_state	// Next State	
			);
		
// Define states	
localparam	idle = 2'b00,			
			s0	 = 2'b01,
			s1	 = 2'b10;
			
// reg [1:0] p_state;	// Present state
// reg [1:0] n_state;	// Next State
			
// 2-process methodology

// 1. State Sequencer/Reset Logic - Sequential Logic
always @(posedge clk)
	begin
	
		if(!rst)
		begin
				// Negedge Reset
			p_state <= idle;
		end
		
		else
			p_state <= n_state;	
	end
	

// 2. Output Decoder + Next State Decoder - Combinational Logic 
always @(p_state, din)
	begin
			
		case(p_state)
			
			idle:	
					begin		 // Next State Decoder
					dout = 1'b0; // Output Sequencer/Reset Logic

						if(!rst)
								begin	n_state = idle;	end
						
						else
								begin	n_state = s0;	end
					end
				
			s0:		
					begin	// Next State Decoder
					dout = 1'b0; // Output Sequencer/Reset Logic
						
						if(din == 1'b1)
								begin	n_state = s1;	end
					
						else
								begin	n_state = s0;	end
					end
					
			s1:		
					begin	// Next State Decoder
					dout = 1'b1; // Output Sequencer/Reset Logic					
						
						if(din == 1'b1)
								begin	n_state = s0;	end
								
						else
								begin	n_state = s1;	end	
								
			
					end
			
			default n_state = idle;
			
		endcase
	
	end


endmodule