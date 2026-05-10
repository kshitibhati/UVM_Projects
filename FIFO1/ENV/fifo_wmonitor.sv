class fifo_wrmon extends uvm_monitor;
`uvm_component_utils(fifo_wrmon)
fifo_wrtrans trans_h;

virtual fifo_if.WMON_MP vif;
   
   uvm_analysis_port#(fifo_wrtrans)wmon_an_port;

function new (string name ="fifo_wrmon",uvm_component parent=null);
super.new(name,parent);
wmon_an_port = new("wmon_an_port",this);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
forever
begin
 monitor();
 wmon_an_port.write(trans_h);
end 
endtask

task monitor();
trans_h = fifo_wrtrans::type_id::create("trans_h");
@(vif.wmon_cb)
  trans_h.wr_enb=vif.wmon_cb.wr_enb;
  trans_h.wr_data=vif.wmon_cb.wr_data;
  //trans_h.wr_addr=vif.wmon_cb.wr_addr;
 //$display(" DATA MISMATCH ! wr_data = %d ",trans_h.wr_data );
  
endtask
endclass