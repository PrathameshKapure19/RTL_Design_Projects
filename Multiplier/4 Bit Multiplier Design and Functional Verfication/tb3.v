
module tb3;
reg  [3:0]A;
reg  [3:0]B;
wire [7:0]P;

multiplier_4bit DUT(
.A(A),
.B(B),
.P(P)
);
integer i,j;
initial begin

for(i = 0 ;i < 16;i = i + 1)
begin   
        
    for(j = 0 ;j < 16;j = j+ 1)
    begin
         A = i;
         B = j;
         $display("|Time = %t|A = %d|B = %d|P = %d|",$time,A,B,P);
         #10;
    end
end
$finish;
end
endmodule