//I am trying to create a Verilog model binary_to_bcd_converter for a binary to binary-coded-decimal converter. It must meet the following specifications:
	
module binary_to_bcd_converter (
    input      [4:0] binary_input, // 5-bit binary input (0-31)
    output reg [7:0] bcd_output    // 8-bit BCD output {tens, ones}
);
  
//How would I write a design that meets these specifications?
