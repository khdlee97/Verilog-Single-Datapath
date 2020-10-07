module Main;
	// Processor
	reg clock;
	reg clear;
	Datapath datapath(clock, clear);
	
	// Initial pulse for 'clear'
	initial begin
		clear = 1;
		#5 clear = 0;
	end

	// Clock signal
	initial begin
		clock = 1;
		forever #5 clock = ~clock;
	end
	
	// Run for 11 cycles
	initial begin
		#110 $finish;
	end
endmodule