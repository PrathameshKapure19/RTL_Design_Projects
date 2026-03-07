module tb1;
parameter DATA_WIDTH = 4;
reg clk = 1'b0;                         
reg rst;                         
reg load;                        
reg [DATA_WIDTH - 1:0]load_data; 
reg up_down;                     
wire [DATA_WIDTH - 1 :0]count;
wire overflow;  

UpDown_counter1 DUT(
    .clk(clk),
    .rst(rst),
    .load(load),
    .load_data(load_data),
    .up_down(up_down),
    .count(count),
    .overflow(overflow)
);   

always #5 clk = ~clk;
 initial begin
 rst  = 1'b0;
 load = 1'b0;
 load_data = 4'd0;
 up_down   = 1'b0;
 #20;

 rst = 1'b1;
 load = 1'b1;
 load_data = 4'b1010;
 #10;
 
 rst  = 1'b1;
 load = 1'b0;
 up_down = 1'b1;
 #160;
 up_down = 1'b0;
 #160;
 $finish;
 
 end
 endmodule
