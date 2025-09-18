module ALU_4bit_tb;
reg[3:0]a,b;
reg[2:0]oper;
reg EN;
wire [7:0]data;

ALU_4bit unit(
	.a(a),
	.b(b),
	.oper(oper),
	.EN(EN),
	.data(data)
);
initial
begin
	a=4'b0000;b=4'b0000;EN=0;oper=3'b000;
	#10  EN=1;
	#10  a=4'b1000;b=4'b0111;
	for(oper=3'b000;oper<3'b111;oper=oper+1)
	#10;
end


endmodule
