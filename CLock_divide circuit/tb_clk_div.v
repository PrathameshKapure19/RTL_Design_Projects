
module tb_clk_module;
reg  rst;
reg  clk;
wire clk_pulse;
// Parameter overriding for visible outputs
clock_divide #(.max_freq(10))
uut
(
    .rst,
    .clk,
    .clk_pulse
);
//clk pulse generation of complete 10ns
initial clk   = 1'b0;
always #5 clk = ~clk;

initial 
begin
rst = 1'b1;#10;
rst = 1'b0;
#1000;
$finish;
end
initial
begin
    $dumpfile("clk_divide.vcd");
    $dumpvars(0,tb_clk_module);
end
endmodule
