module seqDet_111_TB;

reg CLK = 0;
reg RST;
reg DIN;

wire DOUT;
wire [1:0]STATE;

seqDet_111 dut(
		
				.clk(CLK),
				.rst(RST),
				.din(DIN),
				.dout(DOUT),
				.state(STATE)
									);

initial 
	begin
		forever	#10	CLK = ~CLK;
	end

initial 
	begin
	
		@(posedge CLK)	RST = 1'b0;	// RST Apply
		@(posedge CLK)	RST = 1'b1; // RST Removal -> s0 state 
		@(posedge CLK)	DIN = 1;	// s1 state
									// s2 state
	end
	
initial 
	begin
		#500 $finish; 
	end

endmodule