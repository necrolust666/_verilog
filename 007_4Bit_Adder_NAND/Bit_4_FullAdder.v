/*

*/

module Bit_4_FullAdder(
						input [3:0]a_fa, [3:0]b_fa, [3:0]c_fa,
						output [3:0]sum_fa, cout_fa 
					  );

wire [3:0]s;
wire [3:0]c;
	
fullAdderNAND bit0(a_fa[0], b_fa[0], 1'b0,  s0, c0);
fullAdderNAND bit1(a_fa[1], b_fa[1], c0,   s1, c1);
fullAdderNAND bit2(a_fa[2], b_fa[2], c1,   s2, c2);
fullAdderNAND bit3(a_fa[3], b_fa[3], c2,   s3, c3);

assign sum_fa  = {s3, s2, s1, s0};
assign cout_fa = c3;

endmodule


module fullAdderNAND(a, b, cin, sum, cout);

input a, b, cin;
output cout, sum;

// Declaring a Bus/Vector
wire[7:0] w;

// Gate level modelling

nand(w0, a,b);
nand(w1, a,w0);
nand(w2, b,w0);
nand(w3, w1,w2);
nand(w4, w3,cin);
nand(w5, w4,w3);
nand(w6, w4,cin);
nand(sum, w5,w6);
nand(cout, w0,w4);


endmodule 
