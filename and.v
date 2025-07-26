module and_gate(a,b,y);
input a,b;
output y;
assign y=a&b;
endmodule

module and_tb();
reg a,b;
wire y;
and_gate uut(.a(a),.b(b),.y(y));

initial begin 
a=0;
 b=0;
 #100;
a=0;
 b=1; 
#100;
a=1;
 b=0;
 #100;
a=1; 
b=1; 
#100;
end
initial $monitor ("y=%d",y);
endmodule
