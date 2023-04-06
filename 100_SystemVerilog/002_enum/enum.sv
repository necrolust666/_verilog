// Code your testbench here
// or browse Examples


module tb;
  enum {Red, Blue, Green} colours, colours2;
  initial
    begin
	// Assigning a Variable
	colours = Blue;

/*       $display("%d", colours);		// 1
      $display("%d", colours.name);	// Blue
      $display("%s", colours);		// Blue
      $display("%s", colours.name);	// Blue  */
	  
	// Other methods
	
	// 1. next(N)
	colours = colours.next(2);		// Red
	$display("%s", colours);
	
	colours2 = Green;
	colours2 = colours2.next(3);	// Green
	$display("%s", colours2);	  
	  
	// 2. prev(N)
	colours = Green;
	colours = colours.prev(2);		// Red
	$display("%s", colours);
	
	colours2 = Green;
	colours2 = colours2.next(3);	// Green
	$display("%s", colours2);	  
	  
	  
   end

  enum {Cat, Dog, Bat} chills;
	initial
	begin
	$display("%d", chills);		// 0
	$display("%d", chills.name);	// Cat
	$display("%s", chills);		// Cat
	$display("%s", chills.name);	// Cat
	end
 
endmodule