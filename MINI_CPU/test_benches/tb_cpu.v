module tb_cpu;

reg clk;
reg rst;

cpu dut(
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, tb_cpu);

    clk = 0;
    rst = 1;

    // Load instructions
    dut.i1.memory[0] = {3'b011,4'd1,4'd2,4'd3,1'b0}; // ADD R1,R2,R3

    #10;
    rst = 0;

    // Load register values AFTER reset
    dut.r1.register[2] = 8'd10;
    dut.r1.register[3] = 8'd20;

    #100;

    $finish;
end

endmodule