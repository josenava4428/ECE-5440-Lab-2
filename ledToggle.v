module ledToggle(sum, red, green);

	input [3:0] sum;
	output red, green;
	reg red, green;

	always @ (sum)
		begin
		if (sum == 15)
			begin
			red = 0;
			green = 1;
			end 
		else
			begin
			red = 1; 
			green = 0;
		end
	end
endmodule			
