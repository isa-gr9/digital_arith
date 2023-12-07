library verilog;
use verilog.vl_types.all;
entity CS_block is
    generic(
        sizeRCA         : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        sel             : in     vl_logic;
        S               : out    vl_logic_vector;
        Carry_o         : out    vl_logic
    );
end CS_block;
