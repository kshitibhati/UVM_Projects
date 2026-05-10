class fifo_wrdrv extends uvm_driver #(fifo_wrtrans);

`uvm_component_utils(fifo_wrdrv)

 virtual fifo_if.WDR_MP vif;

function new (string name= "fifo_wrdrv",uvm_component parent = null);
 super.new(name,parent);
endfunction


task run_phase (uvm_phase phase);
super.run_phase (phase);
 forever
 begin
  seq_item_port.get_next_item(req);
  send_to_dut(req);
  seq_item_port.item_done();
 end
endtask

task send_to_dut(fifo_wrtrans req);
  @(vif.wdr_cb); begin
  vif.wdr_cb.wr_enb<=req.wr_enb;
  vif.wdr_cb.wr_data<=req.wr_data;
  //vif.wdr_cb.wr_addr<=req.wr_addr;
 //$display(" DATA MISMATCH ! wr_data = %d ",req.wr_data );
 end
endtask
endclass
