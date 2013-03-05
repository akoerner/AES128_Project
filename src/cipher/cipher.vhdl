--AES128

--For AES128 Key Length (Nk words) = 4, Block Size(Nb words) = 4, Number of Rounds(Nr) = 10




LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL;



PACKAGE Cipher_pkg IS

FUNCTION Cipher(
		type input IS array (7 downto 0, 7 downto 0) of std_logic,
                type output IS array (7 downto 0, 7 downto 0) of std_logic,
                type w  IS array (7 downto 0, 1280 downto 0) of std_logic
                ) return std_logic_vector is

END Cipher_pkg;


PACKAGE body Cipher_pkg IS

	FUNCTION Cipher(
			type input BYTE IS array (7 downto 0, 7 downto 0) of std_logic,
			type output BYTE IS array (7 downto 0, 7 downto 0) of std_logic, 
			type w BYTE IS array (7 downto 0, 1280 downto 0) of std_logic--likely wrong size 
		) return std_logic_vector is

		variable state BYTE IS array (7 downto 0, 7 downto 0) of std_logic;

	begin
		state <= input;
		--AddRoundKey(state, w[0, Nb-1]) // See Sec. 5.1.4
		for round in 1 to 9 loop
			--SubBytes(state) // See Sec. 5.1.1
			--ShiftRows(state) // See Sec. 5.1.2
			--MixColumns(state) // See Sec. 5.1.3
			--AddRoundKey(state, w[round*Nb, (round+1)*Nb-1])
		end loop;
		
		--SubBytes(state)
		--ShiftRows(state)
		--AddRoundKey(state, w[Nr*Nb, (Nr+1)*Nb-1])
		
		out <= state;
		return out;

	END Cipher;

END Cipher_pkg;
