module jk_ff(q, q_bar, j, k, clear, clk);
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

module Ripple_Counter(q,q_bar,clear,clk);

input clk,clear;
output [3:0] q,q_bar;

jk_ff jk1(q[0],q_bar[0],1,1,clear,clk);
jk_ff jk2(q[1],q_bar[1],1,1,clear,q[0]);
jk_ff jk3(q[2],q_bar[2],1,1,clear,q[1]);
jk_ff jk4(q[3],q_bar[3],1,1,clear,q[2]);


endmodule





