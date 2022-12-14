/*

fullAdder_instantiation 
- using two HalfAdders

*/

module fullAdder_instantiation(
				input a, 
				input b, 
				input cin, 
				output sum, 
				output cout
				);

wire s1, c1, c2;	
										
// halfAdder ha1(a, b, s1, c1);
// halfAdder ha2(s1, cin, sum, c2);
			
halfAdder ha1(.a(a), .b(b), .sum(s1), .cout(c1));
halfAdder ha2(s1, cin, sum, c2);
or (cout, c1, c2);


endmodule



// Instantiating from:
module halfAdder(a, b, sum, cout);

input a, b;
output sum, cout;

assign sum  = a^b;
assign cout = a&b;

endmodule