/* 
Full Adder with NAND - Gate Level
*/

module fullAdderNAND(a, b, cin, cout, sum);

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