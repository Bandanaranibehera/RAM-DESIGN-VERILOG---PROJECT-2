module ram_design_tb;

reg clk;
reg rst;
reg wr_enb;
reg rd_enb;
reg [2:0] wr_addr;
reg [2:0] rd_addr;
reg [7:0] data_in;
wire [7:0] data_out;

ram_design uut (
    .clk(clk),
    .rst(rst),
    .wr_enb(wr_enb),
    .rd_enb(rd_enb),
    .wr_addr(wr_addr),
    .rd_addr(rd_addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 0;
    wr_enb = 0;
    rd_enb = 0;
    wr_addr = 0;
    rd_addr = 0;
    data_in = 0;

    #10 rst = 1;

    #10;
    wr_enb = 1;
    wr_addr = 3'b001;
    data_in = 8'b10101010;

    #10;
    wr_addr = 3'b010;
    data_in = 8'b11110000;

    #10 wr_enb = 0;

    #10;
    rd_enb = 1;
    rd_addr = 3'b001;

    #10 rd_addr = 3'b010;

    #10 rd_enb = 0;

    #20 $stop;
end

endmodule

