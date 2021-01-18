library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--use IEEE.std_logic_arith.all;

entity multiplier is
 	port( 
    	CLK : in std_logic;
 		A, B : in std_logic_vector(3 downto 0);
 		P : out std_logic_vector(7 downto 0));
end multiplier;

architecture behavioral of multiplier is 
	
    begin 
	
	mul_process: process(clk)
    
    variable temp_p : std_logic_vector(7 downto 0 );
   	variable int_B : integer;
    variable new_A_eihgt_bit :  std_logic_vector(7 downto 0 );
    
    variable bit_counter : std_logic_vector(3 downto 0);
    begin 
    	if(clk'event and clk='1') then
        	
            new_A_eihgt_bit := "0000" & A ;
            temp_p := "00000000";
            bit_counter := "0000";
        	--int_B := conv_integer(unsigned(B));
            	
    		while bit_counter /= B  loop 
        		temp_p := temp_p + new_A_eihgt_bit ;
                bit_counter := bit_counter +"0001";
        	end loop; 
    	end if;
        p <= temp_p;
    end process mul_process;

end behavioral;