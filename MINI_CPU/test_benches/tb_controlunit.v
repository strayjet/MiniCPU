module tb_controlunit;
    reg[2:0] opcode;

    wire[2:0] alu_op;
    wire write_enable;


    controlunit dut(
        .opcode(opcode),
        .alu_op(alu_op),
        .write_enavle(write_enable)
    );

    initial 
    begin
        $dumpfile("controlunit_wave.vcd");
        $dumpvars(0, tb_alu);

        
    end

endmodule