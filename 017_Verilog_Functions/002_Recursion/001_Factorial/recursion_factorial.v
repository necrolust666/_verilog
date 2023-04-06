// keyword "automatic" allocates "different storage space" for
// every function call
// Used, in recursion tasks, as every recursion call will require different
// storage space to operate at

module rec_factorial();


 function automatic integer factorial(input integer N);
// integer: because the return type is integer 
// automatic: for recursion-type-operation	- re-entrant 

	integer int_res = 0;		// Variable for intermediate results
		
	begin
		if(N == 0)
			int_res = 1;
			
		else 
			begin int_res = N * factorial(N - 1); end
			// here, "automatic" will be necessary as 
			// different/dynamic storage space will be needed 
			
		// As the function name is the output 
		factorial = int_res;
		
	end
endfunction


// $monitor will display the CHANGES in the block 
// $display will display value everytime when it is called

// Stimulus
integer val = 0;
initial 
	begin
		#1	$monitor("Time = %d;	Factorial Val = %d", $time, factorial(val));
		#1	val = 2;
		#1	val = 5;
	end 
		
	
// Simulation time
initial
	begin
		#500 $finish;
	end

endmodule 

