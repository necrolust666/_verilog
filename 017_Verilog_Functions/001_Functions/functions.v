module function_ex();

// Name of the function must be the OUTPUT

// Add function - sum 
// adding two 8-bit numbers
// sum has 9 bits, 1 extra for carry bit
function [8:0]sum ( input[7:0]val_a, input[7:0]val_b	);
	begin
			sum = val_a + val_b;
	end
endfunction

// Compare function
function compare(	input [3:0]val_1, [3:0]val_2	);
	begin
			compare = (val_1	==		val_2);
	end
endfunction

// Stimulus

// Variables for Stimulus 

// for Add
reg [7:0]val_a; 
reg [7:0]val_b;	

// for Compare
reg [3:0]val_1; 
reg [3:0]val_2; 

// Initial block starts at 0 nanoseconds and
// goes on for the entire simulation time
initial
	begin
		$monitor(" Time = %d, Sum = %b / Compare O/P? = %b ", $time,			
												   sum(val_a, val_b),
												   compare(val_1, val_2) );
												   
		#1 val_a = 8'b00000011; val_b = 8'b00001100; val_1 = 4'b0000; val_2 = 4'b1111; 	
		#1 val_a = 8'b10000000; val_b = 8'b10000000; val_1 = 4'b1111; val_2 = 4'b1111; 	
	
	end
	
initial
	begin
	
	#500 $finish;
	
	end



endmodule