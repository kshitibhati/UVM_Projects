
//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

  class trans extends uvm_sequence_item;
  
    	`uvm_object_utils(trans)


	 rand bit[7 : 0] data;
	 rand bit[3 : 0] address;
	 rand bit write;
  
         
extern function new(string name = "trans"); //function defined outside class body
extern function void do_copy(uvm_object rhs);
extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
extern function void do_print(uvm_printer printer);
endclass:trans

//
	function trans::new(string name = "trans"); // :: <--Scope resolution operator
		super.new(name);
	endfunction:new
	  
    function void trans::do_copy (uvm_object rhs);

      trans transh; //transh is handle

      // checks compatibility
      if(!$cast(transh,rhs)) begin
      `uvm_fatal("do_copy","cast of the rhs object failed")
	  end
      super.do_copy(rhs);

      data= transh.data;
      address= transh.address;
      write= transh.write;
  

    endfunction:do_copy


    function bit  trans::do_compare (uvm_object rhs,uvm_comparer comparer);

      trans transh;

      if(!$cast(transh,rhs)) begin
      `uvm_fatal("do_compare","cast of the rhs object failed")
      return 0;
      end


      return super.do_compare(rhs,comparer) &&
      data== transh.data && 
	  address== transh.address &&
      write== transh.write;

    endfunction:do_compare 

   //Use printer.print_field for integral variables
   //Use printer.print_generic for enum variables
   function void  trans::do_print (uvm_printer printer);
    super.do_print(printer);
   //    
   //                    string name  bitstream value     size    radix for printing
    printer.print_field( "data",      this.data,           64,		 UVM_DEC	);
    printer.print_field( "address",   this.address, 	   12,		 UVM_DEC	);
    printer.print_field( "write",     this.write, 	        1,		 UVM_DEC	);
   
   // printer.print_object("transh",transh);       // prints everything included in trans handle
 

  endfunction:do_print
