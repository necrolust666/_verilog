Memory declaration syntax:

for, 	32 x 8 Memory,
where,	32 = Depth/Rows/Decoder Output/Address Lines
	 8 = Size/Columns/Datalines/Width

reg [Width] instance_name   [Depth];
reg   [7:0]           mem   [31:0];


Memory Accessing Techniques: Ref the memory types directory (IMPORTANT)

Single Port Ram	: Allows us to Read or Write  (one at a time) from only One memory location.
Dual Port Ram	: Allows us to Read (simultaneously) from two different locations.