module test();
	logic clk,reset;
	logic tick, d, result;
	logic resultExpected;
	logic [100:0] testIndex, errors;
	logic [2:0] testvectors [100:0];

	module_flop m1(.clk(tick), .d(d), .q(result));
	
	always begin
		clk=1; #5; clk=0; #5;
	end

	initial begin
        tick = 1;
        d = 0; // Сбрасываем триггер, чтобы он показывал 0, а не X
		$readmemb ("task1/test.txt", testvectors);
		testIndex =0;
		errors=0;
		reset =1; #27; reset=0;
	end

	always @(posedge clk) begin
		#1; {tick, d, resultExpected} = testvectors [testIndex];
	end

	always @(negedge clk)
	begin
		if (~reset)
		begin
			if (result!==resultExpected)
			begin
				$display("[%d] Error result: inputs = d:%b, clk:%b", testIndex, d, tick);
				$display(" result = %b (%b expected)", result, resultExpected);
				errors = errors+1;
			end
			
			testIndex = testIndex+1;
			if (testvectors[testIndex]===3'bx) // testVector length + 1
			begin
				$display("%d tests completed with %d errors", testIndex, errors);
				$stop;
			end
		end
	end
endmodule