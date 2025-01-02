module kol (
	CLOCK,
	reset,
    forward_enable
);

////////////////////////	Clock Input	 	////////////////////////
input		   	CLOCK;				//	50 MHz
input	        reset;						//	Toggle Switch[17:0]
input           forward_enable;
wire clk;
assign clk = CLOCK;
wire rst;
assign rst = reset;

// Parameter Definitions
parameter N = 32;
parameter DataWidth = 32;


reg FLUSH = 1'b0; // Temporary flush signal


// Categorized Wires

// **IF Stage Wires**
wire [31:0] PC_IF;               // Current program counter in IF stage
wire [31:0] Instruction_IF;      // Instruction fetched in IF stage
wire [31:0] pc_if_reg_out;       // PC output from IF/ID register
wire [31:0] Instruction_ID_in;   // Instruction output from IF/ID register

// **ID Stage Wires**
wire wb_enable_id;               // Write-back enable signal in ID stage
wire mem_read_enable_id;         // Memory read enable signal in ID stage
wire mem_write_enable_id;        // Memory write enable signal in ID stage
wire [3:0] exe_cmd_id;           // Execution command from ID stage
wire [3:0] dest_id;              // Destination register from ID stage
wire [3:0] src1_id, src2_id;     // Source registers from ID stage
wire [11:0] shift_operand_id;    // Shift operand from ID stage
wire [23:0] imm24_id;            // 24-bit immediate value
wire [31:0] val_rm_id, val_rn_id; // Register values in ID stage
wire s_id, b_id, i_id;           // Control signals from ID stage

// **EXE Stage Wires**
wire wb_enable_exe;              // Write-back enable signal in EXE stage
wire mem_read_enable_exe;        // Memory read enable signal in EXE stage
wire mem_write_enable_exe;       // Memory write enable signal in EXE stage
wire [1:0] select_scr1;
wire [1:0] select_scr2;
wire [3:0] exe_cmd_exe;          // Execution command for EXE stage
wire [3:0] dest_exe;             // Destination register in EXE stage
wire [3:0] src1_exe, src2_exe;   // Source registers in EXE stage
wire [11:0] shift_operand_exe;   // Shift operand for ALU
wire [23:0] imm24_exe;           // 24-bit immediate value in EXE stage
wire [31:0] val_rm_exe, val_rn_exe; // Register values in EXE stage
wire [31:0] alu_res_out_exe;     // ALU result in EXE stage
wire [31:0] branch_address_exe;  // Branch address in EXE stage
wire s_exe, b_exe, i_exe;        // Control signals in EXE stage
wire [3:0] status_exe_alu_out;   // ALU status flags
wire status_exe_alu_in;          // ALU status input
wire [31:0] pc_id_reg_out;       // PC output from ID/EXE register

// **MEM Stage Wires**
wire wb_enable_mem;              // Write-back enable signal in MEM stage
wire mem_read_enable_mem;        // Memory read enable signal in MEM stage
wire mem_write_enable_mem;       // Memory write enable signal in MEM stage
wire [31:0] alu_res_out_mem;     // ALU result passed to MEM stage
wire [31:0] val_rm_mem;          // Value for memory operations in MEM stage
wire [31:0] data_memory_out_mem; // Data read from memory
wire [3:0] dest_mem;             // Destination register in MEM stage

// **WB Stage Wires**
wire wb_enable_wb;               // Write-back enable signal in WB stage
wire mem_read_enable_wb;         // Memory read enable signal in WB stage
wire [31:0] alu_res_out_wb;      // ALU result passed to WB stage
wire [31:0] data_memory_out_wb;  // Data read from memory for WB stage
wire [31:0] wb_value_wb;         // Final write-back value
wire [3:0] dest_wb;              // Destination register in WB stage

// **Hazard Detection Wires**
wire Hazard;                     // Hazard detection signal


// **Status Register Wires**
wire [3:0] status_id;


