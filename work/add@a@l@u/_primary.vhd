library verilog;
use verilog.vl_types.all;
entity addALU is
    port(
        PCout           : in     vl_logic_vector(31 downto 0);
        offset          : in     vl_logic_vector(31 downto 0);
        increPC         : out    vl_logic_vector(31 downto 0)
    );
end addALU;
