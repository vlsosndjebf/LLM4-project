//I am trying to create a Verilog model for a sequence detector. It must meet the following specifications:


//The port names (and module name) must match the testbench exactly:
module sequence_detector(
  input  wire       clk,
  input  wire       reset_n,     // active-low, synchronous
  input  wire [2:0] data,
  output reg        sequence_found
);

//While enabled (no separate enable signal is used—always active), it should detect the following sequence of 3-bit input symbols, sampled on the rising edge of clk:
//- 3'b001
//- 3'b101
//- 3'b110
//- 3'b000
//- 3'b110
//- 3'b110
//- 3'b011
//- 3'b101

//Additional requirements to pass simulation/synthesis:
//- **Verilog-2001 only** (not SystemVerilog): no `logic`, no `typedef`/`enum`, no parameter arrays or `'{...}` array literals, no `always_ff/always_comb`, no `unique/priority`.
//- Implement a **Mealy FSM** with states S0..S8. Encode with one-per-line `localparam [3:0] S0=4'd0; ... S8=4'd8;`.
//- Declare each pattern symbol as its own `localparam [2:0] P0=3'b001; ... P7=3'b101;` (no arrays).
//- Use **two always blocks**:
//  1) `always @(posedge clk)` for the state register (synchronous active-low reset with `!reset_n`) and
//  2) `always @*` for `next_state` **and** the Mealy output.
//- **Single-cycle, same-cycle pulse**: drive `sequence_found = 1'b1` only when `(state==S7 && data==P7)` in the combinational block; otherwise `sequence_found = 1'b0`.
//- Overlap support: on mismatch from `Sk`, if `data==P0` go to `S1` else `S0`. After a full match, compute the next state the same way (this allows overlaps).
//- Use nonblocking `<=` in the sequential block and blocking `=` in the combinational block. Provide default assignments in `always @*` to avoid latches.
//- Output **only** the synthesizable Verilog-2001 module source code (no testbench, no extra text).

//How would I write a design that meets these specifications?
