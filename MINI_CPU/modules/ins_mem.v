module ins_mem(
    input [7:0] address,
    output [15:0] instruction
);

reg [15:0] memory [0:255];
integer i;

initial begin
    // IMPORTANT: clear memory
    for(i = 0; i < 256; i = i + 1)
        memory[i] = 16'b0;

    // program
    memory[0] = {3'b011,4'd1,4'd2,4'd3,1'b0}; // ADD
    memory[1] = {3'b101,4'd4,4'd1,4'd3,1'b0}; // XOR
    memory[2] = {3'b100,4'd5,4'd4,4'd2,1'b0}; // SUB
end

assign instruction = memory[address];

endmodule