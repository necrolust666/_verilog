//	UP Counter RTL
module up_T(	
		input clk, 
		input rst, 
		output [3:0]q,	// Use wire
		output [3:0]qb	// Use wire not reg
	);

// This is not Procedural statement.
// Do not use REG for output here

	t_ff t0(1'b1,	rst,	clk,	q[0],	qb[0]);
	t_ff t1(1'b1,	rst,	qb[0],	q[1],	qb[1]);
	t_ff t2(1'b1,	rst,	qb[1],	q[2],	qb[2]);
	t_ff t3(1'b1,	rst,	qb[2],	q[3],	qb[3]);

endmodule





// T FLIP Flop Block
module t_ff(
		input t,
		input rst,
		input clk,

		output reg q,
		output reg qb	);

always @(posedge clk or negedge rst)
begin
	if(!rst)
		begin 
		q 	= 	1'b0;
		qb 	= 	~q;
		end

	else if(t)
		begin
		q 	=	~q;
		qb	=	~q;	
		end

	else	
		begin
			q	=	 q;
			qb	=	~q;
		end
end

endmodule	
