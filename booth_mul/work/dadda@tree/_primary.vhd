library verilog;
use verilog.vl_types.all;
entity daddaTree is
    port(
        ops             : in     vl_logic_vector(5 downto 0);
        result          : out    vl_logic_vector(19 downto 0)
    );
end daddaTree;
