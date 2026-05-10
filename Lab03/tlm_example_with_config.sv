///////////// TLM Example With Config /////////////////////////

module tlm_example_with_config();

import uvm_pkg::*;
`include "uvm_macros.svh"
//driver class
class driver extends uvm_component;
int b;
//Factory Registration
`uvm_component_utils(driver)


//STANDARD UVM METHODS

 function new (string name="driver", uvm_component parent);
    super.new(name,parent);
 endfunction
  
  
 function void build_phase(uvm_phase phase);
    
	if(!uvm_config_db #(int)::get(this,"","a",b))
	$display("value of b = %0d",b);
	super.build_phase(phase);
 endfunction:build_phase
  
  
endclass:driver


class agent extends uvm_component;


//factory registration
 `uvm_component_utils(agent);
 
//creat the driver handle
 driver drv_h;
 
//STANDARD UVM METHODS
 
extern function new(string name="agent", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass:agent


 function agent::new(string name="agent",uvm_component parent);
     super.new(name,parent);
 endfunction
   
 function void agent:: build_phase(uvm_phase phase);
    drv_h= driver::type_id::create("drv_h",this);
    uvm_config_db #(int)::set(this,"*","a",5);
	//$display("value of a=%d",a);
	super.build_phase(phase);
 endfunction:build_phase
 
 task agent::run_phase(uvm_phase phase);
 
	uvm_test_done.raise_objection(this);
	#10;
	uvm_test_done.drop_objection(this);
 endtask:run_phase
 
 initial begin
  run_test("agent");
  #50;
  $finish;
 end
	
endmodule
   
   
   
  
  
  
 


  
  
  
	
 
 
  