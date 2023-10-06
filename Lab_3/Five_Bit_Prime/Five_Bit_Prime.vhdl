library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity AND_3 is
 port (A, B, C : in std_logic ; Y : out std_logic);
end entity AND_3;

architecture Struct of AND_3 is
	signal S1, S2 : std_logic;
begin
	--component instances
	AND1 : AND_2 port map (A => A, B => B, Y => S1);
	AND2 : AND_2 port map (A => C, B => S1, Y => Y);
end Struct;




library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity OR_3 is
 port (A, B, C : in std_logic ; Y : out std_logic);
end entity OR_3;

architecture Struct of OR_3 is
	signal S1, S2 : std_logic;
begin
	--component instances
	OR1 : OR_2 port map (A => A, B => B, Y => S1);
	OR2 : OR_2 port map (A => C, B => S1, Y => Y);
end Struct;





library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity FIVE_BIT_PRIME is
  port (A, B, C, D, E: in std_logic; Y: out std_logic);
end entity FIVE_BIT_PRIME;

architecture Struct of FIVE_BIT_PRIME is
  signal nA, nB, nC, nD, S1, S2, S3, S4, S5, S6, S7, S8, S9, SF1, SF2, SF3, SF4, SF5, SF6, FF1, FF2 : std_logic;
  component AND_3 is
	port (A, B, C : in std_logic ; Y : out std_logic);
  end component AND_3;
  
  component OR_3 is
   port (A, B, C : in std_logic ; Y : out std_logic);
  end component OR_3;
  
begin
  -- component instances
  NOT1 : INVERTER port map (A => A, Y => nA);
  NOT2 : INVERTER port map (A => B, Y => nB);
  NOT3 : INVERTER port map (A => C, Y => nC);
  NOT4 : INVERTER port map (A => D, Y => nD);
  
  AND31 : AND_3 port map (A => nA, B => nB, C => nC, Y => S1);
  AND21 : AND_2 port map (A => S1, B => D, Y => SF1);
  
  AND32 : AND_3 port map (A => nB, B => D, C => E, Y => SF2);
  
  AND33 : AND_3 port map (A => nA, B => B, C => nC, Y => S2);
  AND22 : AND_2 port map (A => D, B => E, Y => S3);
  AND23 : AND_2 port map (A => S2, B => S3, Y => SF3);
  
  AND34 : AND_3 port map (A => A, B => nB, C => nC, Y => S4);
  AND24 : AND_2 port map (A => S4, B => E, Y => SF4);
  
  AND25 : AND_2 port map (A => C, B => E, Y => S5);
  XOR21 : XOR_2 port map (A => A, B => B, Y => S6);
  NOT5  : INVERTER port map (A => S6, Y => S7);
  AND26 : AND_2 port map (A => S5, B => S7, Y => SF5);
  
  XOR22 : XOR_2 port map (A => A, B => D, Y => S8);
  NOT6  : INVERTER port map (A => S8, Y => S9);
  AND27 : AND_2 port map (A => S5, B => S9, Y => SF6);
  
  OR31  : OR_3 port map (A => SF1, B => SF2, C => SF3, Y => FF1);
  OR32  : OR_3 port map (A => SF4, B => SF5, C => SF6, Y => FF2);
  OR21  : OR_2 port map (A => FF1, B => FF2, Y => Y);
end Struct;