module tb_D;
reg  clk;
reg  rst;
reg  din;
wire q;

ff_D dut
(
    .clk(clk),
    .rst(rst),
    .din(din),
    .q(q)
);

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    rst = 1'b0;
    din = 1'b0;
    #10
    rst = 1'b1;
  $monitor("|Time = %0t|din = %0b|q = %0b|",$time,din,q);
    din = 1'b1;#10
    din = 1'b0;#10
    din = 1'b1;#10
    din = 1'b1;#10
    din = 1'b0;

    #60;
    $finish;
end
initial begin
    $dumpfile("dump1.vcd");
    $dumpvars(0,tb_D);
end
endmodule