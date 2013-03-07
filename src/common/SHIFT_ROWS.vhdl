entity ShiftRows is
	Port ( State_Input : in  STD_LOGIC_VECTOR (127 downto 0);
	   State_Output : out  STD_LOGIC_VECTOR (127 downto 0);
	   SYS_CLK : in  STD_LOGIC);
end ShiftRows;

architecture Behavioral of ShiftRows is

begin
SHIFT_ROWS : PROCESS(SYS_CLK)
begin
	IF (SYS_CLK'event AND SYS_CLK ='1') then
		State_Output <= State_Input(127 downto 120) &
						State_Input(87 downto 80)   &
						State_Input(47 downto 40)   &
						State_Input(7 downto 0)     &
							
						State_Input(95 downto 88)   &
						State_Input(55 downto 48)   &
						State_Input(15 downto 8)    &
						State_Input(103 downto 96)  &
	
						State_Input(63 downto 56)   &
						State_Input(23 downto 16)   &
						State_Input(111 downto 104) &
						State_Input(71 downto 64)   &
																			
						State_Input(31 downto 24)   &
						State_Input(119 downto 112) &
						State_Input(79 downto 72)   &
						State_Input(39 downto 32)   ;                                                
	END IF;
END PROCESS;    

end Behavioral;
