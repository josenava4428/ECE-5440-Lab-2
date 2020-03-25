// ECE5440
// Jose Navarro, 4207
// buttonShaper_tb
// This module calls the button shaper module and ensures that it is working as intended. 
`timescale 10ns/100ps
module buttonShaper_tb();
	reg clk;
	reg rst;
	reg buttonIn;
	wire buttonOut;
	
	buttonShaper DUT_buttonShaper_1(clk, rst, buttonIn, buttonOut);

	always
		begin
			#10 clk = 1;
			#10 clk = 0;
		end
	initial
		begin
			#3 rst = 0;
			buttonIn = 0;
			#20 rst = 1;
			buttonIn = 0;
			#40 rst = 0;
			buttonIn = 1;
			#70 rst = 1;
			buttonIn = 1;
		end
endmodule 