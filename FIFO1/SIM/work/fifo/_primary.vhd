library verilog;
use verilog.vl_types.all;
entity fifo is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wr_enb          : in     vl_logic;
        wr_data         : in     vl_logic_vector(7 downto 0);
        rd_enb          : in     vl_logic;
        rd_data         : out    vl_logic_vector(7 downto 0);
        full            : out    vl_logic;
        empty           : out    vl_logic
    );
end fifo;
