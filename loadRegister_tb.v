// ECE5440
// Jose Navarro, 4207
// loadRegister_tb
//This module calls the loadRegister module and ensures that it is properly working.
`timescale 10ns/100ps
module loadRegister_tb();

	reg clk;
	reg rst;
	reg loadPlayer1;
	reg [3:0] playerInput1;
	wire [3:0] playerOutput1;
	
	loadRegister DUT_loadRegister_1(clk, rst, loadPlayer1, playerInput1, playerOutput1);

	always
		begin
			#10 clk = 1;
			#10 clk = 0;
		end
	initial
		begin
			#70 rst = 0;
			loadPlayer1 = 0;
			playerInput1 = 4'b1011;
			#70 rst = 1;
			loadPlayer1 = 0;
			playerInput1 = 4'b1110;
			#70 rst = 0;
			loadPlayer1 = 1;
			playerInput1 = 4'b1010;
			#70 rst = 1;
			loadPlayer1 = 1;
			playerInput1 = 4'b1111;
		end
	
endmodule
