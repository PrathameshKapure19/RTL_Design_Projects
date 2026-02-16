module ff_JK(
    input  wire clk,
    input  wire rst,
    input  wire J,K,
    output reg  q,
    output wire  q_bar
    );
always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        q <= 1'b0;   
    end
else
begin
    case({J,K})
    2'b00:q <= q;
    2'b01:q <= 1'b0;
    2'b10:q <= 1'b1;
    2'b11:q <= ~q;
    default:q <= 1'b0;
    endcase
end
 
end
assign q_bar = ~q;
endmodule