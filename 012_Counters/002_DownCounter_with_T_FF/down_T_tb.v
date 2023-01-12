module down_T_tb;

reg 	RST;
reg 	CLK = 0;
wire 	[3:0]Q;
wire	[3:0]QB;

down_T dut(	//.t(T),
		.clk(CLK),
		.rst(RST),
		.q(Q),
		.qb(QB)		
	);

initial begin 

	// RST Apply
	@(posedge CLK) RST = 1'b0;
 	@(posedge CLK) 
 	@(posedge CLK) RST = 1'b1;

/*	#100
	@(posedge CLK) RST = 1'b0;
	@(posedge CLK) 
	@(posedge CLK) RST = 1'b1;
*/	

	/*
	// T FF Code TB	
	@(posedge CLK)	RST = 1'b0; // RST Applied	
	@(posedge CLK)
	@(posedge CLK)	RST = 1'b1; // RST Removal
			T = 1;
			#10 T = 0;	// HOLD
			#1t T = 1;	// TOGGLE
			#10 T = 0;	// HOLD
		
		#10	RST = 1'b0;	// RST Apply 
	*/

	end

initial begin 	
		forever 
			begin
			#10 CLK = ~CLK;
		       	end	
end	

initial begin
		#500	$finish;
end


endmodule
