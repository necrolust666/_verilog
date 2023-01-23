module FSM_TB_1_Mealy;

reg CLK = 0;
reg RST;
reg DIN;

wire DOUT;

// States
wire [1:0] State;
// Instantiation
FSM_1_Mealy	dut(
		.clk(CLK),
		.rst(RST),
		.din(DIN),
		.dout(DOUT),
		.state(State)							);
						
// Stimulus 
initial 
	begin

// Reset condition
@(posedge CLK) RST = 0;	DIN = 1;		 // IDLE STATE

// Reset Removal / Apply value 0
@(posedge CLK) RST = 1;					 // s0 state
										 // s1 state at next posedge clk

// Reset Removal / Apply value 1
// @(posedge CLK) RST = 1;	DIN = 1; // s1 STATE
// @(posedge CLK)			DIN = 0; // s1 STATE - stays

// @(posedge CLK) 					 // s1 STATE

// As output is 1 at state s1, so fluctuation between
// s0 and s1 state will toggle 1 and 0 i.e. square wave train

	end
	
// Clock Generation
initial 
	begin
		forever #10 CLK = ~CLK;
	end

// Simulation Timing
initial 
	begin
		#1000	$finish;
	end

endmodule
