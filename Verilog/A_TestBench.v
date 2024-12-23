module A_TestBench;

reg clk = 1'b0;
reg rst_n;
reg f_en = 1'b0;
 
localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

kol kanat (
	.CLOCK_50(clk),
	.reset(rst_n),
	.forward_enable(f_en)
);




initial begin
rst_n = 1;
#10;
rst_n = 0;
#10000;
$stop;
end


    
endmodule