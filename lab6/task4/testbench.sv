module lb6_t4_test();
	logic clk,reset;
	logic mclk, mreset;
	logic [3:0] result;
	logic [3:0] resultExpected;
	logic [100:0] testIndex, errors;
	logic [5:0] testvectors [100:0];

	module_impulse_redistributor m1(.clk(mclk), .reset(mreset), .out(result));
	
	always begin
		clk=1; #5; clk=0; #5;
	end

	initial begin

		mreset = 1;
        mclk = 1; // Сбрасываем счетчик, чтобы он показывал 0, а не X

		$readmemb ("lab6/task4/test.txt", testvectors);
		testIndex =0;
		errors=0;
		reset =1; #27; reset=0;
	end

	always @(posedge clk) begin
		#1; {mclk, mreset, resultExpected} = testvectors [testIndex];
	end

	always @(negedge clk)
	begin
		if (~reset)
		begin
			if (result!==resultExpected)
			begin
				$display("[%d] Error result: inputs = clk:%b, reset:%b", testIndex, mclk, mreset);
				$display(" result = %b (%b expected)", result, resultExpected);
				errors = errors+1;
			end
			
			testIndex = testIndex+1;
			if (testvectors[testIndex]===6'bx) // testVector length + 1
			begin
				$display("%d tests completed with %d errors", testIndex, errors);
				$stop;
			end
		end
	end
endmodule