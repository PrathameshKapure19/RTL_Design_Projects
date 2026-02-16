module ff_D(
    input  wire rst,
    input  wire clk,
    input  wire din,
    output reg q
    );
always@(posedge clk or negedge rst) begin
    if(!rst)
    begin
        q <= 1'b0;
    end
    else
    begin
        q <= din;
    end
end
endmodule