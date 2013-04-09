brary IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AddRoundKey is
    Port ( STATE_IN : in  STD_LOGIC_VECTOR (127 downto 0);
           KEY_IN : in  STD_LOGIC_VECTOR (127 downto 0);
           STATE_OUT : out  STD_LOGIC_VECTOR (127 downto 0);
           CLOCK : in  STD_LOGIC
          );
end AddRoundKey;

architecture Behavioral of AddRoundKey is
begin

PROCESS(CLOCK)
begin
  IF (CLOCK'event AND CLOCK ='1') then
    STATE_OUT <=  KEY_IN XOR STATE_IN;
	END IF;	
END PROCESS;	
end Behavioral;
