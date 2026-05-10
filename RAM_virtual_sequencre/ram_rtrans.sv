class ram_rtrans extends uvm_sequence_item; // uvm has no parent class because in uvm we have to extends all the class from uvm factory so parent class is only with uvm itself.

//read_signals
   rand bit rd_enb;
   randc bit [3:0] rd_addr;
   rand bit  [7:0] rd_data;
   bit[7:0] temp_data;
   constraint ENB {rd_enb==1'b1;}
   
   // factory registration of all components
   
   `uvm_object_utils_begin(ram_rtrans)
	 `uvm_field_int(rd_enb, UVM_ALL_ON)
	 `uvm_field_int(rd_addr, UVM_ALL_ON)
     `uvm_field_int(rd_data, UVM_ALL_ON)	  
	`uvm_object_utils_end
	
	function new (string name = "ram_rtrans");
	  super.new(name);
	endfunction

endclass