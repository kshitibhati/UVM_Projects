/*drv to gen :- repeat will be in driver
and randomize will be in gen.
-> direction won't gonna change if we do drv to gen, data will to through gen to drv
-> 
*/




module tlm();
import uvm_pkg::*;
`include "uvm_macros.svh"

class trans;
rand bit [7:0] data;
rand bit [3:0] address;
rand bit write;
endclass

class drv extends uvm_component;
 `uvm_component_utils(drv)
 trans trans_h;
  
  uvm_blocking_get_port #(trans) get_port;
  
  function new (string name ="DRV", uvm_component parent);
  super.new(name,parent);
  get_port=new("get_port",this);
  endfunction
  
  task run_phase(uvm_phase phase);
  super.run_phase(phase);
  repeat(10)begin
 
 // trans_h =new();
  get_port.get(trans_h);
 // assert(trans_h.randomize());
  `uvm_info("drv",$sformatf("trans_h= %p",trans_h),UVM_MEDIUM)
 
  end
  endtask
  endclass
  
  class gen extends uvm_component;
    trans trans_h;
	`uvm_component_utils(gen)
	uvm_blocking_get_imp #(trans,gen) get_imp;
	
	function new (string name = "GEN", uvm_component parent);
	super.new(name,parent);
	get_imp=new("get_imp",this);
	endfunction
  
  task get (output trans trans_h);
 // repeat(10)
 begin
   trans_h=new();
   //repeat(10)begin
 assert(trans_h.randomize());
 //repeat(10)begin
 `uvm_info("gen",$sformatf("trans_h=%p",trans_h),UVM_MEDIUM)
 end
 endtask
 endclass
 class ahb_agent extends uvm_component;
 
 trans trans_h;
 
 `uvm_component_utils(ahb_agent);
 drv drv_h;
 gen gen_h;
 
 function new (string name ="ahb_agent", uvm_component parent);
  super.new(name,parent);
  endfunction
  
  function void build_phase( uvm_phase phase);
  super.build_phase(phase);
  drv_h = drv::type_id::create("drv_h",this);
  gen_h = gen::type_id::create("gen_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv_h.get_port.connect(gen_h.get_imp);
	endfunction
endclass
  
  
  initial
  begin
  run_test ("ahb_agent");
  #50;
  $finish;
  end
  
  endmodule
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  