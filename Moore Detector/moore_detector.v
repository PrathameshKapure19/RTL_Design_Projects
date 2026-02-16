module moore_detector
(
    input  wire rst,
    input  wire clk,
    input  wire din,
    output dout
);
localparam S0 = 3'd0,S1 = 3'd1,S2 = 3'd2,S3 = 3'd3,S4 = 3'd4;
reg [2:0]current_state,next_state;
always @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        current_state <= 3'd0;
    end
    else
    begin
        current_state <= next_state;
    end
end

always@(*)
begin
    case(current_state)
    S0:next_state <= din ? S1: S0;
    S1:next_state <= din ? S1: S2;
    S2:next_state <= din ? S3: S0;
    S3:next_state <= din ? S4: S2;
    S4:next_state <= din ? S1: S2;
    default:next_state <= S0;
    endcase
end

assign dout = (current_state == S4);
endmodule