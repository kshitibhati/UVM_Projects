//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

  class trans extends uvm_sequence_item;


	rand bit[7 : 0] data;    
	rand bit[3 : 0] address;
	rand bit write;
	
//factory registration and use macros for all the fields
  `uvm_object_utils_begin(trans)
  `uvm_field_int(data,UVM_ALL_ON )
  `uvm_field_int(address,UVM_ALL_ON)
  `uvm_field_int(write,UVM_ALL_ON)
  `uvm_object_utils_end
  
  
//standard UVM Methods:
 extern function new(string name="trans");
 
endclass:trans

//-----------------  constructor new method  -------------------//
//Add code for new()

 function trans::new(string name="trans");
    super.new(name);
 endfunction
   
