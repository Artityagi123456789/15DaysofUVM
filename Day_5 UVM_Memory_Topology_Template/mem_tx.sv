class mem_tx extends uvm_sequence_item;
rand bit[WIDTH-1:0]data;
rand bit[ADDR_WIDTH-1:0]addr;
rand bit wr_rd;

function new(string name="");
	super.new(name);
endfunction

	`uvm_object_utils_begin(mem_tx)
		`uvm_field_int(data,UVM_ALL_ON)
		`uvm_field_int(addr,UVM_ALL_ON)
		`uvm_field_int(wr_rd,UVM_ALL_ON)
	`uvm_object_utils_end
endclass	

	


