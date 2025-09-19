//I am trying to create a Verilog model for a simulated dice roller. It must meet the following specifications:


//The port names and module name must match the testbench exactly:
module dice_roller(
  input  wire       clk,
  input  wire       rst_n,          // active-low, synchronous
  input  wire [1:0] die_select,     // 00=4-sided, 01=6-sided, 10=8-sided, 11=20-sided
  input  wire       roll,           // roll request
  output reg  [7:0] rolled_number   // 1..N (N in {4,6,8,20}); holds last result otherwise
);

//Behavior (clocked design):
//- Use **Verilog-2001 only** (not SystemVerilog): no 'logic', no typedef/enum, no arrays of parameters, no aggregate literals ' {...}', no always_ff/always_comb, no unique/priority.
//- Implement an **8-bit LFSR** (x^8+x^6+x^5+x^4+1 taps; new_bit = lfsr[7]^lfsr[5]^lfsr[4]^lfsr[3]).
//- Advance the LFSR **every clock** (or at least on a roll), with a non-zero seed after reset (e.g., 8'hA5). Synchronous reset: when !rst_n, seed LFSR and set rolled_number to 8'd0.
//- Detect the **rising edge of `roll`** using a one-cycle delay register (`roll_d`) and `roll_edge = roll & ~roll_d`.
//- On `roll_edge`, compute sides `N` from `die_select` (4,6,8,20), map the current LFSR value to **1..N** using `(lfsr % N) + 1`, and load `rolled_number` with that value; otherwise, hold its previous value.
//- Use two always blocks:
//  1) `always @(posedge clk)` for stateful regs (LFSR, roll_d, rolled_number) with nonblocking `<=` and synchronous active-low reset.
//  2) (Optional) a small combinational block to decode `die_select` to `N`; default to `N=20` for 2'b11.
//- Produce **only** synthesizable Verilog-2001 module code; no testbench or extra text.

//How would I write a design that meets these specifications?
