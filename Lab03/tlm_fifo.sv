//------------------TLM_FIFO-----------------------//

module tlm();
import uvm_pkg::*;
`include "uvm_macros.svh"

class trans;

    rand bit[7 : 0] data;    
	rand bit[3 : 0] address;
	rand bit write;

endclass:trans

class gen extends uvm_component; //initiator

  trans trans_h;

  `uvm_component_utils(gen)
  
  uvm_blocking_put_port #(trans) put_port;
 
    function new(string name="gen",uvm_component parent);
	    super.new(name,parent);
	    put_port=new("put_port",this);
	endfunction 
	
	/*task get (output trans trans_h);
	  trans temp_h;
	   //trans_h =temp_h;
     // trans_h =temp_h;
	  // repeat(10) begin
	   
	     trans_h=new();
		 
	     assert(trans_h.randomize());
		 
	     `uvm_info("GEN",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
		// `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	// end
	endtask*/
	
	task run_phase(uvm_phase phase);
	   super.run_phase(phase);
	     repeat(10) begin
	     trans_h=new();
	     assert(trans_h.randomize());
	      put_port.put(trans_h);
		  `uvm_info("GEN",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	   end
	endtask

endclass
	
 class driver extends uvm_component;//Target
 
    trans trans_h;

   `uvm_component_utils(driver)
   
    //uvm_blocking_put_imp #(trans,driver) put_imp;
	uvm_blocking_get_port #(trans) get_port;
 
    function new(string name="driver",uvm_component parent);
	    super.new(name,parent);

		get_port=new("get_port",this); 
		//put_imp=new("put_imp",this);
	endfunction
	
	task run_phase(uvm_phase phase);
	   super.run_phase(phase);
       repeat(10) begin 
	   get_port.get(trans_h);
  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
   end
	endtask
	/*task put (trans trans_h);
	  //trans temp_h;
	  //temp_h = trans_h;
	  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	endtask*/
	
	/*task run_phase(uvm_phase phase);
	 repeat(10) begin
	  get_port.get(trans_h);
	  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	 end
	endtask*/
	
endclass

class ahb_agent extends uvm_component;

// Factory Registration
`uvm_component_utils(ahb_agent)

// declare the Driver handle
driver drvh;
gen gen_h;

    // fifo
	uvm_tlm_fifo #(trans) fifo_h ;
  

	function new(string name="ahb_agent",uvm_component parent);
		super.new(name,parent);
		fifo_h = new("fifo_h",this);
	endfunction

    function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
		drvh  = driver::type_id::create("drvh",this);
		gen_h = gen   ::type_id::create("gen_h",this);
	endfunction

	 function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//drvh.get_port.connect(gen_h.get_imp);
		gen_h.put_port.connect(fifo_h.put_export);
		drvh.get_port.connect(fifo_h.get_export);
		
	endfunction
endclass

initial
begin
//#1;
run_test("ahb_agent");
#50;
$finish;
end
	
endmodule
	



