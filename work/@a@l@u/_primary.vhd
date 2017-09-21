library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        N               : integer := 8
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        y               : out    vl_logic_vector;
        s               : in     vl_logic_vector(2 downto 0);
        cin             : in     vl_logic;
        C               : out    vl_logic;
        V               : out    vl_logic;
        Z               : out    vl_logic;
        \S\             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end ALU;
