
// Code your testbench here
// or browse Examples


module checkTaskTB;
  
  reg IP_VAL;
  wire OP_VAL;
  
  checkTask dut(
                .ip_val(IP_VAL),
                .op_val(OP_VAL)
               );
  
  initial 
    begin
      // IP_VAL = 10'd22;
      IP_VAL = 22;
     #10 $display("O/P = %d", dut.op_val);
    end
  

  
endmodule