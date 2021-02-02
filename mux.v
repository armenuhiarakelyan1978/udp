`timescale 1ns/1ns
/*module mux(out,sel,a, b);
output out;
input sel, a, b;
mux mm(out,sel,a,b);
endmodule*/
primitive mux(out,sel,a, b);
output out;
input sel, a, b;
table
	// sel a b    out
	   0   1 ?  : 1;
	   0   0 ?  : 0;
	   1   ? 0  : 0;
	   1   ? 1  : 1;
	   x   0 0  : 0;
	   x   1 1  : 1;
endtable
endprimitive

module mux_tb;
reg sel, a, b;
wire out;
integer i;

mux mmm(out, sel, a, b);
initial
begin
	a <= 0 ; sel = 1;
	b <= 0;
	#1 a=1; b= 1;sel = 0;
	#2 a=0; b= 0;sel = 1;
	#3 a=1; b=0; sel = 0;
	#4 a=0; b=1; sel = 1;
end
initial
begin
	$dumpfile("udp_tb.vcd");
	$dumpvars();
end
endmodule
