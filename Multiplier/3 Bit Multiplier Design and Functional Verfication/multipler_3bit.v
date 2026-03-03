module multiplier_3bit(
input  [2:0]A,
input  [2:0]B,
output [5:0]P
    );
 wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
 assign P[0] = A[0] & B[0];
  
 assign w1   = A[1] & B[0];
 assign w2   = A[0] & B[1];
 half_adder  HA1 (w1,w2,P[1],w3);
 
 assign w4   = A[2] & B[0];
 assign w5   = A[1] & B[1];
 full_adder FA1(w3,w4,w5,w6,w7); 
 
 assign w8   = A[2] & B[1];
 half_adder  HA2(w7,w8,w10,w9);
  
 assign w11 = A[0] & B[2];
 half_adder  HA3(w6,w11,P[2],w12); 
 
 assign w13 = A[1] & B[2];
 full_adder  FA2(w13,w10,w12,P[3],w14);
 
 assign w15 = A[1]& B[2];
 full_adder  FA3(w15,w9,w14,P[4],P[5]); 
    
 
    
endmodule