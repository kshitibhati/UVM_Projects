class fifo_base_rdseqs extends uvm_sequence#(fifo_rdtrans);
`uvm_object_utils(fifo_base_rdseqs)

fifo_rdtrans trans_h;

function new(string name = "fifo_base_rdseqs" );
super.new(name);
endfunction

task body();
repeat (30)
begin
trans_h=fifo_rdtrans::type_id::create("trans_h");
start_item(trans_h);
assert(trans_h.randomize());
finish_item(trans_h);
end
endtask

endclass