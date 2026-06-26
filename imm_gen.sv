module imm_gen (
    input logic [31:0] instruction,
    output logic [31:0] imm_value
);
    always_comb begin
        case (instruction[6:0])
            7'b0010011: imm_value = {{20{instruction[31]}}, instruction[31:20]}; // I-type (addi, lw)
            7'b0100011: imm_value = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-type (sw)
            7'b1100011: imm_value = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type (beq, bne)
            7'b0110111, 7'b0010111: imm_value = {instruction[31:12], 12'b0}; // U-type
            7'b1101111: imm_value = { {12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0 }; // J-type (jal)
            default: imm_value = 32'b0;
        endcase
    end
endmodule