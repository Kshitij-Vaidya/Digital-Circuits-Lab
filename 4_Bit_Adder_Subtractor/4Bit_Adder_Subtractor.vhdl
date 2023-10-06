library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Create a package that conatins components of Half and Full Adders to be used later
package Adders is
	component FULL_ADDER is
	 port (A, B, Cin : in std_logic ; S, Cout : out std_logic);
	end component FULL_ADDER;
	
	component HALF_ADDER is
	 port (A, B : in std_logic ; S, Cy : out std_logic);
	end component HALF_ADDER;
end package Adders;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.Gates_NAND.all;

-- Entity Architecture pair of HALF-ADDER
entity HALF_ADDER is
	port (A, B : in std_logic ; S, Cy : out std_logic);
end entity HALF_ADDER;

architecture Struct of HALF_ADDER is
begin
	XOR1 : XOR_GATE port map (A => A, B => B, C => S);
	AND1 : AND_GATE port map (A => A, B => B, C => Cy);
end Struct;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.Gates_NAND.all;
use work.Adders.all;

--Entity Architecture pair of FULL-ADDER
entity FULL_ADDER is
	port (A, B, Cin : in std_logic ; S, Cout : out std_logic);
end entity FULL_ADDER;

architecture Struct of FULL_ADDER is
	signal S1, Cy1, Cy2 : std_logic;	
begin
	HA1 : HALF_ADDER port map (A => A, B => B, S => S1, Cy => Cy1);
	HA2 : HALF_ADDER port map (A => S1, B => Cin, S => S, Cy => Cy2);
	OR1 : OR_GATE port map (A => Cy1, B => Cy2, C => Cout);
end Struct;


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.Gates_NAND.all;
use work.Adders.all;

--Entity Architecture pair for a 4-Bit Adder Subtractor
entity ADDER_SUBTRACTOR is
	port (M, A0, A1, A2, A3, B0, B1, B2, B3 : in std_logic ; S0, S1, S2, S3, Cout : out std_logic);
end entity ADDER_SUBTRACTOR;

architecture Struct of ADDER_SUBTRACTOR is
	signal X1, X2, X3, X4, C1, C2, C3 : std_logic;
begin
	XOR1 : XOR_GATE port map (A => B0, B => M, C => X1);
	FA1 : FULL_ADDER port map (A => A0, B => X1, Cin => M, S => S0, Cout => C1);
	
	XOR2 : XOR_GATE port map (A => B1, B => M, C => X2);
	FA2 : FULL_ADDER port map (A => A1, B => X2, Cin => C1, S => S1, Cout => C2);

	XOR3 : XOR_GATE port map (A => B2, B => M, C => X3);
	FA3 : FULL_ADDER port map (A => A2, B => X3, Cin => C2, S => S2, Cout => C3);
	
	XOR4 : XOR_GATE port map (A => B3, B => M, C => X4);
	FA4 : FULL_ADDER port map (A => A3, B => X4, Cin => C3, S => S3, Cout => Cout);
end Struct;
	
	
	

	