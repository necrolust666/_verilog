`include "Single_Port_ROM.v"

module Single_Port_ROM_tb;

parameter WIDTH = 8;
parameter DEPTH = 16;

// Wild-card entry - initialize all ports will DUT-defined names
reg clk = 0;
reg rst_n;
reg en;
reg [ ($clog2(DEPTH) - 1) : 0]addr;
wire [ WIDTH-1 : 0 ]dout;

// Instantiation
Single_Port_ROM #(
		.width(WIDTH),
		.depth(DEPTH)
		 )	// Instantiating paramters with default names
	 dut(.*)	// Instantiating all ports with dut-defined/default	
				// names, WILD-CARD Entry
;

initial 
	begin
		@(posedge clk) 			en = 1; addr = 4'b0000;
		@(posedge clk) 					addr = 4'b0001;		
		@(posedge clk) 					addr = 4'b0010;				
		@(posedge clk) 					addr = 4'b0011;					
	end
	
initial
	begin
		forever
			#50 clk = ~clk;
	end
	
initial 
	begin
			#1000	$finish;
	end



endmodule