library verilog;
use verilog.vl_types.all;
entity RAM is
    generic(
        N               : integer := 8;
        M               : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        addr            : in     vl_logic_vector;
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic_vector;
        we              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of M : constant is 1;
end RAM;
