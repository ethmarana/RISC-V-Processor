module ALU_tb;

    logic [31:0] a;
    logic [31:0] b;
    logic [3:0] control;
    logic [31:0] result;
    logic zero;

ALU instance1 (
    .a(a),
    .b(b),
    .control(control),
    .result(result),
    .zero(zero)
);

initial begin 
    // test case bitwise AND
    a = 32'b00000000000000000000000000001111;
    b = 32'b00000000000000000000000000000101;
    control = 4'b0000;
    #33;
    if (result == 32'b00000000000000000000000000000101 && zero == 1'b0) begin
        $display("AND passed");
    end else begin
        $display("AND failed");
    end

    // test case bitwise OR
    a = 32'b00000000000000000000000000001111;
    b = 32'b00000000000000000000000000000101;
    control = 4'b0001;
    #33;
    if (result == 32'b00000000000000000000000000001111 && zero == 1'b0) begin
        $display("OR passed");
    end else begin
        $display("OR failed");
    end

    // test case add 
    a = 32'h10;
    b = 32'h20;
    control = 4'b0010;
    #33;
    if (result == 32'h30 && zero == 1'b0) begin
        $display("ADD passed");
    end else begin
        $display("ADD failed");
    end

    // test case subtract
    a = 32'h69;
    b = 32'h42;
    control = 4'b0110;
    #33;
    if (result == 32'h27 && zero == 1'b0) begin
        $display("SUBTRACT passed");
    end else begin  
        $display("SUBTRACT failed");
    end

    // test case set less than
    a = 32'h98;
    b = 32'h110;
    control = 4'b0111;
    #33;
    if (result ==32'h1 && zero == 1'b0) begin
        $display("SLT passed");
    end else begin
        $display("SLT failed");
    end

    // test case nor 
    a = 32'b00000000000000000000000000000011;
    b = 32'b00000000000000000000000000000101;
    control = 4'b1000;
    #33;
    if (result == 32'b11111111111111111111111111111000 && zero == 1'b0) begin
        $display("NOR passed");
    end else begin
        $display("NOR failed");
    end

    // test case default 
    control = 4'b1111;
    #33;
    if (result == 32'b0 && zero == 1'b1) begin
        $display("DEFAULT passed");
    end else begin
        $display("DEFAULT failed");
    end 

    // test case zero
    a = 32'h5;
    b = 32'h5;
    control = 4'b0110;
    #33;
    if (result == 32'b0 && zero == 1'b1) begin
        $display("ZERO passed");
    end else begin
        $display("ZERO failed");
    end
    
    $finish;
end 


endmodule