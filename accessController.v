// ECE5440
// Jose Navarro, 4207
// accessController
// This module allows or denies access to the user depending upon user passoword input in order to play the mental binary math game
module accessController(clk, rst, loadPlayer1, loadPlayer2, passWord, passWordEnter, loadPlayer1Pass, loadPlayer2Pass, green, red);

	input clk, rst, loadPlayer1, loadPlayer2, passWordEnter;
	input [3:0] passWord;
	output loadPlayer1Pass, loadPlayer2Pass, green, red;
	reg loadPlayer1Pass, loadPlayer2Pass, green, red;
	reg passWordFlag;

	reg [2:0] state;
	parameter state0 = 3'b000, state1 = 3'b001;
	parameter state2 = 3'b010, state3 = 3'b011;
	parameter state4 = 3'b100, state5 = 3'b101;
	
	always @ (posedge clk)
		begin
			if(rst == 0)
				begin
					state <= state0;
				end
			else
				begin
					case(state)
						state0:
							begin
								loadPlayer1Pass <= 1'b0; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								passWordFlag = 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0100)
											begin
												//good
											end
										else
											begin
												//not good forever, update flag
												passWordFlag = 1'b0;
											end
										//go to next state
										state <= state1;
									end
								else
									begin
										//stay in this state
										state <= state0;
									end
							end
						state1:
							begin
								loadPlayer1Pass <= 1'b0; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0010)
											begin
												//good
											end
										else
											begin
												//not good forever
												passWordFlag = 1'b0;
											end
										state <= state2;
									end
								else
									begin
										//stay in this state
										state <= state1;
									end
							end
						state2:
							begin
								loadPlayer1Pass <= 1'b0; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0000)
											begin
												//good
											end
										else
											begin
												//not good forever
												passWordFlag = 1'b0;
											end
										state <= state3;
									end
								else
									begin
										//stay in this state
										state <= state2;
									end
							end
						state3:
							begin
								loadPlayer1Pass <= 1'b0; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0111)
											begin
												//good
											end
										else
											begin
												//not good forever
												passWordFlag = 1'b0;
											end
										state <= state4;
									end
								else
									begin
										//stay in this state
										state <= state3;
									end
							end
						state4:
							begin
								if(passWordFlag == 1'b1)
									begin
										state <= state5;			
									end
								else
									begin
										state <= state0;
									end
							end
						state5:
							begin
								red <= 1'b0;
								green <= 1'b1;
								loadPlayer1Pass <= loadPlayer1;
								loadPlayer2Pass <= loadPlayer2;
								if(passWordEnter == 1'b1)
									begin
									state <= state0;
									end
							end
						default:
							begin
								state <= state0;
								passWordFlag = 1'b1;
							end
					endcase
				end
		end
endmodule

