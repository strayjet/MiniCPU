module tb_alu;

    reg [7:0] in1, in2;
    reg [2:0] alu_op;

    wire [7:0] result;
    wire carry_flag;

    // DUT (Device Under Test)
    alu dut (
        .in1(in1),
        .in2(in2),
        .alu_op(alu_op),
        .result(result),
        .carry_flag(carry_flag)
    );

    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_alu);

        // -------------------------
        // TEST 1: NOT
        // -------------------------
        in1 = 8'h0F; in2 = 8'h00;
        alu_op = 3'b000;
        #10;

        // -------------------------
        // TEST 2: AND
        // -------------------------
        in1 = 8'b10101010;
        in2 = 8'b11001100;
        alu_op = 3'b001;
        #10;

        // -------------------------
        // TEST 3: OR
        // -------------------------
        alu_op = 3'b010;
        #10;

        // -------------------------
        // TEST 4: ADD
        // -------------------------
        in1 = 8'd10;
        in2 = 8'd25;
        alu_op = 3'b011;
        #10;

        // -------------------------
        // TEST 5: SUB
        // -------------------------
        in1 = 8'd20;
        in2 = 8'd5;
        alu_op = 3'b100;
        #10;

        // -------------------------
        // TEST 6: XOR
        // -------------------------
        in1 = 8'b11110000;
        in2 = 8'b10101010;
        alu_op = 3'b101;
        #10;

        // -------------------------
        // TEST 7: INC
        // -------------------------
        in1 = 8'd255;
        in2 = 8'd0;
        alu_op = 3'b110;
        #10;

        $finish;
    end

endmodule