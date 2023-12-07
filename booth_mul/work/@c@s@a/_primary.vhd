library verilog;
use verilog.vl_types.all;
entity CSA is
    generic(
        sizeCSA         : integer := 20;
        sizeRCA         : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Carry_i         : in     vl_logic;
        S               : out    vl_logic_vector;
        Carry_o         : out    vl_logic
    );
end CSA;
