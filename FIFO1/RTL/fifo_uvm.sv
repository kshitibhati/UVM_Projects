`define DATA_WIDTH 8
`define DEPTH 16
`define ADDR_WIDTH 4

module fifo    (clk,
                rst,
				wr_enb,
				wr_data,
				rd_enb,
				rd_data,
				full,
				empty/*wr_pointer,rd_pointer*/);
				
		


//input ports
input clk, rst;

//write signals
input                   wr_enb;
input [`DATA_WIDTH-1:0] wr_data;

//read input signals
input  rd_enb;

//read output signal 
output reg  [`DATA_WIDTH-1:0] rd_data;


//output ports
output reg full, empty;



// internal pointers
 reg [4:0] wr_pointer;
 reg /*[`ADDR_WIDTH-1:0]*/ [4:0]rd_pointer;


//internal memory
 reg [`DATA_WIDTH-1:0] mem [0:`DEPTH-1];
 reg /*[`DATA_WIDTH-1:0]*/[4:0]i;

// read and write pointer logic

always@(posedge clk)
begin
if (rst)
    begin
	 
         wr_pointer<=5'd0;
	     rd_pointer<=5'd0;
       
    end
 
else
begin
if (wr_enb && !full)
    begin
	     mem[wr_pointer[3:0]]<=wr_data;
		 wr_pointer<=wr_pointer+1'b1;
		  end
		 
if (rd_enb && !empty)
    begin
	     rd_data<=mem[rd_pointer[3:0]];
		 rd_pointer<=rd_pointer+1'b1;
    end
	 /*sim:/fifo_top/DUT/fifo_mem
	else if (rd_enb && !empty &&  rd_pointer<=5'd16)
	rd_pointer<=5'd0;*/
end
end
//full & empty logic
always@(*)
if(rst)
begin
	      full = 0;
	      empty = 1;
end
else    
begin
if(rd_pointer==wr_pointer)
	 empty =1;
else
     empty = 0;
	 

if ((wr_pointer[3:0] == rd_pointer[3:0] ) && (wr_pointer[4] != rd_pointer[4]))
	 full=1;
else
     full=0;

end
endmodule 