// **Program Count Wires**
wire [31:0] pc_if;
wire [31:0] pc_id;
wire [31:0] pc_exe;
wire [31:0] pc_mem;
wire [31:0] pc_wb;







// Status Register Instantiation
status_register status_register_inst (
    .clk(clk),
    .rst(rst),
    .enable(s_exe),
    .status_in(status_exe_alu_out),
    .status_out(status_id)
);

// IF Stage Instantiation
if_stage #(
    .N(DataWidth)
) IF (
    .clk(clk),
    .rst(rst),
    .freeze(Hazard),
    .branch_taken(b_exe),
    .branch_addr(branch_address_exe),
    .pc_plus4(PC_IF),
    .instruction(Instruction_IF)
);

// IF Stage Register Instantiation
if_stage_reg IF_REG (
    .clk(clk),
    .rst(rst),
    .freeze(Hazard),
    .flush(b_exe),
    .pc_in(PC_IF),
    .instruction_in(Instruction_IF),
    .pc(pc_if_reg_out),
    .PcId(pc_id),
    .instruction(Instruction_ID_in)
);

// ID Stage Instantiation
id_stage ID (
    .clk(clk),
    .rst(rst),
    .instruction_in(Instruction_ID_in),
    .wb_enable_in(wb_enable_wb),
    .wb_dest_in(dest_wb),
    .wb_value_in(wb_value_wb),
    .hazard_in(Hazard),
    .status_in(status_id),
    .val_rn_out(val_rn_id),
    .val_rm_out(val_rm_id),
    .two_src_out(two_src),
    .s_out(s_id),
    .b_out(b_id),
    .exe_cmd_out(exe_cmd_id),
    .mem_write_enable_out(mem_write_enable_id),
    .mem_read_enable_out(mem_read_enable_id),
    .dest_out(dest_id),
    .i_out(i_id),
    .shift_operand_out(shift_operand_id),
    .wb_enable_out(wb_enable_id),
    .imm24_out(imm24_id),
    .src1_out(src1_id),
    .src2_out(src2_id)
);

// ID/EXE Register Instantiation
id_stage_reg ID_REG (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .clr(b_exe),
    .Pc_Id(pc_id),
    .PcExe(pc_exe),
    .pc_in(pc_id),
    .pc_out(pc_id_reg_out),
    .wb_enable_in(wb_enable_id),
    .wb_enable_out(wb_enable_exe),
    .mem_read_enable_in(mem_read_enable_id),
    .mem_read_enable_out(mem_read_enable_exe),
    .mem_write_enable_in(mem_write_enable_id),
    .mem_write_enable_out(mem_write_enable_exe),
    .exe_cmd_in(exe_cmd_id),
    .exe_cmd_out(exe_cmd_exe),
    .b_in(b_id),
    .b_out(b_exe),
    .s_in(s_id),
    .s_out(s_exe),
    .val_rm_in(val_rm_id),
    .val_rm_out(val_rm_exe),
    .val_rn_in(val_rn_id),
    .val_rn_out(val_rn_exe),
    .shift_operand_in(shift_operand_id),
    .shift_operand_out(shift_operand_exe),
    .i_in(i_id),
    .i_out(i_exe),
    .imm24_in(imm24_id),
    .imm24_out(imm24_exe),
    .dest_in(dest_id),
    .dest_out(dest_exe),
    .status_in(status_id[3]),
    .status_out(status_exe_alu_in),
    .src1_in(src1_id),
    .src1_out(src1_exe),
    .src2_in(src2_id),
    .src2_out(src2_exe)
);

// EXE Stage Instantiation
exe_stage EXE (
    .clk(clk),
    .rst(rst),
    .mem_read_enable_in(mem_read_enable_exe),
    .mem_write_enable_in(mem_write_enable_exe),
    .pc_in(pc_id_reg_out),
    .exe_cmd_in(exe_cmd_exe),
    .val_rn_in(val_rn_exe),
    .val_rm_in(val_rm_exe),
    .shift_operand_in(shift_operand_exe),
    .i_in(i_exe),
    .imm24_in(imm24_exe),
    .status_in(status_exe_alu_in),
    .wb_value_in(wb_value_wb),
    .alu_res_in(alu_res_out_mem),
    .sel_src1_in(select_scr1),
    .sel_src2_in(select_scr2),
    .alu_res_out(alu_res_out_exe),
    .status_out(status_exe_alu_out),
    .branch_address_out(branch_address_exe)
);

