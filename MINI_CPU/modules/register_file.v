module register_file( 
        input clk, rst,write_enable,  
        input [3:0] read_address1, read_address2, write_address,
        input [7:0] write_data, 
        output[7:0] read_data1, read_data2);

        reg[7:0] register[0:15];
        integer i;

//reset and write
always @(posedge clk or posedge rst)
begin
        if(rst) 
        begin
                for(i =0;i<16;i= i+1)
                        register[i] <= 0;
        end
        else 

        begin
        if(write_enable) register[write_address] <= write_data;
        end
end

// read
        assign read_data1 = register[read_address1];
        assign read_data2 = register[read_address2];

endmodule

