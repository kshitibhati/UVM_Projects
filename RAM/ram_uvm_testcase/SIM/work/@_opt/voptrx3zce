library verilog;
use verilog.vl_types.all;
entity ram is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wr_enb          : in     vl_logic;
        wr_addr         : in     vl_logic_vector(3 downto 0);
        wr_data         : in     vl_logic_vector(7 downto 0);
        rd_enb          : in     vl_logic;
        rd_addr         : in     vl_logic_vector(3 downto 0);
        rd_data         : out    vl_logic_vector(7 downto 0)
    );
end ram;
