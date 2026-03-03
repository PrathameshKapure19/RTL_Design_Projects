
module multiplier_4bit(
input  [3:0]A,
input  [3:0]B,
output [7:0]P
    );
   wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,s1,s2,s3,s4,s5,s6;
   
    assign P[0] = A[0] & B[0];
    
    assign w1   = A[0] & B[1];
    assign w2   = A[1] & B[0];
    half_adder HA1(w1,w2,P[1],c1);
   
    assign w3   = A[1] & B[1];
    assign w4   = A[2] &  B[0];
    full_adder FA1(w3,w4,c1,s1,c2);
    
    assign w5   = A[2] &  B[1];
    assign w6   = A[3] &  B[0];
    full_adder FA2(w5,w6,c2,s2,c3);
    
    assign w7   = A[3] &  B[1];
    half_adder HA2(w7,c3,s3,c4);
    
    assign w8   = A[0] & B[2];
    half_adder HA3(w8,s1,P[2],c5);  
    
    assign w9   = A[1] & B[2];
    full_adder FA3(w9,s2,c5,s4,c6);
    
    assign w10  = A[2] & B[2];
    full_adder  FA4(w10,s3,c6,s5,c7);
    
    assign w11 =  A[3] & B[2];
    full_adder  FA5(w11,c4,c7,s6,c8);
    
    assign w12 = A[0] & B[3];
    half_adder HA4(w12,s4,P[3],c9);
    
    assign w13 = A[1] & B[3];
    full_adder FA6(w13,s5,c9,P[4],c10);
    
    assign w14 = A[2] & B[3];
    full_adder FA7(w14,s6,c10,P[5],c11);
    
    assign w15 = A[3] & B[3];
    full_adder FA8(w15,c8,c11,P[6],P[7]);
endmodule
