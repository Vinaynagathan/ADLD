module seq_detector (x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter s0=0,s1=1,s2=2,s3=3;
reg[0:1]ps,ns;  //present state and next state

always @(posedge clk or posedge reset)
if(reset) ps<=s0;
else ps<=ns;

always @(ps,x)
case (ps)
s0: begin 
z=x?0:0;
ns=x?s0:s1;
end
s1:begin 
z=x?0:0;
ns=x?s2:s1;
end
s2:begin  
z=x?0:0;
z=x?s3:s1;
end 
s3:begin
z=x?0:1;
z=x?s0:s1;
end 
endcase
endmodule 
module seq_detector_tb();
reg clk,x,reset;
wire z;
seq_detector seq(x,clk,reset,z);
initial begin 
clk=1'b0;
#15 reset =1'b0;
end
always #5 clk=~clk;
initial begin 
#12 x=0; #10 x=0; #10 x=1 ;#10 x=1;
#10 x=0; #10 x=1; #10 x=1 ;#10 x=0;
#10 x=0; #10 x=1; #10 x=1 ;#10 x=0;
#10 $finish;

end 
endmodule

