module controlunit(
    input[2:0] opcode,

    output reg [2:0] alu_op,
    output reg write_enable
);

always @(*)
begin
    alu_op =   3'b000;
    write_enable = 0;


    case(opcode)

           3'b000: begin
            alu_op = 3'b000;
            write_enable = 1;
        end

        3'b001: begin 
            alu_op = 3'b001;
            write_enable = 1;
        end

        3'b010: begin 
            alu_op = 3'b010;
            write_enable = 1;
        end

        3'b011: begin
            alu_op = 3'b011;
            write_enable = 1;
        end

        3'b100: begin
            alu_op = 3'b100;
            write_enable = 1;
        end

        3'b101: begin
            alu_op = 3'b101;
            write_enable = 1;
        end

        3'b110: begin
            alu_op = 3'b110;
            write_enable = 1;
        end

        3'b111: begin
            alu_op = 3'b111;
            write_enable = 1;
        end

    endcase

end

endmodule