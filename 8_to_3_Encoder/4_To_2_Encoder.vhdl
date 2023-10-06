library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

package FourTwo is
 component FOUR_TWO_ENCODER is
	port (A, B, C, D, En : in std_logic; Y0, Y1 : out std_logic);
 end component FOUR_TWO_ENCODER;
end package FourTwo;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity FOUR_TWO_ENCODER is
  port (A, B, C, D, En: in std_logic; Y0, Y1: out std_logic);
end entity FOUR_TWO_ENCODER;

architecture Struct of FOUR_TWO_ENCODER is
  signal S1, S2 : std_logic;
begin
  -- component instances
  OR1 : OR_2 port map (A => A, B => B, Y => S1);
  OR2 : OR_2 port map (A => A, B => C, Y => S2);
  AND1 : AND_2 port map (A => S1, B => En, Y => Y1);
  AND2 : AND_2 port map (A => S2, B => En, Y => Y0);
end Struct;