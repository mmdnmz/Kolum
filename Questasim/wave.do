onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 40 /A_TestBench/kanat/IF/clk
add wave -noupdate -group kol /A_TestBench/kanat/N
add wave -noupdate -group kol /A_TestBench/kanat/DataWidth
add wave -noupdate -group kol /A_TestBench/kanat/CLOCK_50
add wave -noupdate -group kol /A_TestBench/kanat/reset
add wave -noupdate -group kol /A_TestBench/kanat/forward_enable
add wave -noupdate -group kol /A_TestBench/kanat/clk
add wave -noupdate -group kol /A_TestBench/kanat/rst
add wave -noupdate -group kol /A_TestBench/kanat/FLUSH
add wave -noupdate -group kol /A_TestBench/kanat/PC_IF
add wave -noupdate -group kol /A_TestBench/kanat/Instruction_IF
add wave -noupdate -group kol /A_TestBench/kanat/pc_if_reg_out
add wave -noupdate -group kol /A_TestBench/kanat/Instruction_ID_in
add wave -noupdate -group kol /A_TestBench/kanat/wb_enable_id
add wave -noupdate -group kol /A_TestBench/kanat/mem_read_enable_id
add wave -noupdate -group kol /A_TestBench/kanat/mem_write_enable_id
add wave -noupdate -group kol /A_TestBench/kanat/exe_cmd_id
add wave -noupdate -group kol /A_TestBench/kanat/dest_id
add wave -noupdate -group kol /A_TestBench/kanat/src1_id
add wave -noupdate -group kol /A_TestBench/kanat/src2_id
add wave -noupdate -group kol /A_TestBench/kanat/shift_operand_id
add wave -noupdate -group kol /A_TestBench/kanat/imm24_id
add wave -noupdate -group kol /A_TestBench/kanat/val_rm_id
add wave -noupdate -group kol /A_TestBench/kanat/val_rn_id
add wave -noupdate -group kol /A_TestBench/kanat/s_id
add wave -noupdate -group kol /A_TestBench/kanat/b_id
add wave -noupdate -group kol /A_TestBench/kanat/i_id
add wave -noupdate -group kol /A_TestBench/kanat/wb_enable_exe
add wave -noupdate -group kol /A_TestBench/kanat/mem_read_enable_exe
add wave -noupdate -group kol /A_TestBench/kanat/mem_write_enable_exe
add wave -noupdate -group kol /A_TestBench/kanat/select_scr1
add wave -noupdate -group kol /A_TestBench/kanat/select_scr2
add wave -noupdate -group kol /A_TestBench/kanat/exe_cmd_exe
add wave -noupdate -group kol /A_TestBench/kanat/dest_exe
add wave -noupdate -group kol /A_TestBench/kanat/src1_exe
add wave -noupdate -group kol /A_TestBench/kanat/src2_exe
add wave -noupdate -group kol /A_TestBench/kanat/shift_operand_exe
add wave -noupdate -group kol /A_TestBench/kanat/imm24_exe
add wave -noupdate -group kol /A_TestBench/kanat/val_rm_exe
add wave -noupdate -group kol /A_TestBench/kanat/val_rn_exe
add wave -noupdate -group kol /A_TestBench/kanat/alu_res_out_exe
add wave -noupdate -group kol /A_TestBench/kanat/branch_address_exe
add wave -noupdate -group kol /A_TestBench/kanat/s_exe
add wave -noupdate -group kol /A_TestBench/kanat/b_exe
add wave -noupdate -group kol /A_TestBench/kanat/i_exe
add wave -noupdate -group kol /A_TestBench/kanat/status_exe_alu_out
add wave -noupdate -group kol /A_TestBench/kanat/status_exe_alu_in
add wave -noupdate -group kol /A_TestBench/kanat/pc_id_reg_out
add wave -noupdate -group kol /A_TestBench/kanat/wb_enable_mem
add wave -noupdate -group kol /A_TestBench/kanat/mem_read_enable_mem
add wave -noupdate -group kol /A_TestBench/kanat/mem_write_enable_mem
add wave -noupdate -group kol /A_TestBench/kanat/alu_res_out_mem
add wave -noupdate -group kol /A_TestBench/kanat/val_rm_mem
add wave -noupdate -group kol /A_TestBench/kanat/data_memory_out_mem
add wave -noupdate -group kol /A_TestBench/kanat/dest_mem
add wave -noupdate -group kol /A_TestBench/kanat/wb_enable_wb
add wave -noupdate -group kol /A_TestBench/kanat/mem_read_enable_wb
add wave -noupdate -group kol /A_TestBench/kanat/alu_res_out_wb
add wave -noupdate -group kol /A_TestBench/kanat/data_memory_out_wb
add wave -noupdate -group kol /A_TestBench/kanat/wb_value_wb
add wave -noupdate -group kol /A_TestBench/kanat/dest_wb
add wave -noupdate -group kol /A_TestBench/kanat/Hazard
add wave -noupdate -group kol /A_TestBench/kanat/status_id
add wave -noupdate -group kol /A_TestBench/kanat/two_src
add wave -noupdate -group kol /A_TestBench/kanat/wb_enable_mem_out
add wave -noupdate -group status_register_inst /A_TestBench/kanat/status_register_inst/clk
add wave -noupdate -group status_register_inst /A_TestBench/kanat/status_register_inst/rst
add wave -noupdate -group status_register_inst /A_TestBench/kanat/status_register_inst/enable
add wave -noupdate -group status_register_inst -radix binary -childformat {{{/A_TestBench/kanat/status_register_inst/status_in[3]} -radix binary} {{/A_TestBench/kanat/status_register_inst/status_in[2]} -radix binary} {{/A_TestBench/kanat/status_register_inst/status_in[1]} -radix binary} {{/A_TestBench/kanat/status_register_inst/status_in[0]} -radix binary}} -expand -subitemconfig {{/A_TestBench/kanat/status_register_inst/status_in[3]} {-height 16 -radix binary} {/A_TestBench/kanat/status_register_inst/status_in[2]} {-height 16 -radix binary} {/A_TestBench/kanat/status_register_inst/status_in[1]} {-height 16 -radix binary} {/A_TestBench/kanat/status_register_inst/status_in[0]} {-height 16 -radix binary}} /A_TestBench/kanat/status_register_inst/status_in
add wave -noupdate -group status_register_inst /A_TestBench/kanat/status_register_inst/status_out
add wave -noupdate -group IF /A_TestBench/kanat/IF/N
add wave -noupdate -group IF /A_TestBench/kanat/IF/rst
add wave -noupdate -group IF /A_TestBench/kanat/IF/freeze
add wave -noupdate -group IF -radix decimal /A_TestBench/kanat/IF/branch_taken
add wave -noupdate -group IF -radix decimal /A_TestBench/kanat/IF/branch_addr
add wave -noupdate -group IF -radix decimal /A_TestBench/kanat/IF/pc_plus4
add wave -noupdate -group IF -radix decimal /A_TestBench/kanat/IF/instruction
add wave -noupdate -group IF -radix decimal /A_TestBench/kanat/IF/pc_in
add wave -noupdate -group IF -radix decimal /A_TestBench/kanat/IF/pc_out
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/N
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/clk
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/rst
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/freeze
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/flush
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/pc_in
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/instruction_in
add wave -noupdate -group IF_REG -radix unsigned /A_TestBench/kanat/IF_REG/pc
add wave -noupdate -group IF_REG /A_TestBench/kanat/IF_REG/instruction
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/forward_en_in
add wave -noupdate -group Hazard_UNIT -group + /A_TestBench/kanat/Hazard_UNIT/i
add wave -noupdate -group Hazard_UNIT -group + /A_TestBench/kanat/Hazard_UNIT/mem_w_en
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/mem_dest
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/mem_wb_en
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/exe_dest
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/exe_wb_en
add wave -noupdate -group Hazard_UNIT -color Brown -itemcolor Brown /A_TestBench/kanat/Hazard_UNIT/hazard
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/rn
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/reg_file_input2
add wave -noupdate -group Hazard_UNIT /A_TestBench/kanat/Hazard_UNIT/two_src
add wave -noupdate -group Hazard_UNIT -group for /A_TestBench/kanat/Hazard_UNIT/mem_r_en_exe
add wave -noupdate -group Hazard_UNIT -group for /A_TestBench/kanat/Hazard_UNIT/mem_r_en_mem
add wave -noupdate -group ID /A_TestBench/kanat/ID/N
add wave -noupdate -group ID /A_TestBench/kanat/ID/clk
add wave -noupdate -group ID /A_TestBench/kanat/ID/rst
add wave -noupdate -group ID -radix unsigned /A_TestBench/kanat/ID_REG/Pc_Id
add wave -noupdate -group ID -radix unsigned /A_TestBench/kanat/ID_REG/PcExe
add wave -noupdate -group ID /A_TestBench/kanat/ID/wb_enable_in
add wave -noupdate -group ID /A_TestBench/kanat/ID/hazard_in
add wave -noupdate -group ID /A_TestBench/kanat/ID/wb_dest_in
add wave -noupdate -group ID /A_TestBench/kanat/ID/status_in
add wave -noupdate -group ID /A_TestBench/kanat/ID/instruction_in
add wave -noupdate -group ID /A_TestBench/kanat/ID/wb_value_in
add wave -noupdate -group ID /A_TestBench/kanat/ID/val_rn_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/val_rm_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/two_src_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/s_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/b_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/mem_write_enable_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/mem_read_enable_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/wb_enable_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/exe_cmd_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/dest_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/src1_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/src2_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/shift_operand_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/imm24_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/rm
add wave -noupdate -group ID /A_TestBench/kanat/ID/rd
add wave -noupdate -group ID /A_TestBench/kanat/ID/rn
add wave -noupdate -group ID /A_TestBench/kanat/ID/s
add wave -noupdate -group ID /A_TestBench/kanat/ID/opcode
add wave -noupdate -group ID /A_TestBench/kanat/ID/i
add wave -noupdate -group ID /A_TestBench/kanat/ID/i_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/mode
add wave -noupdate -group ID /A_TestBench/kanat/ID/cond
add wave -noupdate -group ID /A_TestBench/kanat/ID/control_unit_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/condition_check_out
add wave -noupdate -group ID /A_TestBench/kanat/ID/control_signals_selector
add wave -noupdate -group ID /A_TestBench/kanat/ID/signals
add wave -noupdate -group ID /A_TestBench/kanat/ID/regfile_input2
add wave -noupdate -group ID /A_TestBench/kanat/ID/not_branch
add wave -noupdate -group RegisterFile -group rf_Signlas /A_TestBench/kanat/ID/register_file_inst/N
add wave -noupdate -group RegisterFile -group rf_Signlas /A_TestBench/kanat/ID/register_file_inst/clk
add wave -noupdate -group RegisterFile -group rf_Signlas /A_TestBench/kanat/ID/register_file_inst/rst
add wave -noupdate -group RegisterFile -group rf_Signlas /A_TestBench/kanat/ID/register_file_inst/i
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Read_RF /A_TestBench/kanat/ID/register_file_inst/reg_read
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Read_RF -radix decimal /A_TestBench/kanat/ID/register_file_inst/read_data1
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Read_RF -radix decimal /A_TestBench/kanat/ID/register_file_inst/read_data2
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Read_RF -radix unsigned /A_TestBench/kanat/ID/register_file_inst/read_register1
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Read_RF -radix unsigned /A_TestBench/kanat/ID/register_file_inst/read_register2
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Write_RF /A_TestBench/kanat/ID/register_file_inst/write_register
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Write_RF -radix decimal /A_TestBench/kanat/ID/register_file_inst/write_data
add wave -noupdate -group RegisterFile -group rf_Signlas -expand -group Write_RF /A_TestBench/kanat/ID/register_file_inst/reg_write
add wave -noupdate -group RegisterFile -radix decimal -childformat {{{/A_TestBench/kanat/ID/register_file_inst/registers[15]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[14]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[13]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[12]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[11]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[10]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[9]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[8]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[7]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[6]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[5]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[4]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[3]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[2]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[1]} -radix decimal} {{/A_TestBench/kanat/ID/register_file_inst/registers[0]} -radix decimal}} -expand -subitemconfig {{/A_TestBench/kanat/ID/register_file_inst/registers[15]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[14]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[13]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[12]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[11]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[10]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[9]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[8]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[7]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[6]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[5]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[4]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[3]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[2]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[1]} {-height 16 -radix decimal} {/A_TestBench/kanat/ID/register_file_inst/registers[0]} {-height 16 -radix decimal}} /A_TestBench/kanat/ID/register_file_inst/registers
add wave -noupdate -group ID_REG -radix unsigned /A_TestBench/kanat/ID_REG/N
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/clk
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/rst
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/en
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/clr
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/status_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/wb_enable_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/mem_read_enable_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/mem_write_enable_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/b_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/s_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/i_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/wb_enable_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/mem_read_enable_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/mem_write_enable_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/b_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/s_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/i_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/status_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/exe_cmd_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/dest_in
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/src1_in
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/src2_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/exe_cmd_out
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/dest_out
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/src1_out
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/src2_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/shift_operand_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/shift_operand_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/imm24_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/imm24_out
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/pc_in
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/val_rm_in
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/val_rn_in
add wave -noupdate -group ID_REG /A_TestBench/kanat/ID_REG/pc_out
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/val_rm_out
add wave -noupdate -group ID_REG -radix decimal /A_TestBench/kanat/ID_REG/val_rn_out
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/clk
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/rst
add wave -noupdate -group EXE /A_TestBench/kanat/EXE_REG/Pc_exe
add wave -noupdate -group EXE /A_TestBench/kanat/EXE_REG/PcMem
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/mem_read_enable_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/mem_write_enable_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/i_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/status_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/sel_src1_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/sel_src2_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/exe_cmd_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/shift_operand_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/imm24_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/pc_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/val_rn_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/val_rm_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/wb_value_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/alu_res_in
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/status_out
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/alu_res_out
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/branch_address_out
add wave -noupdate -group EXE /A_TestBench/kanat/EXE/s_type_signal
add wave -noupdate -group EXE -radix decimal /A_TestBench/kanat/EXE/val1
add wave -noupdate -group EXE -radix decimal /A_TestBench/kanat/EXE/val2
add wave -noupdate -group EXE -radix decimal /A_TestBench/kanat/EXE/val2_generator_in
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/clk
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/rst
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/en
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/clr
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/wb_enable_in
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/mem_read_enable_in
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/mem_write_enable_in
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/wb_enable_out
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/mem_read_enable_out
add wave -noupdate -group EXE_REG /A_TestBench/kanat/EXE_REG/mem_write_enable_out
add wave -noupdate -group EXE_REG -radix unsigned /A_TestBench/kanat/EXE_REG/dest_in
add wave -noupdate -group EXE_REG -radix unsigned /A_TestBench/kanat/EXE_REG/dest_out
add wave -noupdate -group EXE_REG -radix decimal /A_TestBench/kanat/EXE_REG/alu_res_in
add wave -noupdate -group EXE_REG -radix decimal /A_TestBench/kanat/EXE_REG/val_rm_in
add wave -noupdate -group EXE_REG -radix decimal /A_TestBench/kanat/EXE_REG/alu_res_out
add wave -noupdate -group EXE_REG -radix decimal /A_TestBench/kanat/EXE_REG/val_rm_out
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/clk
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/rst
add wave -noupdate -group MEM -radix decimal /A_TestBench/kanat/MEM/alu_res_in
add wave -noupdate -group MEM -radix decimal /A_TestBench/kanat/MEM/val_rm_in
add wave -noupdate -group MEM -radix decimal /A_TestBench/kanat/MEM/data_memory_out
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/wb_enable_in
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/wb_enable_out
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/mem_write_enable_in
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/mem_read_enable_in
add wave -noupdate -group MEM /A_TestBench/kanat/MEM/mem_read_enable_out
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/Width
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/clk
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/rst
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/clr
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/en
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/wb_enable_in
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/mem_read_enable_in
add wave -noupdate -group MEM_REG -radix decimal /A_TestBench/kanat/MEM_REG/alu_res_in
add wave -noupdate -group MEM_REG -radix decimal /A_TestBench/kanat/MEM_REG/data_memory_in
add wave -noupdate -group MEM_REG -radix unsigned /A_TestBench/kanat/MEM_REG/dest_in
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/wb_enable_out
add wave -noupdate -group MEM_REG /A_TestBench/kanat/MEM_REG/mem_read_enable_out
add wave -noupdate -group MEM_REG -radix decimal /A_TestBench/kanat/MEM_REG/alu_res_out
add wave -noupdate -group MEM_REG -radix decimal /A_TestBench/kanat/MEM_REG/data_memory_out
add wave -noupdate -group MEM_REG -radix unsigned /A_TestBench/kanat/MEM_REG/dest_out
add wave -noupdate -group WB /A_TestBench/kanat/WB/Width
add wave -noupdate -group WB /A_TestBench/kanat/WB/clk
add wave -noupdate -group WB /A_TestBench/kanat/WB/rst
add wave -noupdate -group WB -radix decimal /A_TestBench/kanat/WB/alu_res_in
add wave -noupdate -group WB /A_TestBench/kanat/WB/mem_read_enable_in
add wave -noupdate -group WB -radix decimal /A_TestBench/kanat/WB/data_memory_in
add wave -noupdate -group WB -radix decimal /A_TestBench/kanat/WB/wb_value_out
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/forward_en_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/src1_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/src2_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/mem_memr_wb_en_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/wb_id_wb_en_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/mem_memr_dest_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/wb_id_wb_dest_in
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/sel_src1_out
add wave -noupdate -group forward -radix unsigned /A_TestBench/kanat/forward/sel_src2_out
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/WordCount
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/OffSet
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/clk
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/rst
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/alu_res_in
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/val_rm_in
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/mem_read_enable_in
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/mem_write_enable_in
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/result_out
add wave -noupdate -group Memory -group dm_Signals -radix unsigned /A_TestBench/kanat/MEM/memory_data/data_address
add wave -noupdate -group Memory -group dm_Signals -radix unsigned /A_TestBench/kanat/MEM/memory_data/address
add wave -noupdate -group Memory -group dm_Signals /A_TestBench/kanat/MEM/memory_data/i
add wave -noupdate -group Memory -radix decimal -childformat {{{/A_TestBench/kanat/MEM/memory_data/data_memory_array[0]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[1]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[2]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[3]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[4]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[5]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[6]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[7]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[8]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[9]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[10]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[11]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[12]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[13]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[14]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[15]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[16]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[17]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[18]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[19]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[20]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[21]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[22]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[23]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[24]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[25]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[26]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[27]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[28]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[29]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[30]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[31]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[32]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[33]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[34]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[35]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[36]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[37]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[38]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[39]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[40]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[41]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[42]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[43]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[44]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[45]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[46]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[47]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[48]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[49]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[50]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[51]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[52]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[53]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[54]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[55]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[56]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[57]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[58]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[59]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[60]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[61]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[62]} -radix decimal} {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[63]} -radix decimal}} -expand -subitemconfig {{/A_TestBench/kanat/MEM/memory_data/data_memory_array[0]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[1]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[2]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[3]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[4]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[5]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[6]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[7]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[8]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[9]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[10]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[11]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[12]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[13]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[14]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[15]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[16]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[17]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[18]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[19]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[20]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[21]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[22]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[23]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[24]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[25]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[26]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[27]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[28]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[29]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[30]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[31]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[32]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[33]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[34]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[35]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[36]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[37]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[38]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[39]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[40]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[41]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[42]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[43]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[44]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[45]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[46]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[47]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[48]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[49]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[50]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[51]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[52]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[53]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[54]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[55]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[56]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[57]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[58]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[59]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[60]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[61]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[62]} {-height 16 -radix decimal} {/A_TestBench/kanat/MEM/memory_data/data_memory_array[63]} {-height 16 -radix decimal}} /A_TestBench/kanat/MEM/memory_data/data_memory_array
add wave -noupdate -group PC -color Gold -radix unsigned /A_TestBench/kanat/MEM_REG/PcWb_4
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/pc_wb
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/pc_mem
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/pc_exe
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/pc_id
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/ID_REG/Pc_Id
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/ID_REG/pc_in
add wave -noupdate -group PC -radix unsigned /A_TestBench/kanat/ID_REG/pc_out
add wave -noupdate -group mux1 /A_TestBench/kanat/EXE/mux1/Width
add wave -noupdate -group mux1 -radix decimal /A_TestBench/kanat/EXE/mux1/a
add wave -noupdate -group mux1 -radix decimal /A_TestBench/kanat/EXE/mux1/b
add wave -noupdate -group mux1 -radix decimal /A_TestBench/kanat/EXE/mux1/c
add wave -noupdate -group mux1 -radix unsigned /A_TestBench/kanat/EXE/mux1/s
add wave -noupdate -group mux1 -radix decimal /A_TestBench/kanat/EXE/mux1/out
add wave -noupdate -group mux2 /A_TestBench/kanat/EXE/mux2/Width
add wave -noupdate -group mux2 -radix decimal /A_TestBench/kanat/EXE/mux2/a
add wave -noupdate -group mux2 -radix decimal /A_TestBench/kanat/EXE/mux2/b
add wave -noupdate -group mux2 -radix decimal /A_TestBench/kanat/EXE/mux2/c
add wave -noupdate -group mux2 -radix unsigned /A_TestBench/kanat/EXE/mux2/s
add wave -noupdate -group mux2 -radix decimal /A_TestBench/kanat/EXE/mux2/out
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/operand_in
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/shift_operand
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/is_immediate
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/sign_extend
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/shift_amount
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/shift_type
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/i
add wave -noupdate -group V2G -radix unsigned /A_TestBench/kanat/EXE/val2_generator/immediate_value
add wave -noupdate -group V2G /A_TestBench/kanat/EXE/val2_generator/rotate_amount
add wave -noupdate -group V2G -radix decimal /A_TestBench/kanat/EXE/val2_generator/operand_out
add wave -noupdate -group ALU -radix decimal /A_TestBench/kanat/EXE/alu_inst/input_a
add wave -noupdate -group ALU -radix decimal /A_TestBench/kanat/EXE/alu_inst/input_b
add wave -noupdate -group ALU -radix decimal -childformat {{{/A_TestBench/kanat/EXE/alu_inst/result[31]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[30]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[29]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[28]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[27]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[26]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[25]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[24]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[23]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[22]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[21]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[20]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[19]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[18]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[17]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[16]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[15]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[14]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[13]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[12]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[11]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[10]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[9]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[8]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[7]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[6]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[5]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[4]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[3]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[2]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[1]} -radix decimal} {{/A_TestBench/kanat/EXE/alu_inst/result[0]} -radix decimal}} -subitemconfig {{/A_TestBench/kanat/EXE/alu_inst/result[31]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[30]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[29]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[28]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[27]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[26]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[25]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[24]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[23]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[22]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[21]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[20]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[19]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[18]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[17]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[16]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[15]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[14]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[13]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[12]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[11]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[10]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[9]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[8]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[7]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[6]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[5]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[4]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[3]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[2]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[1]} {-height 16 -radix decimal} {/A_TestBench/kanat/EXE/alu_inst/result[0]} {-height 16 -radix decimal}} /A_TestBench/kanat/EXE/alu_inst/result
add wave -noupdate -group ALU -radix unsigned /A_TestBench/kanat/EXE/alu_inst/command
add wave -noupdate -group ALU -group alu_Signals /A_TestBench/kanat/EXE/alu_inst/carry_in_extended
add wave -noupdate -group ALU -group alu_Signals /A_TestBench/kanat/EXE/alu_inst/N
add wave -noupdate -group ALU -group alu_Signals /A_TestBench/kanat/EXE/alu_inst/carry_in
add wave -noupdate -group ALU -group alu_Signals /A_TestBench/kanat/EXE/alu_inst/status_out
add wave -noupdate -group ALU -group alu_Signals /A_TestBench/kanat/EXE/alu_inst/not_carry_in_extended
add wave -noupdate -group ALU -group alu_Signals -group Flag /A_TestBench/kanat/EXE/alu_inst/carry_flag
add wave -noupdate -group ALU -group alu_Signals -group Flag /A_TestBench/kanat/EXE/alu_inst/overflow_flag
add wave -noupdate -group ALU -group alu_Signals -group Flag /A_TestBench/kanat/EXE/alu_inst/zero_flag
add wave -noupdate -group ALU -group alu_Signals -group Flag /A_TestBench/kanat/EXE/alu_inst/negative_flag
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/branch
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/exe_command
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/mem_read_enable
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/mem_write_enable
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/mode
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/op_code
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/set_status
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/status_out
add wave -noupdate -group CU /A_TestBench/kanat/ID/control_unit_inst/write_back_enable
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/carry
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/cond_in
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/cond_out
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/negative
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/overflow
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/status_in
add wave -noupdate -group {Condition Check} /A_TestBench/kanat/ID/condition_check_inst/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {145 ns} 1} {{Cursor 3} {9524 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 303
configure wave -valuecolwidth 91
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {9327 ns} {10046 ns}
