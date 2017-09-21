library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        addr            : out    vl_logic_vector(7 downto 0);
        datain          : in     vl_logic_vector(7 downto 0);
        dataout         : out    vl_logic_vector(7 downto 0);
        instr           : out    vl_logic_vector(15 downto 0);
        enPC            : in     vl_logic;
        enIR            : in     vl_logic_vector(1 downto 0);
        enData          : in     vl_logic;
        enFlags         : in     vl_logic;
        we              : in     vl_logic;
        addrSrc         : in     vl_logic_vector(1 downto 0);
        PCsrc           : in     vl_logic;
        regSrc          : in     vl_logic_vector(2 downto 0);
        regDst          : in     vl_logic_vector(1 downto 0);
        srcA            : in     vl_logic_vector(1 downto 0);
        srcB            : in     vl_logic_vector(1 downto 0);
        aluop           : in     vl_logic_vector(2 downto 0);
        cin             : in     vl_logic;
        JR              : in     vl_logic;
        CF              : out    vl_logic;
        VF              : out    vl_logic;
        ZF              : out    vl_logic;
        SF              : out    vl_logic
    );
end Datapath;
