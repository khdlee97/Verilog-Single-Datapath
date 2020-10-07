module RegisterFile(input clock,
					input clear,
					input[4:0] read_index1,
					output[31:0] read_data1,
					input[4:0] read_index2,
					output[31:0] read_data2,
					input write,
					input[4:0] write_index,
					input[31:0] write_data);

	reg[31:0] content[31:0];
	integer i;

	always @(posedge clear, negedge clock)
		if (clear) begin
			// Reset all registers
				for (i = 0; i < 32; i = i + 1)
					content[i] = 0;
			
				end else if (write) begin
					content[write_index] = write_data;
					$display("\tR[%d] = %x (hex)", write_index, write_data);
				end

	// A read to register 0 always returns 0
	assign read_data1 = read_index1 == 0 ? 0 : content[read_index1];
	assign read_data2 = read_index2 == 0 ? 0 : content[read_index2];

endmodule