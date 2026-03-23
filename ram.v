module ram_design(
    input clk,
    input rst,
    input wr_enb,
    input rd_enb,
    input [2:0] wr_addr,
    input [2:0] rd_addr,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] mem [7:0];
integer i;
always @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        for(i=0; i<8; i=i+1)
            mem[i] <= 8'b00000000;
    end
    else if(wr_enb)
        mem[wr_addr] <= data_in;
end
always @(posedge clk or negedge rst)
begin
    if(!rst)
        data_out <= 8'b00000000;
    else if(rd_enb)
        data_out <= mem[rd_addr];
end

endmodule



