library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        PCin            : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        PCout           : out    vl_logic_vector(31 downto 0)
    );
end pc;
