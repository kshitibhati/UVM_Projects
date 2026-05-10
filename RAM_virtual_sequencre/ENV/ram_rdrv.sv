class ram_rdr extends uvm_driver #(ram_rtrans);

   `uvm_component_utils(ram_rdr)
   
   virtual ram_if.RDR_MP vif;
      
   function new (string name = "ram_rdr", uvm_component parent=null);
       super.new(name,parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction
   
   task run_phase(uvm_phase phase);
   super.run_phase(phase);
     forever begin 
	   seq_item_port.get_next_item(req);
	   send_to_dut(req);
	   seq_item_port.item_done();
	 end
   endtask
   
   task send_to_dut(ram_rtrans req);
    @(vif.rdr_cb);
   //reset wait
   //signal drive   vif.rdr_cb.rd_addr <= req.rd_addr;
   vif.rdr_cb.rd_enb <= req.rd_enb;
   vif.rdr_cb.rd_addr <= req.rd_addr;
   
   endtask
   
endclass