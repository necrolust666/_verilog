
module simple_conversion(ip_val, op_val);
  
   input ip_val;
   output reg op_val;
  
  task conversion;
    begin
      // op_val = ((10'd9)/(10'd5)) * (ip_val + (10'd32));
	 op_val = ((9)/(5)) * (ip_val + (32));
    end 
  endtask 
   
endmodule

  
 