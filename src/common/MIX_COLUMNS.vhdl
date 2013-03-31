library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MixColumns is
    Port ( CLOCK : in  STD_LOGIC;
           STATE_IN : in  STD_LOGIC_VECTOR (127 downto 0);
           STATE_OUT : out  STD_LOGIC_VECTOR (127 downto 0)
		   );
end MixColumns;

architecture Behavioral of MixColumns is

begin
MIX_COLUMNS: PROCESS(CLOCK)
SIGNAL IN0, IN1, IN2, IN3 :STD_LOGIC; 
	begin
		IF (CLOCK'event AND CLOCK ='1') THEN
		
		--|02 03 01 01| |IN0| |OUT0|
		--|01 02 03 01| |IN1| |OUT1|
		--|01 01 02 03|*|IN2|=|OUT2|
		--|03 01 01 02| |IN3| |OUT3|
		
		--OUT0 = 02 * IN0 + 03 * IN1 + 01 * IN2 + 01 * IN3
		--OUT1 = 01 * IN0 + 02 * IN1 + 03 * IN2 + 01 * IN3  
		--OUT2 = 01 * IN0 + 01 * IN1 + 02 * IN2 + 03 * IN3
		--OUT3 = 03 * IN0 + 01 * IN1 + 01 * IN2 + 02 * IN3
		
			--1 '00000001'
			--2 '00000010'
			--3 '00000011'
		
		--COLUMN#1 STATE_IN(127 downto 96)
			IN0 <= STATE_IN(127 downto 120);
			IN1 <= STATE_IN(119 downto 112);
			IN2 <= STATE_IN(111 downto 104);
			IN3 <= STATE_IN(103 downto 96);
			
		
			STATE_OUT(127 downto 120) <= '00000010' * IN0 + '00000011' * IN1 + '00000001' * IN2 + '00000001' * IN3;
			STATE_OUT(119 downto 112) <= '00000001' * IN0 + '00000010' * IN1 + '00000011' * IN2 + '00000001' * IN3;
			STATE_OUT(101 downto 104) <= '00000001' * IN0 + '00000001' * IN1 + '00000010' * IN2 + '00000011' * IN3;
			STATE_OUT(103 downto 96)  <= '00000011' * IN0 + '00000001' * IN1 + '00000001' * IN2 + '00000010' * IN3;
			
		--COLUMN#2 STATE_IN(95 downto 64)
			IN0 <= STATE_IN(95 downto 88);
			IN1 <= STATE_IN(87 downto 80);
			IN2 <= STATE_IN(79 downto 72);
			IN3 <= STATE_IN(71 downto 64);
			
			STATE_OUT(95 downto 88)   <= '00000010' * IN0 + '00000011' * IN1 + '00000001' * IN2 + '00000001' * IN3;
			STATE_OUT(87 downto 80)   <= '00000001' * IN0 + '00000010' * IN1 + '00000011' * IN2 + '00000001' * IN3;
			STATE_OUT(79 downto 72)   <= '00000001' * IN0 + '00000001' * IN1 + '00000010' * IN2 + '00000011' * IN3;
			STATE_OUT(71 downto 64)   <= '00000011' * IN0 + '00000001' * IN1 + '00000001' * IN2 + '00000010' * IN3;
			
		--COLUMN#3 STATE_IN(63 downto 32)
			IN0 <= STATE_IN(63 downto 56);
			IN1 <= STATE_IN(55 downto 48);
			IN2 <= STATE_IN(47 downto 40);
			IN3 <= STATE_IN(39 downto 32);
			
			STATE_OUT(63 downto 56)   <= '00000010' * IN0 + '00000011' * IN1 + '00000001' * IN2 + '00000001' * IN3;
			STATE_OUT(55 downto 48)   <= '00000001' * IN0 + '00000010' * IN1 + '00000011' * IN2 + '00000001' * IN3;
			STATE_OUT(47 downto 40)   <= '00000001' * IN0 + '00000001' * IN1 + '00000010' * IN2 + '00000011' * IN3;
			STATE_OUT(39 downto 32)   <= '00000011' * IN0 + '00000001' * IN1 + '00000001' * IN2 + '00000010' * IN3;
			
		--COLUMN#4 STATE_IN(31 downto 0)
			IN0 <= STATE_IN(31 downto 24);
			IN1 <= STATE_IN(23 downto 16);
			IN2 <= STATE_IN(15 downto 8);
			IN3 <= STATE_IN(7 downto 0);
	
			STATE_OUT(31 downto 24)   <= '00000010' * IN0 + '00000011' * IN1 + '00000001' * IN2 + '00000001' * IN3;
			STATE_OUT(23 downto 16)   <= '00000001' * IN0 + '00000010' * IN1 + '00000011' * IN2 + '00000001' * IN3;
			STATE_OUT(15 downto 8)    <= '00000001' * IN0 + '00000001' * IN1 + '00000010' * IN2 + '00000011' * IN3;
			STATE_OUT(7 downto 0)     <= '00000011' * IN0 + '00000001' * IN1 + '00000001' * IN2 + '00000010' * IN3;
		END IF;
end Behavioral;
