
module tb;
reg  [1:0]A;
reg  [1:0]B;
wire [3:0]P;

multiplier_2bit DUT(
.A(A),
.B(B),
.P(P)
);
integer i,j;
initial begin

for(i = 0 ;i < 4;i = i + 1)
begin   
        
    for(j = 0 ;j<4;j = j+ 1)
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