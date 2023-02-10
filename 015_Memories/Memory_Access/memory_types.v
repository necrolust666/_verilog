/* */

module memory_types();

// Declaring a Bus/Vector
reg [7:0] bus;

// Declaring a Memory Block
reg [7:0] mem [3:0];

// Declaring another Memory Block
parameter addr	= 4;	// 4-bits
parameter depth = 2**addr;		// 16-bits

reg [3:0] mem2 [ (depth-1) :0];	// 16x4 memory block

integer i;

initial
	begin
	
/*	// Bus
	bus = 8'b10101010;
	$display("bus1:	%b", bus);
	bus[3] = 0;
	$display("bus1:	%b", bus); */
	
	// 1. Memory	- Accessing the entire word (by Depth Number)
	mem[0]= 8'hff;
	mem[1]= 8'haf;
	mem[2]= 8'hbf;
	mem[3]= 8'hcf;

	mem[0]= 8'hff;
	mem[1]= 8'hff;
	mem[2]= 8'hff;
	mem[3]= 8'hff;

	// 2. Memory	- Accessing by the Row X Column Syntax
	// mem[row][column]
		mem  [0][0] = 1'b0;
		mem  [1][2] = 1'b0;
		mem  [2][3] = 1'b0;
		mem  [3][4] = 1'b0;

/* 	for(i = 0; i<4; i = i+1)
	begin
	$display("mem[%0d] = %b", i, mem[i]);	
						// 0 here means 0 gap in result
	end */
		
	// 3. Accessing the memory element using 4-bit address instead
	// Accessing the 10th Word using 4-bit address 
	mem2[4'b1010] = 4'b1111;
	$display("mem2 = %0b", mem2[4'b0000]);
		
		
 	for(i = 0; i<= (depth - 1) ; i = i+1)
		begin
		$display("mem[%0d] = %b", i, mem2[i]);	
							// 0 here means 0 gap in result
		end 
	
	

	
	end

endmodule