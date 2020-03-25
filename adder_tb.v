// ECE5440
// Jose Navarro, 4207
// adder_tb
// This module is used to test the adder module to ensure that it is 
// properly working 

`timescale 10ns/100ps
module adder_tb();

	reg [3:0] in1, in2;
	wire [3:0] out1;
	adder DUT_adder(in1, in2, out1);

	initial
		begin
			in1 = 0;
			in2 = 0;
			#10;
			in1 = 1;
			in2 = 2;
			#10;
			in1 = 4'b0011;
			in2 = 4'b1111;
	end
endmodule 
