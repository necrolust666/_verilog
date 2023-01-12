module bin2xs3_tb;

reg [3:0]BIN;
wire [3:0]XS3;

bin2xs3 dut(
	.bin(BIN),
	.xs3(XS3)
			);

initial 

	begin

		//Init
		BIN = 4'b0000;
	
	#100	BIN = 4'b1010;	


	end

initial begin #500 $finish; end

endmodule
