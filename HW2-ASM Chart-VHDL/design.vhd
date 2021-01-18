-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity Parallel_To_Serial is
	port( CLK, RESET, WR: in std_logic;
    Data : in std_logic_vector(6 downto 0);
	TXD : out std_logic);
end Parallel_To_Serial;

architecture BEHAVIOR of Parallel_To_Serial is 

	type state is(t0, t1, t2, t3,t4);
	signal current_state : state;
	signal next_state : state;
    signal n : integer;
    signal R : std_logic_vector(6 downto 0);
    signal p : std_logic :='0';

begin 												-- begin architecture
	
    state_process: process(current_state,WR,clk) 			--begin state_process
    
    begin 
    
    	case current_state is 
        	when t0 => 
            	if(WR = '0')then
            		next_state <= t0;
                elsif(WR = '1') then 
                	next_state <= t1;
                end if;
                
    		when t1 => 
            	next_state <= t2;
                
          	when t2 => 
            	if(n = 0) then 
                	next_state <= t3;
            	else
                	next_state <= t2;			
                end if;
                
            when t3 => 
            	next_state <= t4;
                
            when t4 => 
            	next_state <= t0;
                
    	end case;
    
    end process state_process;								--end state_process

	
    reset_process: process(clk,RESET)						--begin reset_process
    
    begin 
    
    	if(RESET='0') then
        	   current_state <= t0;
        elsif(clk'event and clk='1') then 
        		current_state <= next_state;
    	end if;
    end process reset_process;								--end reset_process
    
    out_process: process(clk)
    
    begin
    	if(clk'event and clk='1') then 
        	
            if(current_state = t1) then 
            	R <= data;
                n <= 7;
                p <= '0';
             	TXD <= '0';
            elsif(current_state = t2) then 
            	TXD <= R(0);
                R <= R srl 1;
                p <= p xor R(0);
                n <= n - 1;
            elsif(current_state = t3) then
            	TXD <= p ;
            elsif(current_state = t4) then
            	TXD <= '1';
            
            end if;
        	
        end if;
    
    end process out_process;
    
    

end BEHAVIOR;					--end architecture