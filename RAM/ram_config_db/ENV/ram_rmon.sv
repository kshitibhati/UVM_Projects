class ram_rmon extends uvm_monitor;

  `uvm_component_utils(ram_rmon)
  
	ram_rtrans trans_h;
  //analysys port
  uvm_analysis_port #(ram_rtrans)an_rport;
  
   virtual ram_if.RMON_MP vif;
//----------------------------------------------------------------------//   
   function new (string name = "ram_rmon", uvm_component parent=null);
	  super.new(name,parent);
	  an_rport= new("an_rport",this);
   endfunction
   
 //---------------------------------------------------------------------//  
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction:build_phase

//----------------------------------------------------------------------//   
   task run_phase(uvm_phase phase);
     forever begin
	    monitor();
		an_rport.write(trans_h);
		end
   endtask:run_phase

//--------------------------------------------------------------------//   
   task monitor();
      //handle creation
      trans_h = ram_rtrans::type_id::create("trans_h");
	   //wait for reset
	   @(vif.rmon_cb);
	  // collect data /*we have to write this data in sequence bcuz in task it takes data sequencelly*/ 
	    trans_h.rd_enb =  vif.rmon_cb.rd_enb;
		trans_h.rd_addr = vif.rmon_cb.rd_addr;											
		trans_h.rd_data = vif.rmon_cb.rd_data;
		
   endtask:monitor
   
endclass:ram_rmon