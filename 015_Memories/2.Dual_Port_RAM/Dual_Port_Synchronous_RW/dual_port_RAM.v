// Single Port Ram
// Geometry: 64 x 8
// 64 Depth
//  8 Size

// General Code 

module dual_port_RAM(	clk_1, 
						rst_1, 
						din_1, 
						addr_1, 
						we_1, 
						dout_1,
						
						clk_2, 
						rst_2, 
						din_2, 
						addr_2, 
						we_2, 
						dout_2	);  

parameter WIDTH 		= 	8;
parameter DEPTH			= 	64;
parameter ADDR_BUS		=	$clog2(DEPTH);	// log base2(64) = 6

input clk_1, clk_2;
input rst_1, rst_2;

input we_1, we_2;	// IF 	we = 1 : Write Mode		// Write Enable
					// ELSE	we = 0 :  Read Mode


// Port 1 Variables
// For Data Writing
input [	WIDTH-1 	: 0	]din_1;	// 8  Bits

// For Word Selection
input [	ADDR_BUS-1	: 0	]addr_1;	// 64 Bits

// PORT 1 - For Data Output (Reading) TEMPORARY VAR
reg [ WIDTH-1 : 0 ]temp_1;	//  8 Bits

// For Data Output - PORT 1
output [ WIDTH-1 : 0 ]dout_1;		// 8  Bits

integer i1 = 0;


				// Port 2 Variables 
				input [	WIDTH-1 	: 0	]din_2;	// 8  Bits

				// For Word Selection
				input [	ADDR_BUS-1	: 0	]addr_2;	// 64 Bits

				// PORT 1 - For Data Output (Reading) TEMPORARY VAR
				reg [ WIDTH-1 : 0 ]temp_2;	//  8 Bits

				// For Data Output - PORT 2
				output [ WIDTH-1 : 0 ]dout_2;		// 8  Bits

				integer i2 = 0;

// Defining the memory block
reg [ WIDTH-1 : 0 ] mem [ DEPTH-1 : 0 ];


// PORT 1
always @(posedge clk_1)
begin

	if(!rst_1)			// Must reset every block and remove exisiting value
		begin
				for(i1= 0; i1< (DEPTH - 1); i1 = i1+ 1)
					begin
						// Access every memory addresses - word
						mem[i1] <= 8'h00;
					end
					
				// Also for temp var
				temp_1 <= 8'h00;
		end

	
	else
		begin
				if(we_1 == 1'b1)
					begin
						mem[addr_1] <= din_1;	// Write Operation
					end
				
				else if(we_1 == 1'b0)
					begin
						temp_1 <= mem[addr_1];	// Read Operation
					end
		end
	
end

// PORT 2
always @(posedge clk_2)
begin

	if(!rst_2)			// Must reset every block and remove exisiting value
		begin
				for(i2 = 0; i2< (DEPTH - 1); i2 = i2+ 1)
					begin
						// Access every memory addresses - word
						mem[i2] <= 8'h00;
					end
					
				// Also for temp var
				temp_2 <= 8'h00;
		end

	
	else
		begin
				if(we_2 == 1'b1)
					begin
						mem[addr_2] <= din_2;	// Write Operation
					end
				
				else if(we_2 == 1'b0)
					begin
						temp_2 <= mem[addr_2];	// Read Operation
					end
		end
	
end


// Directly assign output - Port 1
assign dout_1 = temp_1;

// Directly assign output - Port 2
assign dout_2 = temp_2;



// Why did we use temp (temporary variable) instead of dout 
// at the above procedural block? 

// Because, dout is wire type, can't work inside procedural block
//	Also,	dout is parallel output, directly in the next clk cycle.

	
endmodule