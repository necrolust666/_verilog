
// Code your design here

module checkTask(ip_val, op_val);
  
  input ip_val;
  output reg op_val;
  
`include "conversion.v"
    
  always@(ip_val)
    begin
      conversion(ip_val, op_val);
    end 
      
endmodule
  
 