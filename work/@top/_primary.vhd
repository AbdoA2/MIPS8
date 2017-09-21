library verilog;
use verilog.vl_types.all;
entity Top is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dataout         : out    vl_logic_vector(7 downto 0);
        we              : out    vl_logic;
        INTR            : in     vl_logic_vector(1 downto 0)
    );
end Top;
