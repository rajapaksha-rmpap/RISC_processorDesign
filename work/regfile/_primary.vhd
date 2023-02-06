library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        fromReg1        : out    vl_logic_vector(31 downto 0);
        fromReg2        : out    vl_logic_vector(31 downto 0);
        toReg           : in     vl_logic_vector(31 downto 0);
        rs2             : in     vl_logic_vector(4 downto 0);
        rs1             : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        clk             : in     vl_logic
    );
end regfile;
