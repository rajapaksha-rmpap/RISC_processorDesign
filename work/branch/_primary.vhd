library verilog;
use verilog.vl_types.all;
entity branch is
    port(
        BranchEn        : in     vl_logic;
        IsUncond        : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        z               : in     vl_logic;
        lt              : in     vl_logic;
        Branch          : out    vl_logic
    );
end branch;
