//--------------TLM DRIVER TO GENERATOR----------------//

module tlm();
import uvm_pkg::*;
`include "uvm_macros.svh"

class trans;
		
		rand bit[7 :0] data;
		rand bit[3 :0] address;
		rand bit write;
endclass:trans

class drv extends uvm_component;
	
	trans trans_h;
	
	`uvm_component_utils(drv)
	
	uvm_blocking_get_port #(trans) get_port;
	
	function new(string name="drv",uvm_component parent);
		super.new(name,parent);
		get_port=new("get_port",this);
	endfunction
	
	task run_phase(uvm_phase phase); 
		super.run_phase(phase);
		 repeat(10)begin
		 //trans_h=new();
		
		//assert(trans_h.randomize());
		//`uvm_info("drv",$sformatf("trans_h=%p",trans_h),UVM_MEDIUM)
		 get_port.get(trans_h);
`uvm_info("drv",$sformatf("trans_h=%p",trans_h),UVM_MEDIUM)
		  end
	 endtask
	 
endclass

class gen extends uvm_component;
	
	trans trans_h;
	
	`uvm_component_utils(gen)
	
	uvm_blocking_get_imp #(trans,gen) get_imp;
		
		function new(string name="gen",uvm_component parent); 
			super.new(name,parent);
			//repeat(10) begin
			//trans h=new();
			get_imp=new("get_imp",this);
			//end
			endfunction
			
		task get (output trans trans_h);
			//repeat(10) begin	
		    trans_h=new();
			assert(trans_h.randomize());
			`uvm_info("gen",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
			//end
		endtask
		 
endclass

class ahb_agent extends uvm_component;

//factory registration
`uvm_component_utils(ahb_agent)

// declare the gen handle
drv drvh;
gen gen_h;

	function  new (string name="ahb_agent",uvm_component parent);
		super.new(name,parent);
		endfunction
		
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		drvh=drv::type_id::create("drvh",this);
		gen_h=gen::type_id::create("gen_h",this);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drvh.get_port.connect(gen_h.get_imp);
	endfunction
endclass

initial
begin
run_test("ahb_agent");
#60;
$finish;
end

endmodule

	
	