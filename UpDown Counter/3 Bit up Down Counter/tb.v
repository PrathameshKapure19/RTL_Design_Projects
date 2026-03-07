`timescale 1ns/1ps
module tb;
reg clk = 1'b0;
reg rst = 1'b0;
reg mode;
wire [2:0]Dout;

upDown_counter DUT(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .Dout(Dout)
);

always #5 clk = ~clk;

initial begin
rst = 1'b0;
mode = 1'b0;
#20;
rst =  1'b1;
mode = 1'b0;
#80;
mode = 1'b1;
#80;
end

initial begin

    $monitor("|Time =%0t|Dout = %b|",$time,Dout);
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
end


initial begin
    #180
  $finish;
end
endmodule