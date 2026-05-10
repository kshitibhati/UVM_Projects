
module top;
  
     //import pkg.sv
        import pkg:: *;       

     // import the UVM package
   	    import uvm_pkg:: *;
    
	
     // include the uvm_macros.svh
	`include "uvm_macros.svh"
	 
  
  
 /*rpting rpt1;
  rpting rpt2;
  rpting rpt3;
  */
  initial begin
   
   /*rpt1 = new("rpt1",null);
   rpt2 = new("rpt2",null);
   rpt3 = new("rpt3",null);
   
   
   rpt1.set_report_verbosity_level(UVM_MEDIUM);
   $display("rpt1 = %p",rpt1);
   rpt2.set_report_verbosity_level(UVM_LOW);
   $display("rpt2 = %p",rpt2);
   set_report_verbosity_level(UVM_NONE);
   $display("rpt3 = %p",rpt3);*/
	uvm_top.set_report_verbosity_level(UVM_HIGH);
	run_test("test");
	end
	
 endmodule : top

