library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_4_bits is

	Port (
		A, B : in STD_LOGIC_VECTOR (3 downto 0);
		Ci : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR (3 downto 0);
		Co : out STD_LOGIC);

end Adder_4_bits;

architecture arch of Adder_4_bits is

	component FullAdder is
	Port 
	(
		x, y, cin : in STD_LOGIC;
		cout, sum : out STD_LOGIC
	);
	end component;
	
	signal C : STD_LOGIC_VECTOR (3 downto 1);

begin

	a0 : FullAdder port map (A(0), B(0), Ci, C(1) , S(0));
	a1 : FullAdder port map (A(1), B(1), C(1), C(2) , S(1));
	a2 : FullAdder port map (A(2), B(2), C(2), C(3) , S(2));
	a3 : FullAdder port map (A(3), B(3), C(3), Co , S(3));
	
end arch;