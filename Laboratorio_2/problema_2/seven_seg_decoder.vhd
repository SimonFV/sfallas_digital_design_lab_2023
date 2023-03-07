library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg_decoder is
	
	port(data: in STD_LOGIC_VECTOR (5 downto 0);
	     segments: out STD_LOGIC_VECTOR (14 downto 0));
	
end;

architecture synth of seven_seg_decoder is

begin

	process(data) begin

		case data is
		--                           
		when X"0" => segments <= "10000001000000"; --00
--		6'b000001: display_out = 14'b10000001111001; //01
--		6'b000010: display_out = 14'b10000000100100; //02
--		6'b000011: display_out = 14'b10000000110000; //03
--		6'b000100: display_out = 14'b10000000011001; //04
--		6'b000101: display_out = 14'b10000000010010; //05
--		6'b000110: display_out = 14'b10000000000010; //06
--		6'b000111: display_out = 14'b10000001111000; //07
--		6'b001000: display_out = 14'b10000000000000; //08
--		6'b001001: display_out = 14'b10000000011000; //09
--		6'b001010: display_out = 14'b11110011000000; //10
--		6'b001011: display_out = 14'b11110011111001; //11
--		6'b001100: display_out = 14'b11110010100100; //12
--		6'b001101: display_out = 14'b11110010110000; //13
--		6'b001110: display_out = 14'b11110010011001; //14
--		6'b001111: display_out = 14'b11110010010010; //15
--		
--		6'b010000: display_out = 14'b11110010000010; //16
--		6'b010001: display_out = 14'b11110011111000; //17
--		6'b010010: display_out = 14'b11110010000000; //18
--		6'b010011: display_out = 14'b11110010011000; //19
--		6'b010100: display_out = 14'b01001001000000; //20
--		6'b010101: display_out = 14'b01001001111001; //21
--		6'b010110: display_out = 14'b01001000100100; //22
--		6'b010111: display_out = 14'b01001000110000; //23
--		6'b011000: display_out = 14'b01001000011001; //24
--		6'b011001: display_out = 14'b01001000010010; //25
--		6'b011010: display_out = 14'b01001000000010; //26
--		6'b011011: display_out = 14'b01001001111000; //27
--		6'b011100: display_out = 14'b01001000000000; //28
--		6'b011101: display_out = 14'b01001000011000; //29
--		6'b011110: display_out = 14'b01100001000000; //30
--		6'b011111: display_out = 14'b01100001111001; //31
		
		end case;
	
	end process;
end;


