//ECE 5440
//Author: Jose Navarro
//loadRegister
//This module acts as a confirmation to player input before displaying on the seven segment display
module loadRegister(clk, rst, loadPlayer, playerInput, playerOutput);

	input clk, rst, loadPlayer;
	input [3:0] playerInput;
	output [3:0] playerOutput;
	reg [3:0] playerOutput;

	always @ (posedge clk)
		begin
			if(rst == 0)
				begin
					playerOutput <= 0;
				end
			else
				begin
					if(loadPlayer == 1) 
						begin
							playerOutput <= playerInput;
						end
				end
		end
endmodule 
