//`include "ram_test.sv"
module ram_top();

     import uvm_pkg::*;
      import ram_pkg::*;
   `include "uvm_macros.svh"

  bit clk,rst;
  ram_test test_h;
  
  ram_if inf(clk);
  
  //dut instantiation
    ram dut(.clk(clk),
	       .rst(inf.rst),
	       .wr_enb(inf.wr_enb),
		   .wr_addr(inf.wr_addr),
		   .wr_data(inf.wr_data),
		   .rd_enb(inf.rd_enb),
		   .rd_addr(inf.rd_addr),
		   .rd_data(inf.rd_data));
		   
  
   //function uvm_component find (string comp_match);
   //endfunction
  always
   #5 clk = ~clk;
   
   initial
   begin
   inf.rst=1;
   #10 inf.rst=0;
   end
   

   initial begin
	 uvm_config_db #(virtual ram_if)::set(null,"*","vif",inf);
     //run_test("ram_big_test");
	 run_test();
	
   end
   
endmodule