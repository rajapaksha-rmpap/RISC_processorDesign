library verilog;
use verilog.vl_types.all;
entity ALUopration is
    port(
        ALUcontrol      : in     vl_logic;
        IRtype          : in     vl_logic;
        BranchEn        : in     vl_logic;
        funct7          : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        ALUopr          : out    vl_logic_vector(2 downto 0);
        SUBorSRA        : out    vl_logic
    );
end ALUopration;
