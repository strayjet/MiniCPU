module tb_register_file;

    reg clk, rst, write_enable;
    reg [3:0] read_addr1, read_addr2, write_addr;
    reg [7:0] alu_result;

    wire [7:0] rd1, rd2;

    register_file dut (
        .clk(clk),
        .rst(rst),
        .write_enable(write_enable),
        .read_address1(read_addr1),
        .read_address2(read_addr2),
        .write_address(write_addr),
        .write_data(alu_result),
        .read_data1(rd1),
        .read_data2(rd2)
    );

    // clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, tb_register_file);

        clk = 0;
        rst = 1;
        write_enable = 0;

        #10 rst = 0;

        // write 10 into R3
        write_enable = 1;
        write_addr = 3;
        alu_result = 8'd10;

        #10;

        write_enable = 0;

        // read back
        read_addr1 = 3;

        #10;

        $finish;
    end

endmodule