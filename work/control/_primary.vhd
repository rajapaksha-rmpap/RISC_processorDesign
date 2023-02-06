library verilog;
use verilog.vl_types.all;
entity control is
    port(
        opcode          : in     vl_logic_vector(6 downto 0);
        controls        : out    vl_logic_vector(9 downto 0)
    );
end control;
