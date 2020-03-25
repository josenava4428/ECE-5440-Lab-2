// ECE5440
// ECE5440
// Jose Navarro, 4207
// sevenSegDecoder
// This module takes 4 bit binary inputs and converts them to 7 bit
// binary inputs that can be used by the seven segment display to 
// display numbers in hexadecimal up to 15 (F).
module sevenSegDecoder(numIn, numOut);

	input [3:0] numIn;
	output [6:0] numOut;
	reg [6:0] numOut;
	always @ (numIn)
		begin
		case(numIn)
			4'b0000: begin numOut = 7'b1000000; end
			4'b0001: begin numOut = 7'b1111001; end
			4'b0010: begin numOut = 7'b0100100; end
			4'b0011: begin numOut = 7'b0110000; end
			4'b0100: begin numOut = 7'b0011001; end
			4'b0101: begin numOut = 7'b0010010; end
			4'b0110: begin numOut = 7'b0000010; end
			4'b0111: begin numOut = 7'b1111000; end
			4'b1000: begin numOut = 7'b0000000; end
			4'b1001: begin numOut = 7'b0011000; end
			4'b1010: begin numOut = 7'b0001000; end
			4'b1011: begin numOut = 7'b0000011; end
			4'b1100: begin numOut = 7'b1000110; end
			4'b1101: begin numOut = 7'b0100001; end
			4'b1110: begin numOut = 7'b0000110; end
			4'b1111: begin numOut = 7'b0001110; end
			default: begin numOut = 7'b1111111; end
		endcase
	end
endmodule 
