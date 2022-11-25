
//0000->1101->1011->1001->0110->1100->0011->1111->0000

module j_k_ff(q, q_bar, j, k, clear, clk);
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

module Random_Seq_Counter(q,clear,clk);

input clear,clk;
output [3:0] q;

wire ja,ka,jb,kb,jc,kc,jd,kd;

assign ja=(~q[1]&~(q[3]^q[2]));
assign ka=((~q[0]&~q[3])|(q[0]&q[1]&q[2])|(~q[0]&q[3]&q[2]));
j_k_ff A(q[0], ,ja,ka,clear,clk);


assign jb=(q[3]&(q[0]|q[2]));
assign kb=(q[2]|q[3]|(q[1]&~q[0]));
j_k_ff B(q[1], ,jb,kb,clear,clk);

assign jc=((~q[3]&~(q[0]^q[1]))|(~q[1]&q[0]&q[3]));
assign kc=(~q[1]|q[3]|(~q[3]&q[0]));
j_k_ff C(q[2], ,jc,kc,clear,clk);


assign jd=((q[2]&q[1]&~q[0])|(~q[0]&~q[1]&~q[2]&~q[3])|(q[0]&q[1]&~q[2]&~q[3]));
assign kd=((q[1]&~q[0])|(q[0]&q[1]&q[2])|(~q[0]&~q[1])|(q[3]&~q[2]&~q[1]));
j_k_ff D(q[3], ,jd,kd,clear,clk);







endmodule
