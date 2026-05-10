class fifo_wrtrans extends uvm_sequence_item;

rand bit[7:0] wr_data;
//rand bit [3:0] wr_addr;
rand bit wr_enb;
bit [7:0] temp_data;
bit full;
bit empty;

constraint ENB {wr_enb==1;}

`uvm_object_utils_begin(fifo_wrtrans)
//`uvm_field_int(wr_addr,UVM_ALL_ON)
`uvm_field_int(wr_enb,UVM_ALL_ON)
`uvm_field_int(wr_data,UVM_ALL_ON)
`uvm_field_int(temp_data,UVM_ALL_ON)
`uvm_object_utils_end

function new(string name = "fifo_wrtrans");
super.new(name);
endfunction

endclass
