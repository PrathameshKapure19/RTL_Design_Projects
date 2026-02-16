module mealy_detector
(
    input  wire rst,
    input  wire clk,
    input  wire din,
    output wire dout
);

localparam 
S0 = 2'd0,
S1 = 2'd1,
S2 = 2'd2,
S3 = 2'd3;

reg [1:0]next_state,current_state;

always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        current_state <= S0;
    end
    else
    begin
        current_state <= next_state;
    end
end

always@(*)begin
    case(current_state)
    S0:next_state = din ? S1 : S0;
    S1:next_state = din ? S1 : S2;
    S2:next_state = din ? S3 : S0;
    S3:next_state = din ? S1 : S2;
    default:next_state = S0;
    endcase
end

assign dout = ((current_state == S3) && din);


endmodule