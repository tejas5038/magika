library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk     : in  std_logic;
        reset_n : in  std_logic;
        enable  : in  std_logic;
        count   : out unsigned(7 downto 0)
    );
end entity counter;

architecture rtl of counter is
    signal value : unsigned(7 downto 0) := (others => '0');
begin
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            value <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                value <= value + 1;
            end if;
        end if;
    end process;

    count <= value;
end architecture rtl;
