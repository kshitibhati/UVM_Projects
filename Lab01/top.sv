

module top;
  	import uvm_pkg::*;
  
    // import the package
       import pkg::*;
	 
       
        trans transh_copy, transh_clone;


	trans transh[]; 
	
 	int no_of_trans=10;
        
 	initial
	begin

  	  transh = new[no_of_trans];

    	for(int i=0;i<no_of_trans;i++)
 	     begin
	         transh[i]=trans::type_id::create($sformatf("transh[%2d]",i));
	         assert(transh[i].randomize());

 	         transh[i].print(uvm_default_line_printer);
  	     end	
    	$display("*/*/*/*/*/*/*/*/*/*/*/*/*/*/*//*/*/");
      transh[2].copy(transh[5]);
     transh[2].print();

  	 transh_copy=trans::type_id::create("transh_copy");
      transh_copy.copy(transh[2]);
 	  transh_copy.print(uvm_default_table_printer);

       	if(transh[2].compare(transh[5], null))
           $display("COMPARE SUCCESSFUL");
       else
           $display("COMPARE FAILURE");
		   transh[2].print(uvm_default_table_printer);

  //	$cast(transh_clone,transh[8].clone());
//	transh_clone.print(uvm_default_tree_printer);

	//$cast(transh_clone, transh_copy.clone());
	//transh_clone.print(uvm_default_table_printer);


    	end


endmodule : top
