`include "moore_detector.v"
module tb_mooredetector;
reg  clk;
reg  rst;
reg  din;
wire dout;

moore_detector DUT
(
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
);

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
rst = 1'b0;
din = 1'b0;
#10
$monitor("|Time = %0t|din = %0b|dout =%0b|",$time,din,dout);
rst = 1'b1;
din = 1'b1;#10;
din = 1'b0;#10;
din = 1'b1;#10;
din = 1'b1;#10;
din = 1'b1;#10;
din = 1'b0;#10;
din = 1'b1;#10;


#100;
$finish;
end
initial
begin
    $dumpfile("dump3.vcd");
    $dumpvars(0,tb_mooredetector);
end
endmodule