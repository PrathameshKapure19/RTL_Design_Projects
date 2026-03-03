module multiplier_2bit(
input  [1:0]A,
input  [1:0]B,
output [3:0]P
    );
 wire w1,w2,w3,w4;
 
assign P[0] = A[0] & B[0];
assign w1   = A[1] & B[0];
assign w2   = A[0] & B[1];
half_adder HA1(w1,w2,P[1],w3);
assign w4   = A[1] & B[1];
half_adder HA2 (w3,w4,P[2],P[3]);
endmodule
