// In Mealy machine; Output = function of(Present Input + Present State)
//	So, we design the Output Decoder basing upon it.
 
// 3-process methodology
// Here, we have 3 different blocks:
//		- State Sequencer/Reset logic
//		- Output Decoder
//		- Next State Decoder

module FSM_3_Mealy(
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
			
// FSM requires three major procedures (3-process methodology)

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
	
// 2. Output Decoder - Combinational Logic 
always @(p_state, din)
	begin
		case(p_state)
		
			idle:	
					begin	
						dout = 1'b0;
					end
			s0:		
				begin 
					if(din == 1'b1)				// When at s0, it checks for din, as in Mealy machine; Output = function of(Present Input + Present State)
						dout = 1'b1;	
					else
						dout = 1'b0;
				end
			
			s1:	
				begin
					if(din == 1'b1)
						dout = 1'b0;		    // When at s1, it checks for din, as in Mealy machine; Output = function of(Present Input + Present State)
					else
						dout = 1'b0;
				end
				
			default dout = 1'b0;		
		endcase
	end

// 3. Next State Decoder - Combinational Logic // State transition is simiar as Moore
always @(p_state, din)
	begin
			
		case(p_state)
			
			idle:	begin
						if(!rst)
								begin	n_state = idle;	end
						
						else
								begin	n_state = s0;	end
					end
				
			s0:		begin
						if(din == 1'b1)
								begin	n_state = s1;	end
					
						else
								begin	n_state = s0;	end
					end
					
			s1:		begin
						if(din == 1'b1)
								begin	n_state = s0;	end
								
						else
								begin	n_state = 0;	end	
								
			
					end
			
			default n_state = idle;
			
		endcase
	
	end


endmodule