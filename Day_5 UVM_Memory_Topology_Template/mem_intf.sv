interface mem_intf(input bit clk_i,rst_i);
parameter WIDTH = 16;
parameter DEPTH = 64;
parameter ADDR_WIDTH = $clog2(DEPTH); //this will calculate automatically 4
bit valid;
bit ready;
bit wr_rd;
bit [ADDR_WIDTH-1:0]addr;
bit [WIDTH-1:0]wdata;
bit [WIDTH-1:0]rdata;

clocking drv_cb@(posedge clk_i);
	default input #0 output #1; //default skew(sample the inputs exactly #1 time before pos edge of clock
	//input to bfm
	input ready;
	input rdata;
	//output from bfm
	output valid;
	output wr_rd;
	output addr; 
	output wdata;
endclocking

clocking mon_cb@(posedge clk_i);
	default input #1; //sample the inputs exactly #1 time before pos edge of clock
	input ready;
	input rdata;
	input valid;
	input wr_rd;
	input addr; 
	input wdata;
endclocking	
endinterface

