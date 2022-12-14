/*
Full Adder - Using two half adders
*/

module fullAdder(val1, val2, cin, sum, cout);
		
input val1, val2, cin;
//output reg sum, cout;
output sum, cout;
		
// Data Type Declaration
wire mid1, mid2, mid3;

/*	
// Structural/Gate Level Modelling
xor(mid1, val1, val2);
and(mid2, val1, val2);

xor(sum, mid1, cin);
and(mid3, mid1, cin);

or(cout, mid2, mid3);

*/




// RTL / Dataflow modelling
/*
// Not recommended 
assign mid1 = val1^val2;
assign mid2 = val1&val2;
assign sum = mid1^cin;
assign mid3 = mid1&cin;
assign cout = mid2|mid3; */

/*
// Directly - Recommended
assign sum = val1^val2^cin;
assign cout = (val1&val2) | cin&(val1^val2);
*/



// Using Conditional operator
assign cout = val1? (val2? (cin?(1):(1)) : (cin?(1):(0)) ) : (val2? (cin?(1):(0)) : (cin?(0):(0)) ) ;
assign sum =  val1? (val2? (cin?(1):(0)) : (cin?(0):(1)) ) : (val2? (cin?(0):(1)) : (cin?(1):(0)) ) ;



/**/

/*
// Behavioral/Procedural Modelling
always @(*)

begin

	case({val1, val2, cin}) // Concatenation Operator

		3'b000: begin sum=1'b0; cout=1'b0; end
		3'b001: begin sum=1'b1; cout=1'b0; end
		3'b010: begin sum=1'b1; cout=1'b0; end
		3'b011: begin sum=1'b0; cout=1'b1; end
		3'b100: begin sum=1'b1; cout=1'b0; end
		3'b101: begin sum=1'b0; cout=1'b1; end
		3'b110: begin sum=1'b0; cout=1'b0; end
		3'b111: begin sum=1'b1; cout=1'b1; end

		endcase	
	
	
		// if-else statement
		
		
		if(val1==0 && val2==0 && cin ==0)
		begin
			sum=1'b0; cout=1'b0;
		end
	
		
		if(val1==0 && val2==0 && cin ==1)
		begin
			sum=1'b1; cout=1'b0;
		end
		
		
		if(val1==0 && val2==1 && cin ==0)
		begin
			sum=1'b1; cout=1'b0;
		end
		
		
		if(val1==0 && val2==1 && cin ==1)
		begin
			sum=1'b0; cout=1'b1;
		end
		
			if(val1==1 && val2==0 && cin ==0)
		begin
			sum=1'b1; cout=1'b0;
		end
		
			if(val1==1 && val2==0 && cin ==1)
		begin
			sum=1'b0; cout=1'b1;
		end
		
			if(val1==1 && val2==1 && cin ==0)
		begin
			sum=1'b0; cout=1'b1;
		end
		
			if(val1==1 && val2==1 && cin ==1)
		begin
			sum=1'b1; cout=1'b1;
		end 

		
	
	
end	// End always
*/


endmodule
