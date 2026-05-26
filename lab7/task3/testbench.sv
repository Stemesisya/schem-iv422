module tb_counter4_l();
    logic clk, reset, button, load, ol;
    logic [3:0] q;
    logic [3:0] data_load;
    
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    counter4b c4(
        .clk(clk),
        .reset(reset),
        .rawButton(button),
        .load(load),
        .data_load(data_load),
        .q(q),
        .ol(ol)
    );
    
    initial begin
        reset = 1;
        button = 0;
        load = 0;
        data_load = 4'b0000;
        #5;
        reset = 0;
        #20;
        $display("Test 1 - After reset: q=%b (Expected: 0000)", q);
        
        // Загрузка значения 5
        load = 1;
        data_load = 4'b0101;
        button = 1;
        #300;  
        load = 0;                
        button = 0;
        #20;
        $display("Test 2 - Load 5: q=%b (Expected: 0101)", q);
        
        // Считаем дальше (добавили нажатия кнопки)
        button = 1;
        #300;
        button = 0;
        #20;
        $display("Test 3 - After counting: q=%b (Expected: 0111)", q);
        
        // Загрузка значения 10
        load = 1;
        data_load = 4'b1010;
        button = 1;
        #300;
        load = 0;
        button = 0;
        #20;
        $display("Test 4 - Load 10: q=%b (Expected: 1010)", q);
        
        // Считаем (добавили нажатия кнопки)
        button = 1;
        #300;
        button = 0;
        #20;
        button = 1;
        #300;
        button = 0;
        #20;
        $display("Test 5 - After counting: q=%b (Expected: 1110)", q);
        
        // Загрузка значения 15
        load = 1;
        data_load = 4'b1111;
        button = 1;
        #300;
        load = 0;
        button = 0;
        #20;
        $display("Test 6 - Load 15: q=%b, ol=%b (Expected: 1111, 1)", q, ol);
        
        // Сброс
        reset = 1;
        #10;
        $display("Test 7 - After reset: q=%b (Expected: 0000)", q);
        $stop;
    end
    
endmodule