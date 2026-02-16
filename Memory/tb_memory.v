`include "memory.v"
module tb_ram;
   reg  rst;
   reg  clk;
   reg  [7:0]addr;
   reg  [7:0]din;
   reg  wr_en;
   wire [7:0]dout;

   RAM uut
   (
    .rst(rst),
    .clk(clk),
    .addr(addr),
    .din(din),
    .wr_en(wr_en),
    .dout(dout)
   );

   initial clk = 1'b0;
   always #5 clk = ~clk;

   task write(input [7:0] bits, input [7:0] address);
    begin
    addr = address;
    din  = bits;
    wr_en = 1'b1;
    @(posedge clk);
    $display("|Time = %t|addr = %b|din = %b",$time,addr,din);
   end
   endtask

   task read(input [7:0] address);
    begin
    addr = address;
    wr_en = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $display("|Time = %t|addr = %b|dout = %b",$time,addr,dout);
    end
   endtask

   initial begin
   rst = 1'b0;
   din = 8'd0;
   wr_en = 1'b0;
   #20;
   rst = 1'b1;
   write(8'd1, 8'd11); #10;
   write(8'd2, 8'd12); #10;
   write(8'd3, 8'd13); #10;

   read(8'd11); #10;
   read(8'd12); #10;
   read(8'd13); #10;
   
   $finish;
   end
   initial begin
    $dumpvars(0,tb_ram);
    $dumpfile("dump.vcd");
   end

endmodule