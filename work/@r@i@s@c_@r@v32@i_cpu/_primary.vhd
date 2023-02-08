library verilog;
use verilog.vl_types.all;
entity RISC_RV32I_cpu is
    port(
        instr           : in     vl_logic_vector(31 downto 0);
        instrAddr       : out    vl_logic_vector(31 downto 0);
        toMem           : out    vl_logic_vector(31 downto 0);
        fromMem         : in     vl_logic_vector(31 downto 0);
        MemAddr         : out    vl_logic_vector(31 downto 0);
        WriteEn         : out    vl_logic;
        ReadEn          : out    vl_logic;
        addMemControl   : out    vl_logic_vector(1 downto 0);
        clk             : in     vl_logic
    );
end RISC_RV32I_cpu;
