	// Single Port Ram
// Geometry: 64 x 8
// 64 Depth
//  8 Size

// General Code 

module async_single_port_RAM(	clk, rst, din, addr, we, dout);

parameter WIDTH 		= 	8;
parameter DEPTH			= 	64;
parameter ADDR_BUS		=	$clog2(DEPTH);	// log base2(64) = 6

input clk;
input rst;

input we;	// IF 	we = 1 : Write Mode		// Write Enable
			// ELSE	we = 0 :  Read Mode

// For Data Writing
input [	WIDTH-1 	: 0	]din;	// 8  Bits

// For Word Selection
input [	ADDR_BUS-1	: 0	]addr;	// 64 Bits

// For Data Output (Reading) TEMPORARY VAR
reg [ WIDTH-1 : 0 ]temp;	//  8 Bits

// For Data Output
output [ WIDTH-1 : 0 ]dout;		// 8  Bits

integer i = 0;

// Defining the memory block
reg [ WIDTH-1 : 0 ] mem [ DEPTH-1 : 0 ];

always @(negedge rst)
begin

	if(!rst)			// Must reset every block and remove exisiting value
		begin
				for(i = 0; i< (DEPTH - 1); i = i+ 1)
					begin
						// Access every memory addresses - word
						mem[i] <= 8'h00;
					end
					
				// Also for temp var
				temp <= 8'h00;
		end
end


always @(din or we or addr)
		begin
				if(we == 1'b1)
					begin
						mem[addr] <= din;	// Write Operation
					end
		end

always @(!we or addr)
		begin
				if(we == 1'b0)
					begin
						temp <= mem[addr];	// Read Operation
					end
		end
	


// Directly assign output
assign dout = temp;

// Why did we use temp (temporary variable) instead of dout 
// at the above procedural block? 

// Because, dout is wire type, can't work inside procedural block
//	Also,	dout is parallel output, directly in the next clk cycle.

	
endmodule