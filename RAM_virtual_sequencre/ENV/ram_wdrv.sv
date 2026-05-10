
class ram_wdr extends uvm_driver #(ram_wtrans);

   `uvm_component_utils(ram_wdr)
   
   virtual ram_if.WDR_MP vif;
      
   function new (string name = "ram_wdr", uvm_component parent=null); // if there is no parent component then we will use null
       super.new(name,parent);
   endfunction
   

   task run_phase(uvm_phase phase);
     forever begin
	   seq_item_port.get_next_item(req); // will call the start_item(trans_h). see -> wseqs
	   send_to_dut(req);
	   seq_item_port.item_done(); // will derive the signals to DUT..finish_item(trans_h). see -> wseqs
	 end
   endtask
   
   task send_to_dut(ram_wtrans req);
    @(vif.wdr_cb);
   //reset wait
   //signal drive   vif.wdr_cb.wr_addr <= req.wr_addr;
   vif.wdr_cb.wr_enb <= req.wr_enb;
   vif.wdr_cb.wr_addr <= req.wr_addr;
   vif.wdr_cb.wr_data <= req.wr_data;
   endtask
   
endclass