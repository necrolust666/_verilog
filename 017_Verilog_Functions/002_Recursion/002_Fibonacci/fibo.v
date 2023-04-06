// keyword "automatic" allocates "different storage space" for
// every function call
// Used, in recursion tasks, as every recursion call will require different
// storage space to operate at

module fibo_factorial();


function 
	automatic integer fibonacci(input integer N);
// integer: because the return type is integer 
// automatic: for recursion-type-operation	- re-entrant 

// Declarations are not done in unnamed block
integer int_val = 0;		// Variable for intermediate values


begin	
		if(N == 0)
			int_val = 0;
			
		else if(N == 1)
			int_val = 1;
		
		else
			begin
				int_val = fibonacci(N - 1) + fibonacci(N - 2);
				// Fibonacci of N is the sum of previous and 2nd last previous
			end
			
	fibonacci  = int_val;

/* 	Eg:	5 = f(2) 		+			f(3)
		  =	0 + 1		+			1	+ (1+2)
		  = 5 */
end

endfunction


// $monitor will display the CHANGES in the block 
// $display will display value everytime when it is called

// Stimulus

integer val = 0;

initial 
	begin
		#1	$monitor("Time = %d;	Factorial Val = %d", $time, fibonacci(val));
		#1	val = 10;
		#1	val = 1;
	end 
		
	
// Simulation time
initial
	begin
		#500 $finish;
	end

endmodule 

