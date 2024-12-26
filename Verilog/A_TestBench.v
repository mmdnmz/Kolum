module A_TestBench;

reg clk = 1'b0;
reg rst_n;
reg f_en = 1'b1;
 
localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

kol kanat (
	.CLOCK_50(clk),
	.reset(rst_n),
	.forward_enable(f_en)
);

wire [15:0] sram_DQ_mem_tb;
wire [17:0] sram_ADDR_mem_tb;
wire sram_UB_N_mem_tb;
wire sram_LB_N_mem_tb;
wire sram_WE_N_mem_tb;
wire sram_CE_N_mem_tb;
wire sram_OE_N_mem_tb;


el barmak (
	.CLOCK_50(clk),
	.reset(rst_n),
	.forward_enable(f_en),
	.sram_DQ_mem(sram_DQ_mem_tb),
	.sram_ADDR_mem(sram_ADDR_mem_tb),
	.sram_UB_N_mem(sram_UB_N_mem_tb),
	.sram_LB_N_mem(sram_LB_N_mem_tb),
	.sram_WE_N_mem(sram_WE_N_mem_tb),
	.sram_CE_N_mem(sram_CE_N_mem_tb),
	.sram_OE_N_mem(sram_OE_N_mem_tb)
);


initial begin
rst_n = 1;
#60;
rst_n = 0;
#10000;
$stop;
end


    
endmodule