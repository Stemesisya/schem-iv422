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
        $display("Test 1 - After reset: q=%b (Expected: 0000)", q);
      
        button = 0;
        #100;
        $display("Test 2 - Button=0: q=%b (Expected: 0000)", q);
        
        button = 1;
        

        #20000000;
        
        $display("Test 3 - Button held, after anti-tinkling: q=%b (Expected: 0100 or 1000)", q);
        
        #100;
        $display("Test 4 - After more clocks: q=%b", q);
   
        button = 0;
        #1000;
        $display("Test 5 - Button=0: q=%b (should not change)", q);
    
        reset = 1;
        #10;
        $display("Test 6 - After reset: q=%b (Expected: 0000)", q);

        $stop;
    end
    
endmodule