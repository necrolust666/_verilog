module backdoor_tst;

/*
	It is important to declare the widths for respective data else the data will show "x"
	Try a module with widthLESS. 
*/

// Memory module to access 16x2 or 16x8
parameter widthLESS = 1;
parameter widthBin = 4;
parameter widthHex = 8;
parameter depth = 16;

reg [widthBin-1:0]mem_Bin[0:depth-1];
reg [widthHex-1:0]mem_Hex[0:depth-1];

integer i = 0;

initial 
	begin
	
	// read memory bin/hex into the mem reg - this is equivalent to one time programming by the manufacturer
	// $readmemh("location to file including the file", destination memory, start_addr, stop_addr);
	$readmemb("ex.txt", 	  mem_Bin, 0, depth-1);
	$readmemh("rom_init.hex", mem_Hex, 0, depth-1);	// make the width = 8 bits as hex data A0 = 2 bits
		
		for(i = 0; i<depth; i = i+1)
			begin
				$display("mem_Bin[%0d] = %0b", i, mem_Bin[i]);
				$display("mem_Hex[%0d] = %0x", i, mem_Hex[i]);	
				$display("\n");
			end
		
	// Write the data FROM memory module
	$writememb("fromMemBin.txt", mem_Bin);
	$writememh("fromMemHex.txt", mem_Hex);
	
	end


	
endmodule