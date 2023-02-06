library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        ALUopr          : in     vl_logic_vector(2 downto 0);
        SUBorSRA        : in     vl_logic;
        ALUout          : out    vl_logic_vector(31 downto 0);
        z               : out    vl_logic
    );
end ALU;
