`include "uvm_pkg.sv"
import uvm_pkg::*;
// will give an access to uvm pkg
`include "adder.v"
`include "adder_tx.sv"
`include "adder_intf.sv"
`include "adder_driver.sv"
`include "adder_monitor.sv"
`include "seq_lib.sv"
`include "adder_sequencer.sv"
`include "adder_agent.sv"
`include "adder_env.sv"
`include "base_test.sv"

module top;
  adder_intf pif();
  
  adder dut(
    .a(pif.a),
    .b(pif.b),
    .sum(pif.sum));
  
  initial begin
    uvm_resource_db#(virtual adder_intf)::set("GLOBAL","VIF",pif,null);
    run_test("base_test");
  end
  
  initial begin
     #100;
     $finishh();
  end
  
endmodule
