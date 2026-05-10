//------------------TLM GENERATOR TO DRIVER-----------------------//

module tlm();
import uvm_pkg::*;
`include "uvm_macros.svh"

class trans;

    rand bit[7 : 0] data;    
	rand bit[3 : 0] address;
	rand bit write;

endclass:trans

class gen extends uvm_component; //uvm_component is a parent class which stored in packege

  trans trans_h;

  `uvm_component_utils(gen)
  
  uvm_blocking_put_port #(trans) put_port; // put_port means generator to driver, it is a user define name
 
    function new(string name="gen",uvm_component parent); //uvm_component parent is bydefult stememt
	    super.new(name,parent);
	    put_port=new("put_port",this);
	endfunction 
	
	task run_phase(uvm_phase phase);
	   super.run_phase(phase);
	   repeat(10) begin
	     trans_h=new();
	     assert(trans_h.randomize());
	     `uvm_info("GEN",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	      put_port.put(trans_h);
	   end
	endtask

endclass
	
 class driver extends uvm_component;
 
    trans trans_h;

   `uvm_component_utils(driver)
   
    uvm_blocking_put_imp #(trans,driver) put_imp; // we dont need to do GET
 
    function new(string name="driver",uvm_component parent);
	    super.new(name,parent);
		put_imp=new("put_imp",this); 
	endfunction
	
	task put (trans trans_h);
	  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM) //$sformatf is convert desimal number into string
	endtask
	
endclass

class ahb_agent extends uvm_component;
// Factory Registration
    9`uvm_component_utils(ahb_agent)

// declare the Driver handle
driver drvh;
gen gen_h;

	function new(string name="ahb_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

    function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
		drvh=driver::type_id::create("drvh",this);
		gen_h=gen::type_id::create("gen_h",this);
	endfunction

	 function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		gen_h.put_port.connect(drvh.put_imp);
	endfunction
endclass

initial
begin
run_test("ahb_agent");
#50;
$finish;
end
	
endmodule
	



