module alu(
            input[7:0] in1, in2,
             input[2:0] alu_op, 
             output reg[7:0] result, 
             output reg carry_flag
             );


    always @(*)
    begin
        result = 0;
        carry_flag = 0;
        case(alu_op)
        3'b000 : result = ~in1;//NOT
        3'b001 : result = in1 & in2;//AND
        3'b010 : result = in1|in2;//OR
        3'b011 : {carry_flag,result} = in1+in2;//ADD
        3'b100 : {carry_flag, result} = in1-in2;//SUB
        3'b101 : result = in1^in2;//XOR
        3'b110 : {carry_flag, result} = in1 + 1;//INC
        3'b111 : result = in1;
        endcase
    end
endmodule


