module usrTB;

reg CLK = 0;
reg [1:0]SEL;
reg [3:0]IP;
reg leftS;
reg rightS;

wire [3:0]Q;
wire [3:0]QB;
wire [3:0]OP;


usr dut(
		.clk(CLK),
		.sel(SEL),
		.ip(IP),
		.leftS(leftS),
		.rightS(rightS),
		.q(Q),
		.qb(QB),
		.y(OP)
					);
	// Create Stimulus

always @(posedge CLK)
begin	
	// PIPO Operation
	@(posedge CLK) SEL = 2'b11; IP = 4'b1010;
			

end
	// Clk Generation
	 initial
	 begin		forever	CLK = #5 ~CLK;
	 end


	// Simulation Time
	initial begin
			#2000	$finish;
	end	

endmodule
