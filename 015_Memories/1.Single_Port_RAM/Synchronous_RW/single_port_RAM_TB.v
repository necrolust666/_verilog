module single_port_RAM_TB;

parameter WIDTH 		= 	8;
parameter DEPTH			= 	64;
parameter ADDR_BUS		=	$clog2(DEPTH);	
							// log base2(64) = 6

reg clk = 1'b0;
reg rst;

reg we;	// IF 	we = 1 : Write Mode		// Write Enable
			// ELSE	we = 0 :  Read Mode

// For Data Writing
reg [	WIDTH-1 	: 0	]din;	// 8  Bits

// For Word Selection
reg [	ADDR_BUS-1	: 0	]addr;	// 64 Bits

// For Data Output (Reading) TEMPORARY VAR
wire [ WIDTH-1 : 0 ]temp;	//  8 Bits

// For Data Output
wire [ WIDTH-1 : 0 ]dout;		// 8  Bits

single_port_RAM	dut(
							.clk(clk),
							.rst(rst),
							.we(we),
							.din(din),
							.addr(addr),
							.dout(dout)
);

initial
	begin
	
 	// RST Applied
	@(posedge clk)	rst = 1'b0;		
	
	// RST Removal
	@(posedge clk)	rst = 1'b1;
	
	// Writing Data
	// @(posedge clk)	we = 1'b1; addr = 6'h01;	din = 8'h0F;

	@(posedge clk)	we = 1'b1; addr	= 6'b000001;	din = 8'h11;
	@(posedge clk)	we = 1'b1; addr	= 6'b000010;	din = 8'h22;
	@(posedge clk)	we = 1'b1; addr	= 6'b000100;	din = 8'h33;
	@(posedge clk)	we = 1'b1; addr	= 6'b001000;	din = 8'h44;
	
	@(posedge clk)	we = 1'b1; addr	= 6'b001001;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b001010;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b001011;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b001100;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b001101;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b001110;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b001111;	din = 8'h44;
	
	@(posedge clk)	we = 1'b1; addr	= 6'b010000;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b010001;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b010010;	din = 8'h44;									
	@(posedge clk)	we = 1'b1; addr	= 6'b010011;	din = 8'h44;
	
	@(posedge clk)	we = 1'b1; addr	= 6'b10_0000;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b10_0001;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b10_0010;	din = 8'h44;

				
	@(posedge clk)	we = 1'b1; addr	= 6'b010000;	din = 8'h55;
	@(posedge clk)	we = 1'b1; addr	= 6'b010001;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b010010;	din = 8'h44;
	@(posedge clk)	we = 1'b1; addr	= 6'b010011;	din = 8'h44;
	
	@(posedge clk)	we = 1'b1; addr	= 6'b100000;	din = 8'h66;
		

		
	// Reading Data
	// @(posedge clk)	we = 1'b0; 
	
	// from same memory locations
	@(posedge clk)	we = 1'b0; 	addr	= 6'b000001;	
	@(posedge clk)				addr	= 6'b000010;	
	@(posedge clk)				addr	= 6'b000100;	
	@(posedge clk)				addr	= 6'b001000;	
	@(posedge clk)				addr	= 6'b010000;	
	@(posedge clk)				addr	= 6'b100000;	
	
	end
	
	
	
initial 
	begin
		forever
			#10	clk = ~clk;
	end

initial 
	begin
			#2000 $finish;
	end
	
endmodule