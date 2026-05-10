class ram_virtual_sequencer extends uvm_sequencer #(uvm_sequence_item);

// UVM automation macro for sequencer
`uvm_component_utils(ram_virtual_sequencer) 
  
//create handle of write and read sequencer

ram_wseqr wseqr_h;
ram_rseqr rseqr_h;

//constructor

function new(string name="ram_virtual_sequencer" ,uvm_component parent=null);
 super.new(name,parent);
   endfunction
   
endclass    
