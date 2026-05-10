class fifo_wrseqr extends uvm_sequencer#(fifo_wrtrans);

`uvm_component_utils(fifo_wrseqr)

function new (string name = "fifo_wrseqr", uvm_component parent=null);
super.new(name,parent);
endfunction
endclass