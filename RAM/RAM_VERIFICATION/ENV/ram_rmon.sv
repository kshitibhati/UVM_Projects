class ram_rmon extends uvm_monitor;

  `uvm_component_utils(ram_rmon)
 
   ram_rtrans trans_h;
  
   virtual ram_if.RMON_MP vif;
   
   uvm_analysis_port #(ram_rtrans)rmon_an_port;
   
   function new (string name = "ram_rmon", uvm_component_parent=null);
	  super.new(name,parent);
	  rmon_an_port =new("rmon_an_port",this);
   endfunction
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction
   
   
   
   task run_phase(uvm_phase phase);
   super.run_phase(phase);
     forever begin 
	   monitor();
	   rmon_an_port.write(trans_h);
	   end
   endtask
   
   task monitor();
      trans_h = ram_rtrans::type_id::create("trans_h");//handle creation
	  // memory creation
      //wait for reset
	  @(vif.rmon_cb);// give the delay
	  // collect data 
	  trans_h.rd_enb = vif.rmon_cb.rd_enb;
	  trans_h.rd_addr = vif.rmon_cb.rd_addr;
	  trans_h.rd_data = vif.rmon_cb.rd_data;
   endtask
   
endclass