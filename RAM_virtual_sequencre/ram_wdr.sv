class ram_wdr extends uvm_driver #(ram_wtrans);

   `uvm_component_utils(ram_wdr)
   
   virtual ram_if.WDR_MP vif; // interface declaration for driver to interface
      
   function new (string name = "ram_wdr", uvm_component parent=null);
       super.new(name,parent);
   endfunction
   

   task run_phase(uvm_phase phase);
     forever begin
	   seq_item_port.get_next_item(req);
	   send_to_dut(req);
	   seq_item_port.item_done();
	 end
   endtask
   
   task send_to_dut(ram_wtrans req); // here req because it is a class handle name
   //reset wait 
   @(vif.wdr_cb)
   //signal drive   
   vif.wdr_cb.wr_addr <= req.wr_addr;
   vif.wdr_cb.wr_data <= req.wr_data;
   vif.wdr_cb.wr_enb <= req.wr_enb;
   endtask
   
endclass