module fifo
(
    input  wire rst,
    input  wire clk,
    input  wire wr_en,
    input  wire rd_en,
    input  wire [3:0]din,
    output wire full , empty,
    output reg [3:0]dout
);

reg [1:0] wr_ptr,rd_ptr;
reg [3:0] mem [3:0];
integer i = 0;
initial 
begin
    for(i = 0 ;i < 4; i++)
    begin
        mem[i] = 4'd0;
    end
end
always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        wr_ptr <= 2'd0;
        rd_ptr <= 2'd0;
        dout   <= 4'd0;
    end
    else
    begin
        if(wr_en && !full)
        begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1'b1;
        end
        if(rd_en && !empty)
        begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
        end
    end
end
assign empty = (wr_ptr == rd_ptr);
assign full = (wr_ptr + 1'b1 == rd_ptr);
endmodule