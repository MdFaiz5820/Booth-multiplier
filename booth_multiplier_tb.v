module booth_tb;

    reg clk = 0;
    reg rst;
    reg start;
    reg signed [3:0] multiplicand;
    reg signed [3:0] multiplier;
    wire signed [7:0] product;
    wire done;

    booth_multiplier #(4) uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );

       always #5 clk = ~clk;

    initial begin
                $dumpfile("booth.vcd");
        $dumpvars(0, booth_tb);
        $display("Time\tStart\tMplicand\tMultiplier\tProduct\t\tDone");
        $display("-------------------------------------------------------------");

        rst = 1; start = 0;
        multiplicand = 0; multiplier = 0;
        #10;

        rst = 0;

        // Test Case 1: -3 x 5 = -15
        multiplicand = -3;
        multiplier = 5;
        start = 1;
        #10 start = 0;

        wait(done);
        $display("%4t\t%b\t%d\t\t%d\t\t%d\t%b", $time, start, multiplicand, multiplier, product, done);

        // Test Case 2: -4 x -2 = 8
        #10;
        multiplicand = -4;
        multiplier = -2;
        start = 1;
        #10 start = 0;

        wait(done);
        $display("%4t\t%b\t%d\t\t%d\t\t%d\t%b", $time, start, multiplicand, multiplier, product, done);

        // Test Case 3: 7 x 3 = 21
        #10;
        multiplicand = 7;
        multiplier = 3;
        start = 1;
        #10 start = 0;

        wait(done);
        $display("%4t\t%b\t%d\t\t%d\t\t%d\t%b", $time, start, multiplicand, multiplier, product, done);

        $finish;
    end
endmodule
