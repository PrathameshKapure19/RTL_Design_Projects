module RAM
(
    input  wire rst,
    input  wire clk,
    input  wire [7:0]addr,
    input  wire [7:0]din,
    input  wire wr_en,
    output reg  [7:0]dout
);
  reg [7:0]mem[0:255];
integer i;

    

always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        dout <= 8'd0;
    end
    else if(wr_en)
    begin 
        mem[addr] <= din;
    
    end
    else
    begin
        dout <= mem[addr];
    end
end

endmodule