//--------------------------TLM DRIVER TO GENERATOR-----------------------//
module tlm();
import uvm_pkg::*;
`include "uvm_macros.svh"

class trans;

rand bit[7:0] data;
rand bit[3:0] address;
rand bit write;

endclass:trans

class driv extends uvm_component;
trans trans_h;
`uvm_component_utils(driv)

uvm_blocking_put_port #(trans) put_port;

function new (string name= "driv", uvm_component parent);
  super.new (name,parent);
  put_port=new("put_port",this);
endfunction

task run_phase (uvm_phase phase);
  super.run_phase(phase);
 repeat(10) begin
    trans_h=new();
    assert (trans_h.randomize());
    `uvm_info("DRIV",$sformatf("trans_h =%p" , trans_h),UVM_MEDIUM)
     put_port.put(trans_h);
  end 
endtask

endclass

class gen extends uvm_component;

   trans trans_h;
   `uvm_component_utils(gen)
   uvm_blocking_put_imp #(trans,gen) put_imp;
   
   function new(string name="gen",uvm_component parent);
    super.new(name,parent);
	put_imp=new("put_imp",this);
   endfunction

   task put (trans trans_h);
    `uvm_info("GEN",$sformatf("trans_h=%p",trans_h),UVM_MEDIUM)
   endtask
endclass

class ahb_agent extends uvm_component;

   `uvm_component_utils(ahb_agent)
driv driv_h;
gen gen_h;

   function new(string name ="ahb_agent",uvm_component parent);
    super.new(name,parent);
   endfunction
   
   function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	driv_h=driv::type_id::create("driv_h",this);
	gen_h=gen::type_id::create("gen_h",this);
   endfunction
	
	function void connect_phase (uvm_phase phase);
	 super.connect_phase(phase);
     driv_h.put_port.connect(gen_h.put_imp);	 
   endfunction
 endclass

initial
begin
run_test("ahb_agent");
#50;
$finish;
end

endmodule 
  