// EXE/MEM Register Instantiation
exe_stage_reg EXE_REG (
    .clk(clk),
    .rst(rst),
    .Pc_exe(pc_exe),
    .PcMem(pc_mem),
    .en(1'b1),
    .clr(b_exe),
    .wb_enable_in(wb_enable_exe),
    .wb_enable_out(wb_enable_mem),
    .mem_read_enable_in(mem_read_enable_exe),
    .mem_read_enable_out(mem_read_enable_mem),
    .mem_write_enable_in(mem_write_enable_exe),
    .mem_write_enable_out(mem_write_enable_mem),
    .alu_res_in(alu_res_out_exe),
    .alu_res_out(alu_res_out_mem),
    .val_rm_in(val_rm_exe),
    .val_rm_out(val_rm_mem),
    .dest_in(dest_exe),
    .dest_out(dest_mem)
);

// MEM Stage Instantiation
mem_stage MEM (
    .clk(clk),
    .rst(rst),
    .alu_res_in(alu_res_out_mem),
    .val_rm_in(val_rm_mem),
    .data_memory_out(data_memory_out_mem),
    .wb_enable_in(wb_enable_mem),
    .wb_enable_out(wb_enable_mem_out),
    .mem_write_enable_in(mem_write_enable_mem),
    .mem_read_enable_in(mem_read_enable_mem)
    // .mem_read_enable_out(mem_read_enable_wb)
);

// MEM/WB Register Instantiation
mem_stage_reg MEM_REG (
    .clk(clk),
    .rst(rst),
    .Pc_mem(pc_mem),
    .PcWb(pc_wb),
    .clr(b_exe),
    .en(1'b1),
    .wb_enable_in(wb_enable_mem_out),
    .mem_read_enable_in(mem_read_enable_mem),
    .alu_res_in(alu_res_out_mem),
    .data_memory_in(data_memory_out_mem),
    .dest_in(dest_mem),
    .wb_enable_out(wb_enable_wb),
    .mem_read_enable_out(mem_read_enable_wb),
    .alu_res_out(alu_res_out_wb),
    .data_memory_out(data_memory_out_wb),
    .dest_out(dest_wb)
);

// WB Stage Instantiation
wb_stage WB (
    .clk(clk),
    .rst(rst),
    .alu_res_in(alu_res_out_wb),
    .mem_read_enable_in(mem_read_enable_wb),
    .data_memory_in(data_memory_out_wb),
    .wb_value_out(wb_value_wb)
);

// Hazard Detection Unit
hazard_unit Hazard_UNIT (
    .forward_en_in(forward_enable),
    .mem_dest(dest_mem),
    .mem_wb_en(wb_enable_mem),
    .mem_w_en(mem_write_enable_exe),
    .exe_dest(dest_exe),
    .exe_wb_en(wb_enable_exe),
    .rn(src1_id),
    .reg_file_input2(src2_id),
    .i(i_id),
    .mem_r_en_exe(mem_read_enable_wb),
    .mem_r_en_mem(mem_read_enable_mem),
    .hazard(Hazard)
);

// Forwarding Unit
forward_unit forward (
    .forward_en_in(forward_enable), 
    .src1_in(src1_exe),
    .src2_in(src2_exe), 
    .mem_memr_wb_en_in(wb_enable_mem),
    .wb_id_wb_en_in(wb_enable_wb), 
    .mem_memr_dest_in(dest_mem),
    .wb_id_wb_dest_in(dest_wb), 
    .sel_src1_out(select_scr1),
    .sel_src2_out(select_scr2)
);

endmodule