// Code your design here
module half_adder (a,b,s,c);
  input a,b;// 1 bit
  output s,c;
  
  //assign {c,s} = a+b;
  
//   assign s = a^b;
//   assign c = a&b;
  
  xor x1(s,a,b);
  and x2(c,a,b);
 
endmodule 


// Code your testbench here
// or browse Examples
module tb_half();
  
  reg a,b;
  wire s,c;
  
  half_adder h1 (
    .a(a),
    .b(b),
    .s(s),
    .c(c)
    
  );
  
  
  initial 
    begin
   
      
      #5 a=1'b0;b=1'b0;
      #5 a=1'b0;b=1'b1;
      #5 a=1'b1;b=1'b0;
      #5 a=1'b1;b=1'b1;
      
      
    end
  
  
  
endmodule