module FULL_ADDER(A,B,Cin,SUM,Cout);

input A,B,Cin;
output SUM,Cout;

assign {Cout,SUM} = A+B+Cin;


endmodule


module ADD_SUB(a,b,m,s,c);

input [3:0] a,b;
input m;

output [3:0] s;
output c;

wire [3:0] w;

wire c1,c2,c3;

xor x1(w[0],m,b[0]);
xor x2(w[1],m,b[1]);
xor x3(w[2],m,b[2]);
xor x4(w[3],m,b[3]);

FULL_ADDER FA1(a[0],w[0],m,s[0],c1);
FULL_ADDER FA2(a[1],w[1],c1,s[1],c2);
FULL_ADDER FA3(a[2],w[2],c2,s[2],c3);
FULL_ADDER FA4(a[3],w[3],c3,s[3],c);



endmodule


module tb_ADDSUB();

reg [3:0] A,B;
reg M;

wire [3:0] S;
wire C;

ADD_SUB AS(
      .a(A),
      .b(B),
      .m(M),
      .s(S),
      .c(C)
   );

  initial 
     begin
       #10 A=4'b1000;B=4'b0010;M=0;
       #10 A=4'b1000;B=4'b0010;M=1;
       #10 A=4'b1010;B=4'b1101;M=0;
       #10 A=4'b1010;B=4'b1101;M=1;
  
     end

endmodule