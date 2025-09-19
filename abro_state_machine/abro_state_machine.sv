//I am trying to create a Verilog model for an ABRO state machine. It must meet the following specifications:


//port name should match tb AND the module name must be exactly:
module abro_state_machine(
  input  wire clk,
  input  wire rst_n,      // active-low, ASYNCHRONOUS
  input  wire A,
  input  wire B,
  output      O,          // NOTE: O is NOT a reg; combinational assign is required
  output reg [3:0] State  // one-hot state output
);

//Verilog-2001 ONLY (not SystemVerilog): no 'logic', no enum/typedef, no array literals, no always_ff/always_comb.

//State definitions (use parameter, one per line, with these exact encodings):
// parameter [3:0] S_IDLE = 4'b0001;
// parameter [3:0] S_A    = 4'b0010;
// parameter [3:0] S_B    = 4'b0100;

//Sequential logic (single block):
//- Put **all state transitions** in one `always @(posedge clk or negedge rst_n)` block.
//- **Asynchronous reset**: when `!rst_n`, force `State <= S_IDLE` immediately.

//State transition rules (case on `State`, evaluated on the rising edge of `clk`):
//- S_IDLE:
//    if (A==1 && B==0) next -> S_A;
//    else if (A==1 && B==1) next -> S_B;
//    else next -> S_IDLE; // covers 00 and 01
//- S_A:
//    if (A==1 && B==0) next -> S_A;
//    else if (A==0 && B==1) next -> S_IDLE;
//    else /* 00 or 11 */ next -> S_B;
//- S_B:
//    if (A==1 && B==0) next -> S_A;
//    else if (A==0 && B==1) next -> S_IDLE;
//    else /* 00 or 11 */ next -> S_B;
//- default: next -> S_IDLE; // safety

//Combinational output logic (outside the always block):
//- `O` depends only on inputs, not on the state.
//- Implement exactly: `assign O = A & B;`

//Produce ONLY the synthesizable Verilog-2001 module source for 'abro_state_machine'; no testbench or extra text.

//How would I write a design that meets these specifications?
