class ram_wmon extends uvm_monitor;

  `uvm_component_utils(ram_wmon)
  
   ram_wtrans trans_h;
  
   virtual ram_if.WMON_MP vif;
   
   uvm_analysis_port#(ram_wtrans)wmon_an_port;
   
   function new (string name = "ram_wmon", uvm_component parent=null);
	  super.new(name,parent);
	  wmon_an_port = new("wmon_an_port",this);
   endfunction
   
   task run_phase(uvm_phase phase);
   super.run_phase(phase);
     forever 
	   begin
	      monitor();
	      wmon_an_port.write(trans_h);
		  //trans_h.print();
	   end
   endtask
   
   task monitor();
     // ram_wtrans trans_h;
      //handle creation
	  trans_h = ram_wtrans::type_id::create("trans_h");
     //wait for reset
	 @(vif.wmon_cb);
	 // collect data 
	 trans_h.wr_enb = vif.wmon_cb.wr_enb;
	 trans_h.wr_addr = vif.wmon_cb.wr_addr;
	 trans_h.wr_data = vif.wmon_cb.wr_data;
   endtask
   
endclass