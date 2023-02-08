library verilog;
use verilog.vl_types.all;
entity loadDataExt is
    port(
        fromMem         : in     vl_logic_vector(31 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        dataIn          : out    vl_logic_vector(31 downto 0)
    );
end loadDataExt;
