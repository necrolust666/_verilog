module johnson_Dff_tb;

reg CLK = 0;
reg [3:0]RESET; 
reg [3:0]PRESET;
reg D;

wire [3:0]Q;
wire [3:0]QB;

johnson_Dff dut(
		.clk(CLK),
		.rst(RESET),
		.preset(PRESET),
		.d(D),	
		.q(Q),
		.qb(QB)		);


initial begin	
		// Assigning the Value using Reset and Preset
		// Preset and Reset are active low
		
		// Negedge Preset makes Q  = 1
		// Negedge Reset makes 	Qb = 1
		@(posedge CLK) PRESET = 4'b1110; 
			       RESET  = 4'b0001;

		// Let the Counter RUN - making "q = d" condition
		@(posedge CLK) PRESET = 4'b1111; RESET = 4'b1111;

		// @posegde CLK)		
	
	end


initial begin
	forever #10 CLK = ~CLK;
end

initial begin
	#1000	$finish;
end

endmodule
