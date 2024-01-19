class adder_agent extends uvm_agent;	
	adder_driver drv;					
	adder_sequencer sqr;
	adder_monitor mon;					
 	 `uvm_component_utils(adder_agent)					

	function new(input string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction


    function void build_phase(uvm_phase phase);
		super.build_phase(phase);						
	  mon = adder_monitor::type_id::create("mon",this);
	  drv  = adder_driver::type_id::create("drv",this);	 
      sqr = adder_sequencer::type_id::create("sqr",this);

	endfunction

    function void connect_phase(uvm_phase phase);
	    	super.connect_phase(phase);
			drv.seq_item_port.connect(sqr.seq_item_export);	

	endfunction									
endclass
