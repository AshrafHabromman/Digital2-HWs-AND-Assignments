-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.std_logic_unsigned.all;

entity test is

end test ;

architecture test_multi of test is 

	component multiplier 
    	
        port (
        		CLK : in std_logic;
                A, B : in std_logic_vector(3 downto 0);
 				P : out std_logic_vector(7 downto 0)
        );
    	
    end component;
    
    signal clk : std_logic;
    signal A ,B : std_logic_vector(3 downto 0);
    signal P : std_logic_vector(7 downto 0);
    
    constant period : time := 16ns;
begin 

	m1: multiplier port map (
    	CLK => clk,
        A => A,
        B => B, 
        P => P
    );
    
    
    
	clk_process: process 
    	
    begin
        clk <= '0';
        wait for period/2;
        clk <= '1';
        wait for period/2;
        
    end process clk_process;  
    
    ------
    
    test_process: process
    
    variable A_test : std_logic_vector(3 downto 0);
    variable B_test : std_logic_vector(3 downto 0);
    
    begin 
    	A_test := "0000";
    	B_test := "0000";
        for i in 0 to 15 loop 
        	
            for j in 0 to 15 loop 
            	A <= A_test ;
                B <= B_test; 
            	B_test := B_test + "0001";
                wait for period * 2;
            end loop;

        	A_test := A_test + "0001";
        end loop;
    
    end process test_process;



end test_multi;