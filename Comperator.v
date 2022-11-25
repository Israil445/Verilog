module Comperator(A,B,A_greater_B,A_equal_B,A_less_B);

input [1:0] A,B;
output A_greater_B,A_equal_B,A_less_B;

assign A_greater_B=((A[1]&~B[1])|(A[0]&~B[1]&~B[0])|(A[1]&A[0]&~B[0]));
assign A_equal_B=(~(A[0]^B[0])&~(A[1]^B[1]));
assign A_less_B=((~A[1]&B[1])|(~A[0]&B[1]&B[0])|(~A[1]&~A[0]&B[0]));



endmodule
