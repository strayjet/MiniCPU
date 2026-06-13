module cpu(
    input clk,rst
);

    wire[7:0] pc_out;
    wire[15:0] instruction;

    pc p1(
        .clk(clk),
        .rst(rst),
        .pc_out(pc_out)
    );

    ins_mem i1(
        .address(pc_out),
        .instruction(instruction)
    );


    wire[2:0] opcode;   
    wire[3:0] rd;
    wire[3:0] rs1;
    wire[3:0] rs2;

    assign opcode = instruction[15:13];
    assign rd = instruction[12:9];
    assign rs1 = instruction[8:5];
    assign rs2 = instruction[4:1];


    wire[2:0] alu_op;
    wire write_enable;

    controlunit c1(
        .opcode(opcode),
        .alu_op(alu_op),
        .write_enable(write_enable)
    );

    wire[7:0] read_data1, read_data2, alu_result;


    register_file r1(
        .clk(clk),
        .rst(rst),
        .write_enable(write_enable),

        .read_address1(rs1),
        .read_address2(rs2),
        .write_address(rd),

        .write_data(alu_result),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    wire carry_flag;
    alu alu_inst(
        .in1(read_data1),
        .in2(read_data2),
        .alu_op(alu_op),
        .result(alu_result),
        .carry_flag(carry_flag)
    );
endmodule