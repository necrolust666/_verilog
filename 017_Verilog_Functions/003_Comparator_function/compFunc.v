// 4-bit comparator using FUNCTION

module compFunc

	#(parameter busWidth = 4)
	
	(
		input [ (busWidth - 1)	: 0]a, 
		input [ (busWidth - 1)	: 0]b,
		output reg [3:1] op
	);
	
function integer comparator(input [ (busWidth - 1)	: 0]a,
								input [ (busWidth - 1)	: 0]b
								);
reg greaterThan;
	reg equalTo;
	reg lessThan;
	
begin
	greaterThan = (a >  b);	// 100
	equalTo		= (a == b); // 010
	lessThan	= (a <  b); // 001
	
	// Concatenating Output as one hot encoded o/p
	comparator = {greaterThan,	equalTo,	lessThan};
end
endfunction
	
// Combinational circuit
always	@(*)
	begin
		
		op = comparator(a, b);
		
	end
	
endmodule