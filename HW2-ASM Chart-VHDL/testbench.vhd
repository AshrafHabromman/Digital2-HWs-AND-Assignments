-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity test is 
end test;


architecture test_Parallel_To_Serial of test is 

component Parallel_To_Serial
port (
	clk, RESET, WR : in std_logic;
    Data : in std_logic_vector(6 downto 0);
    TXD : out std_logic
);
end component;

signal clk, RESET, WR, TXD : std_logic;
signal Data : std_logic_vector(6 downto 0);

constant period : time := 16ns;

begin  

	P_T_S: Parallel_To_Serial port map (
		Clk => clk,
    	RESET => RESET,
		WR => WR,
    	TXD => TXD,
    	Data => Data
    
	);
    
    clk_process: process 			--begin clk_process
    	
    begin
        clk <= '0';
        wait for period/2;
        clk <= '1';
        wait for period/2;
        
    end process clk_process;   		--end clk_process
	
    
  	states_process: process 		--begin process
    
    begin
    	wait for period;
        
		RESET <= '0';				-- test 1
        WR <= '0';
		
        wait for period * 5;		-- 5 clock cycles
        
        RESET <= '1';				-- test 2
        --WR <= '0';				does not modified from first test
        
        wait for period * 3;		-- 3 clock cycles
        
        WR <= '1';					-- test 3
        Data <= "1010100";
        
        wait for period * 2;		-- 2 clock cycles
        
        WR <= '0';					-- test 4
        Data <= "1010100";
        
        wait for period * 15;		-- 15 clock cycles
        
        WR <= '1';					-- test 5
        Data <= "1011100";
        
        wait for period * 2;		-- 2 clock cycles
        
        WR <= '0';					-- test 6
        Data <= "1011100";
        
        wait for period * 15;		-- 15 clock cycles
        
        WR <= '1';					-- test 7
        Data <= "0000000";
        
        wait for period * 2;		-- 2 clock cycles
        
        WR <= '0';					-- test 8
        Data <= "0000000";
        
        wait for period * 15;		-- 15 clock cycles
        
        WR <= '1';					-- test 9
        Data <= "1111111";
        
        wait for period * 2;		-- 2 clock cycles
        
        WR <= '0';					-- test 10
        Data <= "1111111";
        
        wait for period * 15;		-- 15 clock cycles
        
        RESET <= '0';
        
        wait for period * 5 ;
        
        wait;
        
    end process states_process;		--end process 


end test_Parallel_To_Serial;

 