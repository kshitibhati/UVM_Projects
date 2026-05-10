class fifo_rdtrans extends uvm_sequence_item;

rand bit rd_enb;
rand bit [7:0] rd_data;
//rand bit [3:0] rd_addr;
bit [7:0] temp_data;
bit full;
bit empty;


constraint ENB {rd_enb==1;}

`uvm_object_utils_begin(fifo_rdtrans)
//`uvm_field_int(rd_addr,UVM_ALL_ON)
`uvm_field_int(rd_enb,UVM_ALL_ON)
`uvm_field_int(rd_data,UVM_ALL_ON)
`uvm_object_utils_end
function new (string name = "fifo_rdtrans");
super.new(name);
endfunction

endclass

