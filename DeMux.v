module Demux(in,sel,out);

input in;
input [1:0] sel;

output [3:0] out;
reg [3:0] out;

always@(in,sel)
 begin
   case(sel)
     2'b00:begin 
            out[0]=in;
            out[1]=1'b0;
            out[2]=1'b0;
            out[3]=1'b0;
           end

     2'b01:begin 
            out[0]=1'b0;
            out[1]=in;
            out[2]=1'b0;
            out[3]=1'b0;
           end

     2'b10:begin 
            out[0]=1'b0;
            out[1]=1'b0;
            out[2]=in;
            out[3]=1'b0;
           end
      2'b11:begin 
            out[0]=1'b0;
            out[1]=1'b0;
            out[2]=1'b0;
            out[3]=in;
           end
      default: out=4'b0000;

   endcase
 end



endmodule

module tb_Demux();

reg in;
reg [1:0] sel;

wire [3:0] out;

Demux Dm(
       .in(in),
       .sel(sel),
       .out(out)
);


initial 
   begin
    #10 sel=2'b00;in=1'b0;
    #10 sel=2'b00;in=1'b1;
    #10 sel=2'b01;in=1'b0;
    #10 sel=2'b01;in=1'b1;
    #10 sel=2'b10;in=1'b0;
    #10 sel=2'b10;in=1'b1;
    #10 sel=2'b11;in=1'b0;
    #10 sel=2'b11;in=1'b1;
   end







endmodule
