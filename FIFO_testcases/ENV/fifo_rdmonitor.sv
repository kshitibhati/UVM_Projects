class fifo_rdmon extends uvm_monitor;
`uvm_component_utils(fifo_rdmon)

fifo_rdtrans trans_h;

virtual fifo_if.RMON_MP vif;
   
   uvm_analysis_port#(fifo_rdtrans)rmon_an_port;

function new (string name = "fifo_rdmon",uvm_component parent=null);
super.new(name,parent);
rmon_an_port =new("rmon_an_port",this);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
forever
begin
monitor();
 rmon_an_port.write(trans_h);
end 
endtask

task monitor();
trans_h = fifo_rdtrans::type_id::create("trans_h"); 
@(vif.rmon_cb);
  trans_h.rd_enb=vif.rmon_cb.rd_enb;
  trans_h.rd_data=vif.rmon_cb.rd_data;
  //trans_h.rd_addr=vif.rmon_cb.rd_addr;
 // $display(" DATA MISMATCH ! RD_data = %d : %d = temp_data",rdtrans_h.rd_data,rdtrans_h.temp_data);

endtask
endclass