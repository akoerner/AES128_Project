library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

AES128_ENCRYPT is
	Port(
		CLOCK : IN STD_LOGIC;
		RESET : IN STD_LOGIC;
		PLAINTEXT_INPUT : IN  STD_LOGIC_VECTOR (127 downto 0);
		KEY_INPUT : IN  STD_LOGIC_VECTOR (127 downto 0);
		ENCRYPT : IN  STD_LOGIC;
		DONE : OUT  STD_LOGIC;
 		CIPHERTEXT_OUT : OUT  STD_LOGIC_VECTOR (127 downto 0));
end AES128_ENCRYPT;

architecture Behavioral of AES128_ENCRYPT is

COMPONENT Key_Scheduler
	PORT(
		CLOCK : IN std_logic;
		RESET : IN std_logic;
		KEY : IN std_logic_vector(127 downto 0);
		LOAD_KEY : IN std_logic         
		ROUND_SUB_KEY : OUT std_logic_vector(127 downto 0)
	    );
END COMPONENT;

COMPONENT SubBytes
	PORT(
		SubBytes_IN : IN std_logic_vector(127 downto 0);
		CLOCK : IN std_logic;
		RESET : IN std_logic;          
		SubBytes_OUT : OUT std_logic_vector(127 downto 0)
	    );
END COMPONENT;

COMPONENT ShiftRows
	PORT(
		ShiftRows_In : IN std_logic_vector(127 downto 0);
		CLOCK : IN std_logic;
		RESET : IN std_logic;          
		ShiftRows_OUT : OUT std_logic_vector(127 downto 0)
	    );
END COMPONENT;

COMPONENT MixColumns
	PORT(
		MixColumns_IN : IN STD_LOGIC_VECTOR(127 downto 0);
		CLOCK : IN std_logic;
		RESET : IN std_logic;          
		MixColumns_OUT : OUT std_logic_vector(127 downto 0)
	    );
END COMPONENT;

COMPONENT AddRoundKey
	PORT(
		AddRoundKey_IN : IN std_logic_vector(127 downto 0);
		Key_IN : IN std_logic_vector(127 downto 0);
		CLOCK : IN std_logic;
		RESET : IN std_logic;          
		AddRoundKey_OUT : OUT std_logic_vector(127 downto 0)
	    );
END COMPONENT;

end Behavioral;
