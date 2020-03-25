// ECE5440
// Jose Navarro, 4207
// buttonShaper
//This module converts the traditional negative logic input of a button and turns it into a single 
//positive pulse signal
module buttonShaper(clk, rst, buttonInput, buttonOutput); 

	input clk, rst, buttonInput;
	output buttonOutput;
	reg buttonOutput;
	reg [1:0] state, nextState;

	parameter initialState = 2'b00;
	parameter pulseState = 2'b01;
	parameter waitState = 2'b10;
	parameter state3 = 2'b11;
	
	always @ (posedge clk)
		begin
			if(rst == 0) //might be a one but not sure
				begin
					state <= initialState;
				end
			else
				begin
					state <= nextState;
				end
		end

	always @ (state, buttonInput)
		begin
			case(state)
				initialState:
					begin
						buttonOutput = 1'b0;
						if(buttonInput == 1)
							begin
								nextState <= initialState;
							end
						else
							begin
								nextState <= pulseState;
							end
					end
				pulseState:
					begin
						buttonOutput = 1'b1;
						nextState <= waitState;
					end
				waitState:
					begin
						buttonOutput = 1'b0;
						if(buttonInput == 1)
							begin
								nextState <= initialState;
							end
						else
							begin
								nextState <= waitState;
							end
					end
				default:
					begin
						buttonOutput = 1'b0;
						nextState = initialState;
					end
			endcase
		end
endmodule 