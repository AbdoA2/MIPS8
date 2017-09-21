library verilog;
use verilog.vl_types.all;
entity Adder is
    generic(
        N               : integer := 8
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        cin             : in     vl_logic;
        s               : out    vl_logic_vector;
        cout            : out    vl_logic;
        v               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end Adder;
