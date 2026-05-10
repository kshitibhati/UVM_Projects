class ram_wtrans extends uvm_sequence_item;

//write_signals
   rand bit wr_enb;
   randc bit [3:0] wr_addr;
   rand bit [7:0] wr_data;
   bit[7:0] temp_data;
   
   constraint ENB {wr_enb==1'b1;}

//--------------------------------------------//   
   `uvm_object_utils_begin(ram_wtrans)
     `uvm_field_int(wr_enb, UVM_ALL_ON)
	 `uvm_field_int(wr_addr, UVM_ALL_ON)
	 `uvm_field_int(wr_data, UVM_ALL_ON)
	`uvm_object_utils_end

//--------------------------------------------//	
	function new (string name = "ram_wtrans");
	  super.new(name);
	endfunction

endclass:ram_wtrans
