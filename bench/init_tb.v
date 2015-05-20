/**
 * Testbench for receiver module
 * Simulates a 8n1 byte being revived
 */
module init_tb();

    /* HOST CONTROLLS */
    reg [23:0]  haddr;
    reg [15:0]  data_input;
    wire [15:0] data_output;
    wire busy; 
    reg rd_enable, wr_enable, rst_n, clk;

    /* SDRAM SIDE */
    wire [12:0] addr;
    wire [1:0] bank_addr;
    wire [15:0] data; 
    wire clock_enable, cs_n, ras_n, cas_n, we_n, data_mask_low, data_mask_high;

initial 
begin
  haddr = 24'd0;
  data_input = 15'd0;
  rd_enable = 1'b0;
  wr_enable = 1'b0;
  rst_n = 1'b1;
  clk = 1'b0;
end

always
  #1 clk <= ~clk;
  
initial
begin
  #3 rst_n = 1'b0;
  #3 rst_n = 1'b1;
  
end
  
sdram_controller sdram_controlleri (
    /* HOST INTERFACE */
    .haddr(haddr), .data_input(data_input), .data_output(data_output), .busy(busy), .rd_enable(rd_enable), .wr_enable(wr_enable), .rst_n(rst_n), .clk(clk),

    /* SDRAM SIDE */
    .addr(addr), .bank_addr(bank_addr), .data(data), .clock_enable(clock_enable), .cs_n(cs_n), .ras_n(ras_n), .cas_n(cas_n), .we_n(we_n), .data_mask_low(data_mask_low), .data_mask_high(data_mask_high)
);

endmodule
