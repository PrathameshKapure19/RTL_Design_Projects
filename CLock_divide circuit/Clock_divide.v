module clock_divide
#(parameter max_freq = 1_00_000_000)
(
    input  clk,
    input  rst,
    output reg clk_pulse

);
reg [26:0]count;
always @(posedge clk)
begin
  if(rst)                                   //Asynchronous Reset for intializing internal counter and output. 
    begin
        count     <= 27'd0;
        clk_pulse <= 1'b0;
    end 
    else
    begin
        if(count == max_freq - 1)          // checking for counter has reached max value or not, if yes then toggle output. 
        begin
            count     <= 27'd0;
            clk_pulse <= ~clk_pulse;
        end
        else                               // Else counter contunes to increment by one.
        begin
            count     <= count + 26'd1;
            clk_pulse <= 1'b0;
        end
    end
end

endmodule
