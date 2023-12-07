library verilog;
use verilog.vl_types.all;
entity halfAdder is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Sum             : out    vl_logic;
        Cout            : out    vl_logic
    );
end halfAdder;
