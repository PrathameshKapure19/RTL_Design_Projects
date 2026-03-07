module UpDown_counter#(parameter DATA_WIDTH = 4)(
input  clk,
input  rst,
input  load,
input  [DATA_WIDTH - 1:0]load_data,
input  up_down,
output reg [DATA_WIDTH - 1 :0]count,
output overflow
    );
always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        count    <= {DATA_WIDTH{1'b0}};
    end
    else
    begin
        if(load)
        begin
            count <= load_data;
        end
        else
        begin
            if(up_down)
            begin
                count <= count + 1'b1;
            end
            else
            begin
                count <= count - 1'b1;
            end
        end
    end
end
assign overflow = (!load) && (up_down && (count == {DATA_WIDTH{1'b1}}))||(!up_down && (count == {DATA_WIDTH{1'b0}}));
endmodule
