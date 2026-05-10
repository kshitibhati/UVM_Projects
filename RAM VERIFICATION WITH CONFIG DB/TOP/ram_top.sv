//`include "ram_test.sv"
module ram_top();
	 import ram_pkg::*; 
     import uvm_pkg::*;
	 

   `include "uvm_macros.svh"

  bit clk;
  
  ram_if inf(clk);
  
  //dut instantiation
  ram_16x8 DUT (.clk(clk),
			.rst(inf.rst),
			.wr_enb(inf.wr_enb),
            .wr_addr(inf.wr_addr),
			.wr_data(inf.wr_data),
			.rd_enb(inf.rd_enb),
			.rd_addr(inf.rd_addr),
			.rd_data(inf.rd_data));
  
  always
   #5 clk = ~clk;
   
   initial begin
	 uvm_config_db #(virtual ram_if)::set(null,"*","vif",inf);
     run_test("ram_test");
   end
   
endmodule