library verilog;
use verilog.vl_types.all;
entity floprIR is
    generic(
        N               : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic_vector(1 downto 0);
        d               : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end floprIR;
