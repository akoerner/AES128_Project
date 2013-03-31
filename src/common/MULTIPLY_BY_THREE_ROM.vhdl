library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MULTIPLY_BY_THREE_ROM is
port (
	   ADDRESS :in std_logic_vector(7 downto 0); 
	   DATA :out std_logic_vector(7 downto 0) 
	  );
end MULTIPLY_BY_THREE_ROM;

architecture Behavioral of MULTIPLY_BY_THREE_ROM is
 subtype ROM_WORD is STD_LOGIC_VECTOR (7 downto 0);

     type ROM_TABLE is array (0 to 255) of ROM_WORD;
     constant ROM: ROM_TABLE := ROM_TABLE'(
								ROM_WORD'("00000000"),
								ROM_WORD'("00000011"),
								ROM_WORD'("00000110"),
								ROM_WORD'("00000101"),
								ROM_WORD'("00001100"),
								ROM_WORD'("00001111"),
								ROM_WORD'("00001010"),
								ROM_WORD'("00001001"),
								ROM_WORD'("00011000"),
								ROM_WORD'("00011011"),
								ROM_WORD'("00011110"),
								ROM_WORD'("00011101"),
								ROM_WORD'("00010100"),
								ROM_WORD'("00010111"),
								ROM_WORD'("00010010"),
								ROM_WORD'("00010001"),
								ROM_WORD'("00110000"),
								ROM_WORD'("00110011"),
								ROM_WORD'("00110110"),
								ROM_WORD'("00110101"),
								ROM_WORD'("00111100"),
								ROM_WORD'("00111111"),
								ROM_WORD'("00111010"),
								ROM_WORD'("00111001"),
								ROM_WORD'("00101000"),
								ROM_WORD'("00101011"),
								ROM_WORD'("00101110"),
								ROM_WORD'("00101101"),
								ROM_WORD'("00100100"),
								ROM_WORD'("00100111"),
								ROM_WORD'("00100010"),
								ROM_WORD'("00100001"),
								ROM_WORD'("01100000"),
								ROM_WORD'("01100011"),
								ROM_WORD'("01100110"),
								ROM_WORD'("01100101"),
								ROM_WORD'("01101100"),
								ROM_WORD'("01101111"),
								ROM_WORD'("01101010"),
								ROM_WORD'("01101001"),
								ROM_WORD'("01111000"),
								ROM_WORD'("01111011"),
								ROM_WORD'("01111110"),
								ROM_WORD'("01111101"),
								ROM_WORD'("01110100"),
								ROM_WORD'("01110111"),
								ROM_WORD'("01110010"),
								ROM_WORD'("01110001"),
								ROM_WORD'("01010000"),
								ROM_WORD'("01010011"),
								ROM_WORD'("01010110"),
								ROM_WORD'("01010101"),
								ROM_WORD'("01011100"),
								ROM_WORD'("01011111"),
								ROM_WORD'("01011010"),
								ROM_WORD'("01011001"),
								ROM_WORD'("01001000"),
								ROM_WORD'("01001011"),
								ROM_WORD'("01001110"),
								ROM_WORD'("01001101"),
								ROM_WORD'("01000100"),
								ROM_WORD'("01000111"),
								ROM_WORD'("01000010"),
								ROM_WORD'("01000001"),
								ROM_WORD'("11000000"),
								ROM_WORD'("11000011"),
								ROM_WORD'("11000110"),
								ROM_WORD'("11000101"),
								ROM_WORD'("11001100"),
								ROM_WORD'("11001111"),
								ROM_WORD'("11001010"),
								ROM_WORD'("11001001"),
								ROM_WORD'("11011000"),
								ROM_WORD'("11011011"),
								ROM_WORD'("11011110"),
								ROM_WORD'("11011101"),
								ROM_WORD'("11010100"),
								ROM_WORD'("11010111"),
								ROM_WORD'("11010010"),
								ROM_WORD'("11010001"),
								ROM_WORD'("11110000"),
								ROM_WORD'("11110011"),
								ROM_WORD'("11110110"),
								ROM_WORD'("11110101"),
								ROM_WORD'("11111100"),
								ROM_WORD'("11111111"),
								ROM_WORD'("11111010"),
								ROM_WORD'("11111001"),
								ROM_WORD'("11101000"),
								ROM_WORD'("11101011"),
								ROM_WORD'("11101110"),
								ROM_WORD'("11101101"),
								ROM_WORD'("11100100"),
								ROM_WORD'("11100111"),
								ROM_WORD'("11100010"),
								ROM_WORD'("11100001"),
								ROM_WORD'("10100000"),
								ROM_WORD'("10100011"),
								ROM_WORD'("10100110"),
								ROM_WORD'("10100101"),
								ROM_WORD'("10101100"),
								ROM_WORD'("10101111"),
								ROM_WORD'("10101010"),
								ROM_WORD'("10101001"),
								ROM_WORD'("10111000"),
								ROM_WORD'("10111011"),
								ROM_WORD'("10111110"),
								ROM_WORD'("10111101"),
								ROM_WORD'("10110100"),
								ROM_WORD'("10110111"),
								ROM_WORD'("10110010"),
								ROM_WORD'("10110001"),
								ROM_WORD'("10010000"),
								ROM_WORD'("10010011"),
								ROM_WORD'("10010110"),
								ROM_WORD'("10010101"),
								ROM_WORD'("10011100"),
								ROM_WORD'("10011111"),
								ROM_WORD'("10011010"),
								ROM_WORD'("10011001"),
								ROM_WORD'("10001000"),
								ROM_WORD'("10001011"),
								ROM_WORD'("10001110"),
								ROM_WORD'("10001101"),
								ROM_WORD'("10000100"),
								ROM_WORD'("10000111"),
								ROM_WORD'("10000010"),
								ROM_WORD'("10000001"),
								ROM_WORD'("10011011"),
								ROM_WORD'("10011000"),
								ROM_WORD'("10011101"),
								ROM_WORD'("10011110"),
								ROM_WORD'("10010111"),
								ROM_WORD'("10010100"),
								ROM_WORD'("10010001"),
								ROM_WORD'("10010010"),
								ROM_WORD'("10000011"),
								ROM_WORD'("10000000"),
								ROM_WORD'("10000101"),
								ROM_WORD'("10000110"),
								ROM_WORD'("10001111"),
								ROM_WORD'("10001100"),
								ROM_WORD'("10001001"),
								ROM_WORD'("10001010"),
								ROM_WORD'("10101011"),
								ROM_WORD'("10101000"),
								ROM_WORD'("10101101"),
								ROM_WORD'("10101110"),
								ROM_WORD'("10100111"),
								ROM_WORD'("10100100"),
								ROM_WORD'("10100001"),
								ROM_WORD'("10100010"),
								ROM_WORD'("10110011"),
								ROM_WORD'("10110000"),
								ROM_WORD'("10110101"),
								ROM_WORD'("10110110"),
								ROM_WORD'("10111111"),
								ROM_WORD'("10111100"),
								ROM_WORD'("10111001"),
								ROM_WORD'("10111010"),
								ROM_WORD'("11111011"),
								ROM_WORD'("11111000"),
								ROM_WORD'("11111101"),
								ROM_WORD'("11111110"),
								ROM_WORD'("11110111"),
								ROM_WORD'("11110100"),
								ROM_WORD'("11110001"),
								ROM_WORD'("11110010"),
								ROM_WORD'("11100011"),
								ROM_WORD'("11100000"),
								ROM_WORD'("11100101"),
								ROM_WORD'("11100110"),
								ROM_WORD'("11101111"),
								ROM_WORD'("11101100"),
								ROM_WORD'("11101001"),
								ROM_WORD'("11101010"),
								ROM_WORD'("11001011"),
								ROM_WORD'("11001000"),
								ROM_WORD'("11001101"),
								ROM_WORD'("11001110"),
								ROM_WORD'("11000111"),
								ROM_WORD'("11000100"),
								ROM_WORD'("11000001"),
								ROM_WORD'("11000010"),
								ROM_WORD'("11010011"),
								ROM_WORD'("11010000"),
								ROM_WORD'("11010101"),
								ROM_WORD'("11010110"),
								ROM_WORD'("11011111"),
								ROM_WORD'("11011100"),
								ROM_WORD'("11011001"),
								ROM_WORD'("11011010"),
								ROM_WORD'("01011011"),
								ROM_WORD'("01011000"),
								ROM_WORD'("01011101"),
								ROM_WORD'("01011110"),
								ROM_WORD'("01010111"),
								ROM_WORD'("01010100"),
								ROM_WORD'("01010001"),
								ROM_WORD'("01010010"),
								ROM_WORD'("01000011"),
								ROM_WORD'("01000000"),
								ROM_WORD'("01000101"),
								ROM_WORD'("01000110"),
								ROM_WORD'("01001111"),
								ROM_WORD'("01001100"),
								ROM_WORD'("01001001"),
								ROM_WORD'("01001010"),
								ROM_WORD'("01101011"),
								ROM_WORD'("01101000"),
								ROM_WORD'("01101101"),
								ROM_WORD'("01101110"),
								ROM_WORD'("01100111"),
								ROM_WORD'("01100100"),
								ROM_WORD'("01100001"),
								ROM_WORD'("01100010"),
								ROM_WORD'("01110011"),
								ROM_WORD'("01110000"),
								ROM_WORD'("01110101"),
								ROM_WORD'("01110110"),
								ROM_WORD'("01111111"),
								ROM_WORD'("01111100"),
								ROM_WORD'("01111001"),
								ROM_WORD'("01111010"),
								ROM_WORD'("00111011"),
								ROM_WORD'("00111000"),
								ROM_WORD'("00111101"),
								ROM_WORD'("00111110"),
								ROM_WORD'("00110111"),
								ROM_WORD'("00110100"),
								ROM_WORD'("00110001"),
								ROM_WORD'("00110010"),
								ROM_WORD'("00100011"),
								ROM_WORD'("00100000"),
								ROM_WORD'("00100101"),
								ROM_WORD'("00100110"),
								ROM_WORD'("00101111"),
								ROM_WORD'("00101100"),
								ROM_WORD'("00101001"),
								ROM_WORD'("00101010"),
								ROM_WORD'("00001011"),
								ROM_WORD'("00001000"),
								ROM_WORD'("00001101"),
								ROM_WORD'("00001110"),
								ROM_WORD'("00000111"),
								ROM_WORD'("00000100"),
								ROM_WORD'("00000001"),
								ROM_WORD'("00000010"),
								ROM_WORD'("00010011"),
								ROM_WORD'("00010000"),
								ROM_WORD'("00010101"),
								ROM_WORD'("00010110"),
								ROM_WORD'("00011111"),
								ROM_WORD'("00011100"),
								ROM_WORD'("00011001"),
								ROM_WORD'("00011010")
	);
 begin
	DATA <= ROM(CONV_INTEGER(ADDRESS));
 end Behavioral;
