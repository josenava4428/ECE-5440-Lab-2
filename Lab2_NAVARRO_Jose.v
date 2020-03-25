// ECE5440
// Jose Navarro, 4207
// Lab2_Navarro_Jose
//This module calls all other modules in the folder and uses them in order to create the Games Access Contrl on FPGA Lab
module Lab2_NAVARRO_Jose(clk, rst, confirmNumPlayer1, confirmNumPlayer2, accessButton, switch1, switch2, switchAccess, seg1, seg2, segSum, red1, green1, red2, green2);

	input [3:0]  switch1, switch2;
	output [6:0] seg1, seg2, segSum;
	output red1, green1;
	wire [3:0] sum;

	input clk, rst, confirmNumPlayer1, confirmNumPlayer2, accessButton;
	output red2, green2;
	input [3:0] switchAccess;
	wire confirmNumPlayer1Output, confirmNumPlayer2Output, accessButtonOutput;
	wire loadPlayer1Pass, loadPlayer2Pass;
	wire [3:0] player1Num, player2Num; 

	buttonShaper player1ButtonShaper(clk, rst, confirmNumPlayer1, confirmNumPlayer1Output);
	buttonShaper player2ButtonShaper(clk, rst, confirmNumPlayer2, confirmNumPlayer2Output);
	buttonShaper accessControlButtonShaper(clk, rst, accessButton, accessButtonOutput);
	
	accessController accessController_1(clk, rst, confirmNumPlayer1Output, confirmNumPlayer2Output, switchAccess, accessButtonOutput, loadPlayer1Pass, loadPlayer2Pass, green2, red2);

	loadRegister loadRegister_1(clk, rst, confirmNumPlayer1, switch1, player1Num);
	loadRegister loadRegister_2(clk, rst, confirmNumPlayer2, switch2, player2Num);

	adder adder_1(player1Num, player2Num, sum);

	sevenSegDecoder segNum1(player1Num, seg1);
	sevenSegDecoder segNum2(player2Num, seg2);
	sevenSegDecoder segSumation(sum, segSum); 

	ledToggle led(sum, red1, green1); 
	
endmodule
