module FullAdder(input a,b,cin, output sum,carry)
assign sum=a^b^cin;
assign carry=a&b|b&cin|cin&a;
end 

module FullAdder_tb();
reg a,b,cin=0;
wire sum,carry;
fullAdder uut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial begin
a=0;
b=0;
cin=0;
end
always #10 a=a+1;
always #20 b=b+1;
always #40 cin=cin+1;

initial $monitor("sum=%b,carry=%b",sum,carry);
$finish; 
endmodule
