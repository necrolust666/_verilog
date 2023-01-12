module upDown_T_tb;

reg 	RST;
reg 	CLK = 0;
reg	SEL;	

wire [3:0]Q;
wire [3:0]QB;

upDown_T dut(	//.t(T),
		.clk(CLK),
		.rst(RST),
		.sel(SEL),

		.q(Q),
		.qb(QB)		
	);

initial begin 

	// UP Counter	
	// RST Apply
	@(posedge CLK) SEL = 1'bz; RST = 1'bz;
 	@(posedge CLK) 
 	@(posedge CLK) SEL = 1'b1; RST = 1'b0;
	@(posedge CLK)		   RST = 1'b1;
			       
	#340

	// DOWN Counter	
	@(posedge CLK)     
	@(posedge CLK) SEL = 1'b0; RST = 1'b0;   
	@(posedge CLK) 		   RST = 1'b1;    

	/*
	// T FF Code TB	
	@(posedge CLK)	RST = 1'b0; // RST Applied	
	@(posedge CLK)
	@(posedge CLK)	RST = 1'b1; // RST Removal
			T = 1;
			#10 T = 0;	// HOLD
			#10 T = 1;	// TOGGLE
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
		#750	$finish;
end


endmodule
