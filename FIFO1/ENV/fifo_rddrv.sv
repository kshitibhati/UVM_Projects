class fifo_rdrv extends uvm_driver#(fifo_rdtrans);

`uvm_component_utils(fifo_rdrv)
 virtual fifo_if.RDR_MP vif;

function new(string name="fifo_rdrv",uvm_component parent=null);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
forever
begin
seq_item_port.get_next_item(req);
send_to_dut(req);
seq_item_port.item_done();
end
endtask

task send_to_dut(fifo_rdtrans req);
@(vif.rdr_cb); begin
vif.rdr_cb.rd_enb<=req.rd_enb;
//vif.rdr_cb.rd_addr<=req.rd_addr;
//vif.rdr_cb.rd_data<=req.rd_data;
end
endtask
endclass