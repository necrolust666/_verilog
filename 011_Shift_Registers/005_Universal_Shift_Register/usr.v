module usr(
		input clk,
		input reset_n,
		input [1:0]sel,
		input [3:0]ip,
		input reg [1:0]sel_piso,		// MUX for PISO
		
		output reg siso_buf,		// Serial Data OUPUT - SISO
		output reg sipo_buf,	// Parallel Data OUTPUT - SIPO
		output reg piso_buf,		// Serial Data OUTPUT - PISO


		output reg [3:0]pipo_buf,		// Parallel Data OUTPUT - PIPO
			
		output reg [3:0]op
					);
parameter 
	siso = 2'b00,
	sipo = 2'b01,
	piso = 2'b10,
	pipo = 2'b11;

always @(posedge clk or negedge reset_n)
		begin
			if(!reset_n)
			begin op[3:0]	<=	4'b0000; 
				siso_buf <= 1'b0;
				sipo_buf <= 1'b0;
				piso_buf <= 1'b0;
				pipo_buf <= 4'b0000;	
			end


			else
			begin
				case(sel)
						
					siso:	begin
											
						op[3:0]	<= {op[2:0],	ip[0]};	
						assign siso_buf = op[3]; // Assign Data Serially
						end
					
					sipo:	begin
						
										
						op[3:0]		<= {op[2:0],	ip[0]};
						assign sipo_buf = op[3:0];	// Assign Data Parallely
						
						end

					piso:	begin
						
						if(sel_piso)
							begin op[3:0]	 <= ip[3:0]; end
						
						else if(!sel_piso)
							begin 
							        op[3:0]<= op[3:0]<<1;
								piso_buf<= op[3];
							end
						end


					pipo:	begin	
	
						op[3:0]	 = ip[3:0];
						pipo_buf = op[3:0];
						end
					
					default:	op[3:0] <= 4'b0000;	

				endcase
			end
		end

// SISO OP
// assign siso_buf 	= op[3];

// SIPO OP - Parallely Receiving
// assign sipo_buf[3:0]	=	op[3:0];


endmodule
