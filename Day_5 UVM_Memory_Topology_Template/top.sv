`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "memory.v"
`include "mem_common.sv"
`include "mem_tx.sv"
`include "mem_drv.sv"
`include "mem_sqr.sv"

`include "mem_mon.sv"
`include "mem_cov.sv"
`include "mem_agent.sv"
`include "mem_env.sv"
`include  "mem_intf.sv"
`include  "test_lib.sv"

module top;
reg clk ,rst;
mem_intf pif(clk,rst);

initial begin
	uvm_resource_db#(virtual mem_intf)::set("GLOBAL","MEMVIF",pif,null);
end	

memory #(.WIDTH(WIDTH), .DEPTH(DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (
				.clk_i(pif.clk_i),
				.rst_i(pif.rst_i),
				.wdata_i(pif.wdata),
				.addr_i(pif.addr),
				.wr_rd_en_i(pif.wr_rd),
				.valid_i(pif.valid),
				.rdata_o(pif.rdata),
				.ready_o(pif.ready));

initial begin
	run_test("mem_test");
end	


always #5 clk = ~clk;

initial begin
	clk = 0;
	rst = 1;
	repeat(2)@(posedge clk);
	rst = 0;
end


endmodule














