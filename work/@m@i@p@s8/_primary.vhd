library verilog;
use verilog.vl_types.all;
entity MIPS8 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        addr            : out    vl_logic_vector(8 downto 0);
        datain          : in     vl_logic_vector(7 downto 0);
        dataout         : out    vl_logic_vector(7 downto 0);
        mem_we          : out    vl_logic;
        INTR            : in     vl_logic_vector(1 downto 0)
    );
end MIPS8;
