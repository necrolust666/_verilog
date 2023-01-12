module alu(
	input [3:0]opcode,
	input [3:0]a,
	input [3:0]b,
	
	output reg [7:0]op,
       	output reg flag	
			);

parameter 	add = 	4'b0000,
		sub = 	4'b0001,
		mul = 	4'b0010,
		div = 	4'b0011,
		a_n_d = 4'b0100,
       		o_r   = 4'b0101,
		n_o_t = 4'b0110,
		n_and = 4'b0111,
		n_or  = 4'b1000,
		x_or  =	4'b1001,
		x_nor = 4'b1010;

always @(opcode)

begin

	case(opcode)

		add:	begin
			op = a + b;
		       	flag = op[5];	// Carry		
			end

		sub:	begin
			op = a - b;
			flag = op[5]; // Burrow
			end

		mul:	begin
			op = a * b;
			end

		div:	begin
			op = a / b;
			end

		a_n_d:	begin
			op = a & b;
			end


		o_r:	begin
			op = a | b;
			end


		n_o_t:	begin
				if(a)
				begin op = ~a; end

				else if(b)
				begin op = ~b; end
			end

		n_and:	begin
			op = ~(a&b);
			end

		n_or:	begin
			op = ~(a|b);
			end

		x_or:	begin
			op = (~a)&b | a&(~b);
			end
		
		x_nor:	begin
			op = (a & b) | (~a & ~b);  
			end

	endcase
end 

endmodule
		
