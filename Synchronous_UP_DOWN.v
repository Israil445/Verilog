
module jkff(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(y, a, y_bar);
	nand(y_bar, y, clear, b);
	not(c_bar, clk);
	nand(c, y, c_bar);
	nand(d, y_bar, c_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, clear, d);
endmodule


module Syn_UP_DOWN(q,M,clk,clear);
//M-->0 Down_count
//M-->1 UP_Count

input M,clk,clear;
output [2:0] q;

wire ja,ka,jb,kb,jc,kc;

assign jc=1;
assign kc=1;

jkff fc(q[0], ,jc,kc,clear,clk);


assign jb=~(M^q[0]);
assign kb=~(M^q[0]);

jkff fb(q[1], ,jb,kb,clear,clk);


assign ja=((~M&~q[1]&~q[0])|(M&q[1]&q[0]));
assign ka=((~M&~q[1]&~q[0])|(M&q[1]&q[0]));

jkff fa(q[2], ,ja,ka,clear,clk);




endmodule


