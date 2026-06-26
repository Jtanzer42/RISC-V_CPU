module cpu_top (
    input logic clk,
    input logic rst_n    
);

    // Block linkers
    logic [31:0] current_pc;
    logic [31:0] pc_next;
    logic [31:0] instruction;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    logic reg_write_en;
    logic [31:0] write_data;
    logic [31:0] imm_value;

    // Instantiate program register
    program_counter pc_reg (
        .clk(clk),
        .rst_n(rst_n),
        .pc_next(pc_next),
        .pc_out(current_pc)
    );

    // Instantiate pc adder
    pc_adder pc_adder (
        .pc_in(current_pc),
        .pc_plus_4(pc_next)
    );

    // Instantiate instruction memory
    instruction_memory instr_mem (
        .pc(current_pc),
        .instruction(instruction)
    );

    // Instantiate register file
    register_file reg_file (
        .clk(clk),
        .rst_n(rst_n),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rd(instruction[11:7]),
        .reg_write_en(reg_write_en),
        .write_data(write_data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    // Instantiate immediate value generator
    imm_gen imm_gen (
        .instruction(instruction),
        .imm_value(imm_value)
    );

    // Instantiate control unit
    control_unit control_unit (
        .opcode(instruction[6:0]),
        .reg_write(reg_write_en),
        .alu_src(),
        .mem_write(),
        .mem_read(),
        .matrix_to_reg(),
        .branch(),
        .jump(),
        .alu_op()
    );

endmodule