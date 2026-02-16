module tb_JK;
reg clk;
reg rst;
reg J,K;
wire q;
wire q_bar;
ff_JK DUT
(
    .clk(clk),
    .rst(rst),
    .J(J),
    .K(K),
    .q(q),
    .q_bar(q_bar)
);

initial clk = 1'b0;
always #10 clk = ~clk;

integer i;
initial begin
rst = 1'b0;
J = 1'b0;
K = 1'b0;
#20
rst = 1'b1;
$monitor("|Time = %0t|J = %0b|K = %0b|Q = %0b|Q_bar = %0b|",$time,J,K,q,q_bar);
for(i = 0;i < 4; i++ )
begin
    {J,K} = i;
    #20;
end
$finish;
end
initial begin
    $dumpfile("dump1.vcd");
    $dumpvars(0,tb_JK);
end
endmodule