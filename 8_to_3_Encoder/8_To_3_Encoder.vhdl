library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.FourTwo.all;

entity EIGHT_THREE_ENCODER is
  port (Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, En: in std_logic; A2, A1, A0: out std_logic);
end entity EIGHT_THREE_ENCODER;

architecture Struct of EIGHT_THREE_ENCODER is
  signal S1, S2, S3, S4, S5, S6 : std_logic;
begin
  -- component instances
  EFT1 : FOUR_TWO_ENCODER port map (A => Y7, B => Y6, C => Y5, D => Y4, En => En, Y1 => S1, Y0 => S2);
  EFT2 : FOUR_TWO_ENCODER port map (A => Y5, B => Y4, C => Y3, D => Y2, En => En, Y1 => S3, Y0 => S4);
  EFT3 : FOUR_TWO_ENCODER port map (A => Y3, B => Y2, C => Y1, D => Y0, En => En, Y1 => S5, Y0 => S6);
  OR1 : OR_2 port map (A => S2, B => S6, Y => A0);
  OR2 : OR_2 port map (A => S1, B => S5, Y => A1);
  OR3 : OR_2 port map (A => S1, B => S3, Y => A2);
end Struct;