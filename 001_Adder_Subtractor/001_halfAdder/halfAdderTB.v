
/* 
Testbench
*/

module halfAdderTB;
  
  // Data type declaration
  reg VAL1, VAL2;
  wire SUM, CARRY;
  
  //Monitoring of IP/OP
  
// Swtich this one for EDA Playground
/*
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  #10000 $finish;
end
*/
  
  // Instantiation of DUT/UUT - Device/Unit Under Test/Design Module
  halfAdder dut(
    .val1(VAL1),
    .val2(VAL2),
    .sum(SUM),
    .carry(CARRY)
  );
  
  initial begin
    
/*      // Initialize Inputs
      VAL1 = 1'b0; VAL2 = 1'b0;
      
      // Wait 100ns for global reset to finish
      #100 VAL1 = 1'b0; VAL2 = 1'b1;
      #100 VAL1 = 1'b1; VAL2 = 1'b0;
      #100 VAL1 = 1'b1; VAL2 = 1'b1;
*/
	repeat(10) begin {VAL1, VAL2} = $random; #10;	end
  end

endmodule

      