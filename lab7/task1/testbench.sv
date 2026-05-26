module tb_counter4();
    logic clk, reset, button, ol;
    logic [3:0] q;
    
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

	counter4b c4(.clk(clk), .reset(reset), .rawButton(button), .q(q), .ol(ol));
    
    initial begin

        reset = 1;
		button = 0;
		#5;
        reset = 0;
		#20;
        $display("q: %b (Expected: 0000)", q); // Сброс
		#99999;
        $display("q: %b (Expected: 0000)", q); // Не должно автоинкрементироваться

		button = 1;
		#5;
		button = 0;
		#5;
		button = 1;
		#5;
		button = 0;
		#5;
		button = 1;
		#5;
		button = 0;
		#5;
		$display("q: %b, ol: %b (Expected: 0000, 0)", q, ol); // Дребезг не должен учесться
		 
        button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0001, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0010, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0011, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0100, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0101, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0110, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0111, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1000, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1001, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1010, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1011, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1100, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1101, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1110, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 1111, 1)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0000, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0001, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1; 
        #99999;
        $display("q: %b, ol: %b (Expected: 0010, 0)", q, ol); // Клик
        button = 0; 
        #99999;

		button = 1;
		reset = 1;
        #40;
        $display("q: %b (Expected: 0000)", q); // Сброс
        button = 0;
        #99999;
		$display("q: %b (Expected: 0000)", q);
        button = 0;
        #99999;
		 
		 

        $stop;
    end
    
endmodule
