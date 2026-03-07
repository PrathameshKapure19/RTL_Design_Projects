`timescale 1ns/1ps
//3 Bit updown counter
module upDown_counter(
    input  rst,
    input  clk,
    input  mode,
    output reg [2:0] Dout
);

reg [2:0]counter;

always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        Dout   <= 3'd0; 
     
    end
    else
    begin
        if(mode)
        begin
            Dout <= Dout + 1'b1;
        end
        else
        begin
            Dout <= Dout - 1'b1;
        end
    end
    
end
endmodule