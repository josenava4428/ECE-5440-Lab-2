// ECE5440
// Jose Navarro, 4207
// accessController
//This module calls the accessControl and ensures that it is working as intended. 
`timescale 10ns/100ps
module accessController_tb();

	reg[3:0] passIn;
	reg Clk, Rst, loadPass, p1_Load, p2_Load;
	wire p1_LoadOut, p2_LoadOut, green, red;
	
	accessController DUT_accessController_1(Clk, Rst, p1_Load, p2_Load, passIn, loadPass, p1_LoadOut, p2_LoadOut, green, red);

	always
 begin
 #10 Clk = 1;
 #10 Clk = 0;
 end
 initial
 begin
 // Following three signals come from the output of
 // the button shaper.
 // Need to generate a single cycle pulse when
 // the button is pushed.
 p1_Load = 0;
 p2_Load = 0;
 loadPass = 0;

 Rst = 1;
 @(posedge Clk);
 @(posedge Clk);
// Reset the system
 Rst = 0;
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 Rst = 1;
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
// test inputing incorrect pass
// align the the next rising clock edge
 @(posedge Clk);
// Change data 5 ns after the rising edge of the clock
 #5 passIn = 4'b0000;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
 @(posedge Clk);
 #5 passIn = 4'b0011;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
 @(posedge Clk);
 #5 passIn = 4'b0010;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
 @(posedge Clk);
 #5 passIn = 4'b0011;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
// Test if the Access Controll blocks the player's load signals
// before the board is authenticated
// P1_LoadOut should remain 0.
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 #5 p1_Load = 1;
 @(posedge Clk);
 #5 p1_Load = 0;
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
// P2_LoadOut should remain 0.
 #5 p2_Load = 1;
 @(posedge Clk);
 #5 p2_Load = 0;
// test inputing correct pass
// Password "1234"
// Replace with your LAST FOUR DIGITS OF ID
 @(posedge Clk);
 #5 passIn = 4'b0100;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
 @(posedge Clk);
 #5 passIn = 4'b0010;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
 @(posedge Clk);
 #5 passIn = 4'b0000;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
 @(posedge Clk);
 #5 passIn = 4'b0111;
 @(posedge Clk);
 #5 loadPass = 1;
 @(posedge Clk);
 #5 loadPass = 0;
// Test if the Access Controll blocks the player's load signals
// after the board is authenticated
// P1_LoadOut should be 1 for one cycle.
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 #5 p1_Load = 1;
 @(posedge Clk);
 #5 p1_Load = 0;
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
// P2_LoadOut should be 1 for one cycle.
 #5 p2_Load = 1;
 @(posedge Clk);
 #5 p2_Load = 0;
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 @(posedge Clk);
 end
endmodule 