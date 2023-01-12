module usrTB;

reg CLK = 0, RST_N;
reg [3:0]IP;
reg [1:0]SEL;
reg [1:0] SEL_PISO;

wire SISO_BUF;
wire SIPO_BUF;
wire PISO_BUF;
wire [3:0]PIPO_BUF;

wire [3:0]OP;

usr dut(
		.clk(CLK),
		.reset_n(RST_N),
		.sel(SEL),
		.ip(IP),
		.op(OP),
		.siso_buf(SISO_BUF),
		.sipo_buf(SIPO_BUF),
		.piso_buf(PISO_BUF),
		.pipo_buf(PIPO_BUF),
		.sel_piso(SEL_PISO)
					);
	// Create Stimulus
	initial begin

	/*	
			// Reset Apply 
			RST_N = 1'b0;	IP = 4'b0000;
			#15 // Delay

			// Reset Removal
			RST_N = 1'b1;	IP = 4'b0000;
			#15 // Delay

		// SISO CHECK
		// repeat(15)	@(posedge CLK);
		// 1011 in SIPO - STORING DATA
			@(posedge CLK);  SEL = 2'b00;	IP =  	       1'b1;
			@(posedge CLK);			IP = (IP<<1) + 1'b0;
			@(posedge CLK);			IP = (IP<<1) + 1'b1;
			@(posedge CLK);			IP = (IP<<1) + 1'b1;

			// LOW-ing the Signal to Distinguish
			@(posedge CLK);	IP = 1'b0;

		#100	
			// Reset for a while
			RST_N = 1'b0; // Reset Apply	
			#15
			RST_N = 1'b1; // Reset Removal

			// Set Select 

		// SIPO CHECK
		// repeat(15)	@(posedge CLK);
			@(posedge CLK);  SEL = 2'b01;	IP =  	       1'b1;
			@(posedge CLK);			IP = (IP<<1) + 1'b0;
			@(posedge CLK);			IP = (IP<<1) + 1'b1;
			@(posedge CLK);			IP = (IP<<1) + 1'b1;
			
			// LOW-ing the signal to distinguish
			@(posedge CLK);			IP = 1'b0;



		// Reset for a while
			RST_N = 1'b0; // Reset Apply	
			#15
			RST_N = 1'b1; // Reset Removal

		// PISO CHECK
		//
			@(posedge CLK);	SEL = 2'b10; 
			@(posedge CLK);	SEL_PISO = 1'b1; // Load the Data Parallely 
			@(posedge CLK);	IP = 4'b1011;  	 // Insert the Data

			@(posedge CLK);
					// 4 times becase we need to give
					// 4 zeros to completely OUT the 
					// buffer
			@(posedge CLK); SEL_PISO = 1'b0; // Display Data Serially
			@(posedge CLK); SEL_PISO = 1'b0; // Display Data Serially
			@(posedge CLK); SEL_PISO = 1'b0; // Display Data Serially
			@(posedge CLK); SEL_PISO = 1'b0; // Display Data Serially
				
		
	*/
		// Reset for a while
			RST_N = 1'b0; // Reset Apply	
			#15
			RST_N = 1'b1; // Reset Removal

		// PIPO Check
		@(posedge CLK);		SEL = 2'b11;	
		@(posedge CLK);		IP = 4'b1011;
		@(posedge CLK);





		#50	RST_N = 0; IP = 4'b0000;	#100; // Reset Apply 
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
