library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dataout         : in     vl_logic_vector(7 downto 0);
        we              : in     vl_logic
    );
end top;
