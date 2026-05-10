//When do you need a virtual sequencer? 
//If you only have a single driving agent, you do not need a virtual sequencer.
//If you have multiple driving agents but no stimulus coordination is required, you do not need a virtual se- quencer.
//If you have multiple driving agents and stimulus coordination IS required, you need a virtual sequencer.

/* A virtual sequencer is a uvm_sequencer which contains the handles of all the target sequencers focused on each point interface. 
A virtual sequence can be started on a virtual sequencer and the virtual sequence can generate and run sub-sequences on target
 sequencers in a coordinated manner.*/

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
