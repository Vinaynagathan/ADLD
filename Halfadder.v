module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
assign sum=a^b;
assign carry=a&b;
endmodule

module haldadder_tb();
reg a,b;
wire sum,carry;
half_adder uut(.a(a),.b(b),.sum(sum),.carry(carry));
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
initial $monitor("sum=%b,carry=%b",sum,carry);
endmodule
