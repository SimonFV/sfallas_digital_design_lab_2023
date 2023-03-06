library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
	Port 
	(
		x, y, cin : in STD_LOGIC;
		cout, sum : out STD_LOGIC
	);
end FullAdder;

architecture synth of FullAdder is
	
begin

	sum <= x xor cin xor y;
	cout <= (x and y) or (y and cin) or (x and cin);

end synth;