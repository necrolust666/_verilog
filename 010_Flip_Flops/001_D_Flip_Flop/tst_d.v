`timescale 1ns/1ns
module tst_d;

reg	D, RST;
reg	CLK = 0;
wire	Q, QBAR;

//d_ff dut	// Edge Trig
//d_latch dut	// Level Trig
d_ff_async dut
	(
		.d(D),
		.clk(CLK),
		.reset_n(RST),
		.q(Q),
		.qbar(QBAR)		
				);

initial 
	begin
	// Initializing Inputs
	D = 1'b0; RST = 0;
	
	/*
		#10 D = 0; PRST = 0; RST = 0;   
		#10 D = 1; PRST = 0; RST = 0;   
		#10 D = 0; PRST = 0; RST = 0;   
		#10 D = 1; PRST = 0; RST = 0;   
		#10 	   PRST = 0; RST = 0;   
		#10 	   PRST = 0; RST = 0;   
		#10 D = 0; PRST = 0; RST = 0;   
		#10 	   PRST = 0; RST = 0;
	*/	
       		
		#20 
		D = 1; RST = 0;  #55; 
		D = 0; RST = 0;	 #25;
		
		#100
		D = 1; RST = 0;	 #65;
		       RST = 1;	 #25;


		//#50 	   RST = 1;   
		
		//#50 D = 0; RST = 0;   
		
		//#50 D = 1; RST = 0;

		//#50 D = 1; RST = 1;
	  	
	end

	
initial 
	begin
		forever 
			begin
				#50; 	
				CLK = ~CLK;
		end
	end


// Simulation Runtime
initial
	begin
		#500 $finish;		
	end

endmodule
