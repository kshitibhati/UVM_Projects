/* in sequencer, there is already item created because sequence and driver are not dependent on each other. start_item(req)in sequence will call
pre_do() in sequence, it will create sequence_item befor getting the call from the driver because they are independent to each othe. now when
driver wants item it will call sequencer for exicution of transection, so sequencer will call sequence for item. sequence will call pre_do()
and randomize item and call finish_item(req) and give it to the sequencer and sequencer will give the items to the driver and driver will
send the item to DUT by calling item_done(). see ppt DRV_SEQS_FLOW   */

class ram_base_wseqs extends uvm_sequence#(ram_wtrans);// here we do parameterzied class because we have to show uvm that we just want wtrans
                                                         //property like wr_addr,wr_data, wr_enb etc. which is already declare in wtrans.

   `uvm_object_utils(ram_base_wseqs)

    ram_wtrans trans_h;
   
    function new (string name = "ram_base_wseqs");
       super.new(name);
    endfunction
 
 task body();
  repeat(20) begin
   //`uvm_do(trans);
   //`uvm_do_with(trans with {wr_addr<7;});
   trans_h=ram_wtrans::type_id::create("trans_h");
   start_item(trans_h); //creat the transection class
   assert(trans_h.randomize());
   finish_item(trans_h); // generate the sequence item right after the exicution of finish.
  end
 endtask

endclass
		
		
		