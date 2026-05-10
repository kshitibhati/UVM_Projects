/* how we are passing the actual inter face to driver ? -> in top we will set the config db  */

//`include "ram_test.sv"
module ram_top();

     import uvm_pkg::*;
      import ram_pkg::*;
   `include "uvm_macros.svh"
    `include "ram_test.sv"
  

  bit clk,rst;
  
  ram_if inf(clk);
  
  //dut instantiation
  ram dut (.clk(clk),
            .rst(inf.rst),
           .wr_enb(inf.wr_enb),
            .wr_addr(inf.wr_addr),
            .wr_data(inf.wr_data),
            .rd_enb(inf.rd_enb),
            .rd_addr(inf.rd_addr),
            .rd_data(inf.rd_data));
   //(.wr_addr(inf.wr_addr)
  
  always
   #5 clk = ~clk;
   
   initial begin
   inf.rst = 1;
   #10 inf.rst = 0;
   end
   
   
   initial begin
	 uvm_config_db #(virtual ram_if)::set(null,"*","vif",inf); //set is void type not return any 1bit value
     run_test("ram_test");
   end
   
endmodule