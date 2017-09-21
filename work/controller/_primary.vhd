library verilog;
use verilog.vl_types.all;
entity controller is
    generic(
        FETCH_IR        : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        DECODE          : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        EXECUTE         : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        FETCH_IMM       : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        BR_JMP          : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr           : in     vl_logic_vector(7 downto 0);
        CF              : in     vl_logic;
        VF              : in     vl_logic;
        ZF              : in     vl_logic;
        SF              : in     vl_logic;
        IoD             : out    vl_logic;
        PCsrc           : out    vl_logic_vector(1 downto 0);
        enPC            : out    vl_logic;
        enIR            : out    vl_logic;
        enData          : out    vl_logic;
        enFlags         : out    vl_logic;
        memReg          : out    vl_logic;
        memAddr         : out    vl_logic;
        we              : out    vl_logic;
        aluop           : out    vl_logic_vector(2 downto 0);
        cin             : out    vl_logic;
        srcA            : out    vl_logic_vector(1 downto 0);
        srcB            : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FETCH_IR : constant is 2;
    attribute mti_svvh_generic_type of DECODE : constant is 2;
    attribute mti_svvh_generic_type of EXECUTE : constant is 2;
    attribute mti_svvh_generic_type of FETCH_IMM : constant is 2;
    attribute mti_svvh_generic_type of BR_JMP : constant is 2;
end controller;
