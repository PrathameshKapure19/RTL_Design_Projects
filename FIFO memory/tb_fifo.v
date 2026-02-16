`include "fifo.v"
module tb_fifo;
    reg rst;
    reg clk;
    reg wr_en;
    reg rd_en;
    reg [3:0]din;
    wire full , empty;
    wire [3:0]dout;

    fifo DUT
    (
        .rst(rst),
        .clk(clk),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .full(full),
        .empty(empty),
        .dout(dout)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    task write(input [3:0] in);
    begin
        @(posedge clk);
            wr_en = 1'b1;
            din   = in;
            $display("|%0t  |Data write: |DIN = %b|",$time,in);
        @(posedge clk);
            wr_en = 1'b0;
    end
    endtask

    task read;
    begin
         @(posedge clk);
            rd_en = 1'b1;
            
         @(posedge clk);
            rd_en = 1'b0;
        @(posedge clk);
            $display("|%0t  |Data read: |DOUT = %b|",$time,dout);
    end 
    endtask

    initial begin
        rst   = 1'b0;
        din   = 4'd0;
        rd_en = 1'b0;
        wr_en = 1'b0;
        #10
        rst = 1'b1;

     

    /*
        write(4'd12);#10
        read();#10
        write(4'd1);#10
        read();#10
        write(4'd13);#10
        read();#10
    */

        write(4'd12);#10
        write(4'd1);#10
        write(4'd13);#10
        #10

        read();#10
        read();#10
        read();#10

        $finish;
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb_fifo);
    end

endmodule