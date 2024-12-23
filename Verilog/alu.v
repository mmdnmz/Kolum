module alu #(
    parameter N = 32
) (

    input [N-1:0] input_a, input_b,
    input carry_in,
    input [3:0] command,
    
    output reg [N-1:0] result,
    output [3:0] status_out
);
    reg carry_flag, overflow_flag;
    wire zero_flag, negative_flag;
    assign status_out = {negative_flag, zero_flag, carry_flag, overflow_flag};
    assign zero_flag = ~|result;
    assign negative_flag = result[N-1];

    wire [N-1:0] carry_in_extended, not_carry_in_extended;
    assign carry_in_extended = {{(N-1){1'b0}}, carry_in};
    assign not_carry_in_extended = {{(N-1){1'b0}}, ~carry_in};

    always @(command or input_a or input_b or carry_in_extended or not_carry_in_extended) begin
        carry_flag = 1'b0;
        case (command)
            4'b0001: result = input_b;                                     // MOV
            4'b1001: result = ~input_b;                                    // MVN
            4'b0010: {carry_flag, result} = input_a + input_b;             // ADD
            4'b0011: {carry_flag, result} = input_a + input_b + carry_in_extended; // ADC
            4'b0100: {carry_flag, result} = input_a - input_b;             // SUB
            4'b0101: {carry_flag, result} = input_a - input_b - not_carry_in_extended; // SBC
            4'b0110: result = input_a & input_b;                           // AND
            4'b0111: result = input_a | input_b;                           // ORR
            4'b1000: result = input_a ^ input_b;                           // EOR
            default: result = {N{1'b0}};
        endcase

        overflow_flag = 1'b0;
        if (command[3:1] == 3'b001) begin      // ADD, ADC
            overflow_flag = (input_a[N-1] == input_b[N-1]) && (input_a[N-1] != result[N-1]);
        end
        else if (command[3:1] == 3'b010) begin // SUB, SBC
            overflow_flag = (input_a[N-1] != input_b[N-1]) && (input_a[N-1] != result[N-1]);
        end
    end
endmodule
