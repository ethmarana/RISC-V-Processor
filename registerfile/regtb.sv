module regtb;

logic clk;
logic regwrite;
logic [$clog2(32)-1:0] rs1;
logic [$clog2(32)-1:0] rs2;
logic [$clog2(32)-1:0] rd;
logic [32-1:0] writedata;
logic [32-1:0] rd1;
logic [32-1:0] rd2;

regfile #(.dataw(32), .regamt(32)) instance1 (
    .clk(clk),
    .regwrite(regwrite),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .writedata(writedata),
    .rd1(rd1),
    .rd2(rd2)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end 

initial begin
    regwrite = 1'b0;
    rs1 = '0;
    rs2 = '0;
    rd = '0;
    writedata = '0;
    regwrite = 1'b1; 
    rd = 5'd9;
    writedata = 32'd7; 
    @(posedge clk);
    #1;
    regwrite = 1'b0;
    rs1 = 5'd9;
    #1;
    if (rd1 == 32'd7) begin
        $display("read/write case PASSED");
    end else begin
        $display("read/write case FAILED");
    end 
    #33;

    rs1 = '0;
    rs2 = '0;
    #1;
    if (rd1 == '0 && rd2 == '0) begin
        $display("zero case PASSED");
    end else begin
        $display("zero case FAILED");
    end 

    $finish;

end 

endmodule