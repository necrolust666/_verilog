// Single Port Ram
// Geometry: 64 x 8
// 64 Depth (Rows)
//  8 Size/Width (Columns)

// General Code 

module single_port_RAM(	clk, rst, din, addr, we, dout);

parameter WIDTH 		= 	8;
parameter DEPTH			= 	64;
parameter ADDR_BUS		=	$clog2(DEPTH);	// log base2(64) = 6

input clk;
input rst;

input we;	// IF 	we = 1 : Write Mode		// Write Enable
			// ELSE	we = 0 :  Read Mode

// For Data Writing/Input
input [	WIDTH-1 	: 0	]din;	// 8  Bits

// For Word Selection
input [	ADDR_BUS-1	: 0	]addr;	// 6 Bits (Decoder Input)

// For Data Output (Reading) TEMPORARY VAR
reg [ WIDTH-1 : 0 ]temp;	//  8 Bits

// For Data Output (Actual Output)
output [ WIDTH-1 : 0 ]dout;		// 8  Bits

integer i = 0;

// Defining the memory block
reg [ WIDTH-1 : 0 ] mem [ DEPTH-1 : 0 ];

always @(posedge clk)
begin

	if(!rst)			// Must reset every block and remove exisiting value
		begin
				for(i = 0; i< (DEPTH - 1); i = i+ 1)
					begin
						// Access every memory addresses - word/depth
						mem[i] <= 8'h00;
					end
					
				// Also for temp var
				temp <= 8'h00;
		end

	
	else
		begin
				if(we == 1'b1)
					begin
						mem[addr] <= din;	// Write Operation
					end
				
				else if(we == 1'b0)
					begin
						temp <= mem[addr];	// Read Operation
					end
		end
	
end

// Directly assign output // Parallel Assignment
assign dout = temp;

// Why did we use temp (temporary variable) instead of dout 
// at the above procedural block? 

// Because, dout is wire type, can't work inside procedural block
//	Also,	dout is parallel output, directly in the next clk cycle.

	
endmodule