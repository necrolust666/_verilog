module sipoTB;

reg CLK = 0, RST_N, SDI;
wire PDO;
wire [3:0]SIPO;

sipo dut(
		.clk(CLK),
		.reset_n(RST_N),
		.sdi(SDI),
		.pdo(PDO),
		.sipo_r(SIPO)		);
		

	// Create Stimulus
	initial begin 
			// Reset Apply 
			RST_N = 1'b0;	SDI = 0;
			#15 // Delay

			// Reset Removal
			RST_N = 1'b1;	SDI = 0;
			#15 // Delay

		
		repeat(15)	@(posedge CLK);
		// 1011 in SIPO - STORING DATA
			@(posedge CLK);	SDI = 1;
			@(posedge CLK);	SDI = 0;
			@(posedge CLK);	SDI = 1;
			@(posedge CLK);	SDI = 1;

		// ACCESSING DATA
			@(posedge CLK);	SDI = 0;
			//@(posedge CLK);	SDI = 0;
			//@(posedge CLK);	SDI = 0;
			//@(posedge CLK);	SDI = 0;


		#50	RST_N = 0; SDI = 0;	#100; // Reset Apply 
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
