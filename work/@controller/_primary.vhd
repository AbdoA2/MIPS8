library verilog;
use verilog.vl_types.all;
entity Controller is
    generic(
        FETCH_IR1       : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        FETCH_IR2       : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        DECODE          : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi1, Hi0);
        EXECUTE         : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi1, Hi1);
        BR_JMP          : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        WB_R            : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi1, Hi0, Hi1);
        MOV             : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi1, Hi1, Hi0);
        STI             : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi1, Hi1, Hi1);
        LDI             : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        STD             : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi0, Hi0, Hi1);
        LDD             : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi0, Hi1, Hi0);
        WB_MEM          : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi0, Hi1, Hi1);
        IMM_OP          : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi1, Hi0, Hi0);
        EXEC_LOOP       : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi1, Hi0, Hi1);
        INC_ADDR        : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi1, Hi1, Hi0);
        DEC_ADDR        : vl_logic_vector(4 downto 0) := (Hi0, Hi1, Hi1, Hi1, Hi1);
        WB_ADDR         : vl_logic_vector(4 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr           : in     vl_logic_vector(15 downto 0);
        INTR            : in     vl_logic_vector(1 downto 0);
        seg             : out    vl_logic;
        enPC            : out    vl_logic;
        enIR            : out    vl_logic_vector(1 downto 0);
        enData          : out    vl_logic;
        enFlags         : out    vl_logic;
        we              : out    vl_logic;
        addrSrc         : out    vl_logic_vector(1 downto 0);
        PCsrc           : out    vl_logic;
        regSrc          : out    vl_logic_vector(2 downto 0);
        regDst          : out    vl_logic_vector(1 downto 0);
        srcA            : out    vl_logic_vector(1 downto 0);
        srcB            : out    vl_logic_vector(1 downto 0);
        aluop           : out    vl_logic_vector(2 downto 0);
        cin             : out    vl_logic;
        mem_we          : out    vl_logic;
        JR              : out    vl_logic;
        CF              : in     vl_logic;
        VF              : in     vl_logic;
        ZF              : in     vl_logic;
        SF              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FETCH_IR1 : constant is 2;
    attribute mti_svvh_generic_type of FETCH_IR2 : constant is 2;
    attribute mti_svvh_generic_type of DECODE : constant is 2;
    attribute mti_svvh_generic_type of EXECUTE : constant is 2;
    attribute mti_svvh_generic_type of BR_JMP : constant is 2;
    attribute mti_svvh_generic_type of WB_R : constant is 2;
    attribute mti_svvh_generic_type of MOV : constant is 2;
    attribute mti_svvh_generic_type of STI : constant is 2;
    attribute mti_svvh_generic_type of LDI : constant is 2;
    attribute mti_svvh_generic_type of STD : constant is 2;
    attribute mti_svvh_generic_type of LDD : constant is 2;
    attribute mti_svvh_generic_type of WB_MEM : constant is 2;
    attribute mti_svvh_generic_type of IMM_OP : constant is 2;
    attribute mti_svvh_generic_type of EXEC_LOOP : constant is 2;
    attribute mti_svvh_generic_type of INC_ADDR : constant is 2;
    attribute mti_svvh_generic_type of DEC_ADDR : constant is 2;
    attribute mti_svvh_generic_type of WB_ADDR : constant is 2;
end Controller;