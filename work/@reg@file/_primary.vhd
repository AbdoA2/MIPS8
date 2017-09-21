library verilog;
use verilog.vl_types.all;
entity RegFile is
    generic(
        N               : integer := 8;
        M               : integer := 2
    );
    port(
        clk             : in     vl_logic;
        a1              : in     vl_logic_vector;
        a2              : in     vl_logic_vector;
        wa3             : in     vl_logic_vector;
        d1              : out    vl_logic_vector;
        d2              : out    vl_logic_vector;
        wd3             : out    vl_logic_vector;
        we              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of M : constant is 1;
end RegFile;
