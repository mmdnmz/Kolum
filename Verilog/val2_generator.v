module val2_generator(
    input wire [31:0] operand_in,
    input wire [11:0] shift_operand,
    input wire is_immediate, sign_extend,

    output reg [31:0] operand_out
);



    wire [4:0] shift_amount = shift_operand[11:7];
    wire [1:0] shift_type = shift_operand[6:5];

    wire [7:0] immediate_value = shift_operand[7:0];
    wire [3:0] rotate_amount = shift_operand[11:8];

    integer i = 0;
    // i = 0;

    always @(operand_in, shift_operand, is_immediate, sign_extend) begin
        operand_out = 32'b0;

        // ----------------------- Sign Extend ---------------------------
        if (sign_extend) begin  
            operand_out = {{20{shift_operand[11]}}, shift_operand};
        end

        // ---------------------- 32-bit Immediate ----------------------
        else if (is_immediate) begin
            operand_out = {24'b0, immediate_value};
            for (i = 0; i < 2 * rotate_amount; i = i + 1) begin
                operand_out = {operand_out[0], operand_out[31:1]};
            end
        end

        // ---------------------- Immediate Shifts -----------------------
        else begin 
            case (shift_type)
                2'b00: operand_out = operand_in << shift_amount;            // LSL (Logical Shift Left)
                2'b01: operand_out = operand_in >> shift_amount;            // LSR (Logical Shift Right)
                2'b10: operand_out = $signed(operand_in) >>> shift_amount;  // ASR (Arithmetic Shift Right)
                2'b11: begin                                                // ROR (Rotate Right)
                    operand_out = operand_in;
                    for (i = 0; i < shift_amount; i = i + 1) begin
                        operand_out = {operand_out[0], operand_out[31:1]};
                    end
                end
            endcase
        end            
    end

endmodule
