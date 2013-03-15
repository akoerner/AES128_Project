library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRows is
	Port (
			STATE_IN : in  STD_LOGIC_VECTOR (127 downto 0);
			State_OUT : out  STD_LOGIC_VECTOR (127 downto 0);
			CLOCK : in  STD_LOGIC
		 );
end ShiftRows;

architecture Behavioral of ShiftRows is

begin
SHIFT_ROWS : PROCESS(CLOCK)
	begin
		IF (CLOCK'event AND CLOCK ='1') then
			STATE_OUT <= STATE_IN(127 downto 120) &
							STATE_IN(87 downto 80)   &
							STATE_IN(47 downto 40)   &
							STATE_IN(7 downto 0)     &
								
							STATE_IN(95 downto 88)   &
							STATE_IN(55 downto 48)   &
							STATE_IN(15 downto 8)    &
							STATE_IN(103 downto 96)  &
							
							STATE_IN(63 downto 56)   &
							STATE_IN(23 downto 16)   &
							STATE_IN(111 downto 104) &
							STATE_IN(71 downto 64)   &
																				
							STATE_IN(31 downto 24)   &
							STATE_IN(119 downto 112) &
							STATE_IN(79 downto 72)   &
							STATE_IN(39 downto 32);                                                
		END IF;
	END PROCESS;    
end Behavioral;


