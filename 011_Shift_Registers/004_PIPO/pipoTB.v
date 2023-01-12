module pipoTB;

reg CLK = 0, RST_N;
reg [3:0]PDI;

wire [3:0]PDO;

pipo dut(
		.clk(CLK),
		.reset_n(RST_N),
		.pdi(PDI),
		.pdo(PDO)
					);
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
			@(posedge CLK);	PDI = 4'b1011;

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
