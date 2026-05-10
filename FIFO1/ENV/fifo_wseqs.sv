class fifo_base_wrseqs extends uvm_sequence # (fifo_wrtrans);
`uvm_object_utils(fifo_base_wrseqs)//it is not in hierarchy so we will use object macro 

fifo_wrtrans trans_h;

function new (string name = "fifo_base_wrseqs");
super.new(name);
endfunction

task body ();
repeat(30)
begin
trans_h=fifo_wrtrans::type_id::create("trans_h");
start_item(trans_h);
assert (trans_h.randomize());
finish_item(trans_h);
end
endtask
endclass

