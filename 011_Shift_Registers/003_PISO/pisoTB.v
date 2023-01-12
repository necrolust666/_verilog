module pisoTB;

reg CLK = 0, RST_N;
reg [3:0]PDI;
reg SEL;
wire SDO;
wire [3:0]PISO;

piso dut(
		.clk(CLK),
		.reset_n(RST_N),
		.pdi(PDI),
		.sdo(SDO),
		.piso_r(PISO),
		.sel(SEL)		);
		

	// Create Stimulus
	initial begin 
			// Reset Apply 
			RST_N = 1'b0;	PDI = 4'b0000;
			#15 // Delay

			// Reset Removal
			RST_N = 1'b1;	PDI = 4'b0000;
			#15 // Delay

		
		repeat(15)	@(posedge CLK);
		// 1011 in SIPO - STORING DATA
			@(posedge CLK);	SEL = 1; PDI = 4'b1011;

		// ACCESSING DATA
			@(posedge CLK);	SEL = 0;
			@(posedge CLK);	SEL = 0;
			@(posedge CLK);	SEL = 0;
			@(posedge CLK);	SEL = 0;


		#50	RST_N = 0; PDI = 4'b0000;	#100; // Reset Apply 
	end

	// Clk Generation
	 initial
	 begin		forever	CLK = #5 ~CLK;
	 end


	// Simulation Time
	initial begin
			#500	$finish;
	end	


endmodule
