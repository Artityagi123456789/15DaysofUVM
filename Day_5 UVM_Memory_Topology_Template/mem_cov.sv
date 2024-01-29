class mem_cov extends uvm_subscriber#(mem_tx);
mem_tx tx;
	`uvm_component_utils(mem_cov)

	covergroup cg;
		CP_ADDR:coverpoint tx.addr{
				option.auto_bin_max=8;
				}
		CP_WR_RD:coverpoint tx.wr_rd{
				bins WR = {1'b1};
				bins RD = {1'b0};
				}
		CP_ADDR_X_CP_WR_RD: cross CP_ADDR,CP_WR_RD;
	endgroup

function new(string name, uvm_component parent);
	super.new(name,parent);
	cg=new();
endfunction

function void write(mem_tx t);
	this.tx=t;
	cg.sample();
endfunction
endclass



