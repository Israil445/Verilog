module MUX(I,Sel,Y);

input [3:0] I;
input [1:0] Sel;
output reg Y;

always@(Sel)

 begin
  case(Sel)
    2'b00:Y=I[0];
    2'b01:Y=I[1];
    2'b10:Y=I[2];
    2'b11:Y=I[3];
  endcase

end


endmodule

module tb_MUX();

reg [3:0] i;
reg [1:0] sel;
wire y;

MUX m(
  .I(i),
  .Sel(sel),
  .Y(y)
);

initial
  begin
      i=4'b1010;
      #10 sel=2'b00;
      #10 sel=2'b01;
      #10 sel=2'b10;
      #10 sel=2'b11;
  end

endmodule


