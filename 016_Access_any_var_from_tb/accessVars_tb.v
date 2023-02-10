//	`include "vars.v"

module accessVars;

wire [3:0] OP;

// Instantiation
vars dut(	.op(OP)		);

initial 
	begin
	
		// Accessing DUT's register
		dut.val = 3'b1100;
	
	end

initial	
	begin
		#100 $finish;
	end

endmodule