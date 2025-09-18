`timescale 1ns / 1ps

module tb_alu_8bit;
//Inputs
 reg		[7:0] a,b;
 reg 		[3:0] alu_sel;

//Outputs
 wire 	[7:0] alu_out;
 wire 	  alu_cout;
 // Verilog code for ALU
 integer i;
alu_8bit	alu_8bit_unit
(
	a,          // ALU operand A input
	b,          // ALU operand B input
	cin,        // carry-in
	alu_sel,    // operation select (ALU function)
	alu_out,    // ALU result output
	alu_cout    // carry-out
);
	initial begin
	// hold reset state for 100 ns.
	  a = 8'h0A;
	  b = 4'h02;
	  alu_sel = 4'h0;

	  for (i=0;i<=15;i=i+1)
	  begin
	   alu_sel = alu_sel + 8'h01;
	   #10;
	  end

	  a = 8'hF6;
	  b = 8'h0A;
	end
endmodule
