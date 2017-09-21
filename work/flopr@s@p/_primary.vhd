library verilog;
use verilog.vl_types.all;
entity floprSP is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        d               : in     vl_logic_vector(7 downto 0);
        q               : out    vl_logic_vector(7 downto 0)
    );
end floprSP;
