library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture behavoir of testbench is

	component Adder_4_bits
	Port (
		A, B : in STD_LOGIC_VECTOR (3 downto 0);
		Ci : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR (3 downto 0);
		Co : out STD_LOGIC);
	end component;
	
	signal A : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal B : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal Ci : STD_LOGIC := '0';
	
	signal S : STD_LOGIC_VECTOR (3 downto 0);
	signal Co : STD_LOGIC;
	
begin

	uut: Adder_4_bits Port map(
	A => A,
	B => B,
	Ci => Ci,
	S => S,
	Co => Co
	);

	stim_proc : process
	begin
	
		A <= "1010";
		B <= "0101";
		Ci <= '0';
		
		wait for 10ns;
		
		A <= "1010";
		B <= "0111";
		
		wait for 10ns;
		
		A <= "0000";
		B <= "0111";
		
		wait for 10ns;
		
		A <= "1111";
		B <= "0111";
		
		wait;
	end process;
	
end;