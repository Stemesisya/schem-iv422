module test();
	logic clk,reset;
	logic tick, d, result;
	logic resultExpected;
	logic [100:0] testIndex, errors;
	logic [3:0] testvectors [100:0];

	module_flop_r m1(.clk(tick), .reset(reset), .d(d), .q(result));
	
	always begin
		clk=1; #5; clk=0; #5;
	end

	initial begin
        tick = 1;
        d = 0;
		$readmemb ("lab6/task2/test.txt", testvectors);
		testIndex =0;
		errors=0;
		reset =1; #27; reset=0;
	end

	always @(posedge clk) begin
		#1; {tick, d, reset, resultExpected} = testvectors [testIndex];
	end

	always @(negedge clk)
	begin
		if (~reset)
		begin
			if (result!==resultExpected)
			begin
				$display("[%d] Error result: inputs = d:%b, clk:%b, reset:%b", testIndex, d, tick, reset);
				$display(" result = %b (%b expected)", result, resultExpected);
				errors = errors+1;
			end
			
			testIndex = testIndex+1;
			if (testvectors[testIndex]===4'bx)
			begin
				$display("%d tests completed with %d errors", testIndex, errors);
				$stop;
			end
		end
	end
endmodule