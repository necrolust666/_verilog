module dual_port_RAM_TB;

parameter WIDTH 		= 	8;
parameter DEPTH			= 	64;
parameter ADDR_BUS		=	$clog2(DEPTH);	
							// log base2(64) = 6

// Port 1
reg clk_1 = 1'b0;
reg rst_1;

reg we_1;	// IF 	we = 1 : Write Mode		// Write Enable
			// ELSE	we = 0 :  Read Mode

// For Data Writing
reg [	WIDTH-1 	: 0	]din_1;	// 8  Bits

// For Word Selection
reg [	ADDR_BUS-1	: 0	]addr_1;	// 64 Bits

// For Data Output (Reading) TEMPORARY VAR
wire [ WIDTH-1 : 0 ]temp_1;	//  8 Bits

// For Data Output
wire [ WIDTH-1 : 0 ]dout_1;		// 8  Bits

			// Port 2
			reg clk_2 = 1'b0;
			reg rst_2;

			reg we_2;	// IF 	we = 1 : Write Mode		// Write Enable
						// ELSE	we = 0 :  Read Mode

			// For Data Writing
			reg [	WIDTH-1 	: 0	]din_2;	// 8  Bits

			// For Word Selection
			reg [	ADDR_BUS-1	: 0	]addr_2;	// 64 Bits

			// For Data Output (Reading) TEMPORARY VAR
			wire [ WIDTH-1 : 0 ]temp_2;	//  8 Bits

			// For Data Output
			wire [ WIDTH-1 : 0 ]dout_2;		// 8  Bits


single_port_RAM	dut
(
							.clk_1(clk_1),
							.rst_1(rst_1),
							.we_1(we_1),
							.din_1(din_1),
							.addr_1(addr_1),
							.dout_1(dout_1),

							.clk_2(clk_2),
							.rst_2(rst_2),
							.we_2(we_2),
							.din_2(din_2),
							.addr_2(addr_2),
							.dout_2(dout_2)		
);

initial
	begin
	
 	// RST Applied - Port 1
	@(posedge clk_1)	rst_1 = 1'b0;		
	// RST Removal - Port 1
	@(posedge clk_1)	rst_1 = 1'b1;
	// Writing Data	- Port 1
	@(posedge clk_1)	we_1 = 1'b1; addr_1	= 6'b000_000;	din_1 = 8'h11;
	// Reading Data - Port 1
	@(posedge clk_1)	we_1 = 1'b0; addr_1	= 6'b000_000;	din_1 = 8'h11;
	
	end
	
initial	
	begin
/* 	// RST Applied - Port 2
	@(posedge clk_2)	rst_2 = 1'b0;		
	// RST Applied - Port 2
	@(posedge clk_2)	rst_2 = 1'b1; */
	// Writing Data	- Port 2 
	@(posedge clk_2)	we_2 = 1'b1; addr_2	= 6'b000_001;	din_2 = 8'hff;
	// Reading Data - Port 1
	@(posedge clk_2)	we_2 = 1'b0; addr_2	= 6'b000_001;	din_2 = 8'hff;
	
	end
	
	
	
initial 
	begin
		forever
			#10	clk_1 = ~clk_1;
	end

initial 
	begin
		forever	
			#50 clk_2 = ~clk_2;
	end


initial 
	begin
			#2000 $finish;
	end
	
endmodule