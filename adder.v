// ECE5440
// Jose Navarro, 4207
// This module adds two 4 bit binary numbers that are taken from pin
// inputs from the board and puts them into a variable named sum

module adder(num1, num2, sum);

	input [3:0] num1, num2;
	output [3:0] sum;
	reg [3:0] sum;
	always @ (num1, num2)
		begin
			sum = num1 + num2;
		end
endmodule 
