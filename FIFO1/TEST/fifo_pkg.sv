package fifo_pkg;
import uvm_pkg ::* ;
`include "uvm_macros.svh"


  `include "fifo_wtrans.sv"
  `include "fifo_rtrans.sv"
  
  `include "fifo_wseqs.sv"
  `include "fifo_rdseqs.sv"
  
  `include "fifo_wrseqr.sv"
  `include "fifo_rdseqr.sv"
 
  `include "fifo_wrdrv.sv"
  `include "fifo_rddrv.sv"
  
  `include "fifo_wmonitor.sv"
  `include "fifo_rdmonitor.sv"
  
  `include "fifo_wagent.sv"
  `include "fifo_rdagent.sv"
  
  `include "fifo_sb.sv"
  
  `include "fifo_env.sv"
  `include "fifo_test.sv"
 
 
  
  
endpackage