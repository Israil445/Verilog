module Excess3(D,Q);

input [3:0] D;
output [3:0] Q;

assign Q[3]=(D[3]|(D[0]&D[2])|(D[1]&D[2]));
assign Q[2]=(D[2]^(D[1]|D[0]));
assign Q[1]=((D[0]&D[1])|(~D[0]&~D[1]));
assign Q[0]=~D[0];


endmodule
