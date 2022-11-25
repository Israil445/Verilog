module BCD(B,E);

input [3:0] E;
output [3:0] B;

assign B[0]=~E[0];
assign B[1]=E[1]^E[0];
assign B[2]=((~E[2]&~E[1])|(~E[2]&~E[0])|(E[2]&E[1]&E[0]));
assign B[3]=(E[3]&(E[2]|(E[1]&E[0])));


endmodule
