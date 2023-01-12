module d_latch(
		// Synchronous Inputs
		input	d,
		input clk, // Actually ENABLE

		// Reset Input
		input reset,	// Clear

		output	reg q,
		output	reg qbar
					);

// DUT

// Level Sensitive/Triggered Synchronous Flop
always @(clk or reset)

	if(reset)
		begin
		q	=	1'b0;
		qbar	=	~q;
		end

	else
		begin
		q	= 	d;	// Characterisic Equation
		qbar	<= 	~q;
		end
	
endmodule
