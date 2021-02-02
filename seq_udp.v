primitive Dff(q,d, clk,rst);
output q;
input clk, rst, d;
reg q;
initial q = 0;
table
	// d clk  rst : old q:q
	   ? ?    0   :  ?   :0;
	   0 R    1   :  ?   :0;
	   1 (01) 1   :  ?   :1; 
	   ? N    1   :  ?   :-; 
	   * ?    1   :  ?   :-;
	   ? ?    (0?):  ?   :-; 
endtable
endprimitive
