class fifo_rdseqr extends uvm_sequencer#(fifo_rdtrans);

`uvm_component_utils(fifo_rdseqr)

function new (string name = "fifo_rdseqr" , uvm_component parent=null);
super.new(name,parent);
endfunction
endclass