module Single_Port_ROM
				// Declaring the Parameters Syntax
				#(
				parameter width = 8,
				parameter depth = 16
				// parameter addr	= $clog2(depth)
				)
				(
				input clk,
				input rst_n,
				input en,
				input [	($clog2(depth) - 1) : 0 ]addr, // [3:0]
				output reg [width-1 : 0]dout
				);
				
// Declare the ROM block
reg [width-1 : 0] rom [0:depth-1];

integer i = 0;

// Default data of the ROM
initial begin
	$readmemh("rom_init.hex", rom, 0, depth-1);
end

always@(posedge clk or negedge rst_n)
	begin
		
		if(!rst_n)
			begin
				for(i=0; i<depth; i = i+1)
					rom[i] = 0;
			end

		else
			begin
					if(en)
					begin
						dout<=rom[addr];	// Enter addr in binary
					end
					
					else dout<=dout;
						
			end
	end


				
endmodule


