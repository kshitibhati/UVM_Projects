//------------------ANALYSIS FIFO-----------------------//

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
  
  uvm_analysis_port #(trans) ana_port;
 
    function new(string name="gen",uvm_component parent);
	    super.new(name,parent);
	    ana_port=new("ana_port",this);
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
	      ana_port.write(trans_h);
		  `uvm_info("GEN",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	   end
	endtask

endclass
	
 class driver extends uvm_component;//Target
 
    trans trans_h;

   `uvm_component_utils(driver)
   
    //uvm_blocking_put_imp #(trans,driver) put_imp;
	uvm_tlm_analysis_fifo #(trans) fifo_h;
 
    function new(string name="driver",uvm_component parent);
	    super.new(name,parent);
		fifo_h = new("fifo_h",this); 
	endfunction
	
	task run_phase(uvm_phase phase);
	   super.run_phase(phase);
       repeat(10) begin 
	   fifo_h.get(trans_h);
  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
       end
	endtask
	/*function void write (trans trans_h);
	  `uvm_info("DRIVER",$sformatf("trans_h = %p",trans_h),UVM_MEDIUM)
	endfunction*/
	
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
driver drvh1;
driver drvh2;
driver drvh3;
gen gen_h;

    // fifo
	//uvm_tlm_fifo #(trans) fifo_h ;
  

	function new(string name="ahb_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

    function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
		drvh  = driver::type_id::create("drvh",this);
		drvh1  = driver::type_id::create("drvh1",this);
		drvh2  = driver::type_id::create("drvh2",this);
		gen_h = gen   ::type_id::create("gen_h",this);
	endfunction
	
	function void end_of_elaboration_phase(uvm_phase phase);
          super.end_of_elaboration_phase(phase);
		   uvm_top.print_topology();
         `uvm_info("ahb_agent","THIS IS END_OF_ELABORATION PHASE IN AGENT",UVM_MEDIUM);
       endfunction

	 function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//drvh.get_port.connect(gen_h.get_imp);
		gen_h.ana_port.connect(drvh.fifo_h.analysis_export);
		gen_h.ana_port.connect(drvh1.fifo_h.analysis_export);
		//gen_h.ana_port.connect(drvh2.fifo_h.analysis_export);
		//gen_h.ana_port.connect(drvh3.fifo_h.analysis_export);
	 endfunction	
		
endclass

initial
begin
//#1;
run_test("ahb_agent");
$display("-------------=-=-=-=-=");
#50;
$finish;
end
	
endmodule