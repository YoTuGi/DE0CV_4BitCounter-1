module _4BitCounter(
	input wire in_clk,
	input wire in_reset,
	output wire [3:0] out_count);

	parameter _4BIT_COUNTER_EXPIRED = 4'd9;
	//
	reg [3:0] _4bit_counter;
	wire is_4bit_counter_expired;
	//
	assign is_4bit_counter_expired = (_4bit_counter == _4BIT_COUNTER_EXPIRED)? 1'b1: 1'b0;
	//
	always @(posedge in_clk or posedge in_reset)
	begin
		if (in_reset)
			_4bit_counter <= 4'd0;
		else
		begin
			if (is_4bit_counter_expired)
				_4bit_counter <= 4'd0;
			else
				_4bit_counter <= _4bit_counter + 4'd1;
		end
	end
	//
	assign out_count = _4bit_counter;
	//
endmodule
