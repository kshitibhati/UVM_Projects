class ram_wmon extends uvm_monitor;

  `uvm_component_utils(ram_wmon)
  
	ram_wtrans trans_h;
  
  uvm_analysis_port #(ram_wtrans)an_wport;
  
   virtual ram_if.WMON_MP vif;
   
   function new (string name = "ram_wmon", uvm_component parent=null);
	  super.new(name,parent);
	  an_wport= new("an_wport",this);
   endfunction

   
   task run_phase(uvm_phase phase);
   
     forever begin
	 //ram_wtrans_h=new();
	 //assert(ram_wtrans_h.randomize());
	 monitor();
	 an_wport.write(trans_h);
	//`uvm_info("write_monitor", $sformatf("ram_wtrans =%d",trans_h),UVM_MEDIUM)
	
	end
  	 
	// monitor();
   endtask
   
   task monitor();
      //handle creation
      //$display("555555555555555");
      	  
     //wait for reset
	   @(vif.wmon_cb);
	   trans_h = ram_wtrans::type_id::create("trans_h");// here we have to pass one parameter because our 
	  //wtrans is object type and in object type we have pass one parameter in arg so we 
       // don't write this in arg
	 // collect data //
	   trans_h.wr_enb =  vif.wmon_cb.wr_enb;
	   trans_h.wr_addr = vif.wmon_cb.wr_addr;
	   trans_h.wr_data = vif.wmon_cb.wr_data;
	   
   endtask
   
endclass