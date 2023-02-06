library verilog;
use verilog.vl_types.all;
entity BranchALU is
    port(
        pc              : in     vl_logic_vector(31 downto 0);
        offset          : in     vl_logic_vector(31 downto 0);
        incr_pc         : out    vl_logic_vector(31 downto 0)
    );
end BranchALU;
