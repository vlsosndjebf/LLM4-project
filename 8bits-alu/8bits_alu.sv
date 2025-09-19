//Please write a Verilog-2001 module named `alu_8bit` with the exact ports:

//Constraints:
//- Verilog-2001 only. Use plain ASCII quotes in literals (e.g., 4'b0000, 8'h00). No typographic quotes like 4’b0000.
//- No SystemVerilog keywords (no logic/enum/always_ff/always_comb).
//- Do NOT use any continuous assignment to alu_out (no `assign alu_out = ...`). Drive alu_out ONLY inside one combinational `always @(*)` with a `case (alu_sel)`; use blocking `=` in that always block.
//- Create a 9-bit wire for (a + b) and derive carry-out ONLY from that sum, independent of alu_sel:
//  `wire [8:0] sum9 = {1'b0, a} + {1'b0, b};`
//  `assign alu_cout = sum9[8];`

//Operation decode (8-bit results):
//- 4'b0000: alu_out = a + b;
//- 4'b0001: alu_out = a - b;
//- 4'b0010: alu_out = a * b;          // use low 8 bits
//- 4'b0011: alu_out = a / b;          // assume b != 0
//- 4'b0100: alu_out = a << 1;
//- 4'b0101: alu_out = a >> 1;
//- 4'b0110: alu_out = {a[6:0], a[7]}; // rotate left by 1
//- 4'b0111: alu_out = {a[0], a[7:1]}; // rotate right by 1
//- 4'b1000: alu_out = a & b;
//- 4'b1001: alu_out = a | b;
//- 4'b1010: alu_out = a ^ b;
//- 4'b1011: alu_out = ~(a | b);       // NOR
//- 4'b1100: alu_out = ~(a & b);       // NAND
//- 4'b1101: alu_out = ~(a ^ b);       // XNOR
//- 4'b1110: alu_out = (a >  b) ? 8'd1 : 8'd0;
//- 4'b1111: alu_out = (a == b) ? 8'd1 : 8'd0;
//- default: alu_out = a + b;

//Output only the synthesizable Verilog-2001 source for `alu_8bit` (no testbench, no extra text).

module alu_8bit (
  input  [7:0] a,
  input  [7:0] b,
  input        cin,
  input  [3:0] alu_sel,
  output reg [7:0] alu_out,
  output       alu_cout
);
