-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity test is 

end test ;

architecture test_fibo of test is 

component Fibonacci_Calculator
		port ( 		clk : in std_logic;
 				data_in : in std_logic_vector (3 downto 0);
 				load_enable : in std_logic;
 				data_out : out std_logic_vector (9 downto 0)
        );
end component ;

signal clk : std_logic;
signal data_in : std_logic_vector(3 downto 0);
signal load_enable : std_logic;
signal data_out : std_logic_vector(9 downto 0);
constant period : time := 15ns;

begin 
	
	f1: Fibonacci_Calculator port map (
    
    clk => clk,
    data_in => data_in,
    load_enable => load_enable,
    data_out => data_out
    
    );
    

	clk_process: process 
    	
    begin
        clk <= '0';
        wait for period/2;
        clk <= '1';
        wait for period/2;
        
    end process clk_process;   
	
  	fibo_process: process 
    
    begin
    	load_enable <= '0';
        wait for period*2;			--wait for 30 ns
        
        load_enable <= '1';
        
        data_in <= "0001";			--1
        
        wait for period*2;
        
        data_in <= "0010";			--2
        
        wait for period*2;
        
        data_in <= "0011";			--3 
        
        wait for period*2;			--wait for 30 ns
        
        data_in <= "0100";			--4
        
        wait for period*2;			--wait for 30 ns
                
        data_in <= "0101";			--5
        
        wait for period*2;
        
        data_in <= "0110";			--6
        
        wait for period*2;
        
        data_in <= "0111";			--7
        
        wait for period*2;
        
        data_in <= "1000";			--8
        
        wait for period*2;
        
        data_in <= "1001";			--9
        
        wait for period*2;
        
        data_in <= "1010";			--10
        
        wait for period*2;
        
        data_in <= "1011";			--11
        
        wait for period*2;
        
        data_in <= "1100";			--11
        
        wait for period*2;
        
        data_in <= "1100";			--12
        
        wait for period*2;
                
        data_in <= "1101";			--13
        
        wait for period*2;
        
        data_in <= "1110";			--14
        
        wait for period*2;
        
        data_in <= "1111";			--15
        
        wait for period*2;
        
        load_enable <= '0';
        
                
        data_in <= "0001";			--1
        
        wait for period*2;
        
        data_in <= "0010";			--2
        
        wait for period*2;
        
        data_in <= "0011";			--3 
        
        wait for period*2;			--wait for 30 ns
        
        data_in <= "0100";			--4
        
        wait;
        
    end process fibo_process;
        
        	
end test_fibo ;