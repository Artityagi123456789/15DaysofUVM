class adder_monitor extends uvm_monitor;
 uvm_analysis_port #(adder_tx) ap;
adder_tx tx;
virtual adder_intf vif;							
													

	`uvm_component_utils(adder_monitor)	// factory registration

  function new(input string name = "monitor", uvm_component parent);// component hence two arguments
		super.new(name,parent);						
		ap = new("ap",this);						
	endfunction

   function void build_phase(uvm_phase phase);
		super.build_phase(phase);
        tx = adder_tx::type_id::create("tx",this);
      	uvm_resource_db #(virtual adder_intf)::read_by_name("GLOBAL","VIF",vif,null);
	endfunction

    task run_phase(uvm_phase phase);
	
		forever begin		
			#10;					
		  	tx.a =vif.a;
            tx.b  = vif.b;			
			tx.sum  = vif.sum;			

			tx.print();				
          
			ap.write(tx);			
		end

	endtask


endclass


