module full_adder(a,b,cin,s,cout);

input a,b,cin;
output s,cout;

assign {cout,s}=a+b+cin;


endmodule

module tb_full();

reg A,B,Cin;
wire Cout,S;

full_adder FA(
        .a(A),
        .b(B),
        .cin(Cin),
        .s(S),
        .cout(Cout)
);


initial
   begin
      #5 A=1'b0;B=1'b0;Cin=1'b0;
      #5 A=1'b0;B=1'b0;Cin=1'b1;
      #5 A=1'b0;B=1'b1;Cin=1'b0;
      #5 A=1'b0;B=1'b1;Cin=1'b1;
      #5 A=1'b1;B=1'b0;Cin=1'b0;
      #5 A=1'b1;B=1'b0;Cin=1'b1;
      #5 A=1'b1;B=1'b1;Cin=1'b0;
      #5 A=1'b1;B=1'b1;Cin=1'b1;
   end



endmodule
