`include "compFunc.v"

module compFunc_tb
			#(	parameter [3:0] BUSWIDTH = 4	)	;
			
		reg [ (BUSWIDTH - 1):0] A;
		reg [ (BUSWIDTH - 1):0] B;
		
		wire [3:1] OP;
		
// Instantiation
	compFunc
		// Parameter Instantiation
		#(	.busWidth	(BUSWIDTH))
		
		// DUT Instantiation
	dut ( .a(A),
		  .b(B),
		  .op(OP)
		);
		

	initial
		begin
			
		A = 1;	B = 8;
		
		case (OP)
		
		3'b100:	$display("%d greater than %d", A, B);
		
		3'b010:	$display("%d equal to %d", A, B);

		3'b001:	$display("%d less than %d",A, B);
			
		default: $display("Default Val.");	
		endcase
		
		end
		
	initial
		begin
			#1000	$finish;
		end
		
endmodule