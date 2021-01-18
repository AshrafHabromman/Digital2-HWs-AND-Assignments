-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std_unsigned.all;
--use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;

entity Fibonacci_Calculator is

 	port ( 	clk : in std_logic;
 			data_in : in std_logic_vector (3 downto 0);
 			load_enable : in std_logic;
 			data_out : out std_logic_vector (9 downto 0));
            
end Fibonacci_Calculator;

architecture behavioral of Fibonacci_Calculator is
	--signal unsigned_data_in : std_ulogic_vector(3 downto 0);
    signal int_data_in : integer :=0;
   	signal demo : integer := 0;
	begin
    	--unsigned_data_in <= unsigned(data_in);
   		--int_data_in <= to_integer(unsigned_data_in);
        
        
        
		cal_fib: process(clk,data_in,load_enable)
        
		variable fibo_array : integer_vector(0 to 15);
        --variable unsigned_temp_out : std_ulogic_vector(9 downto 0);
        variable int_temp_out : integer := 0;

		begin 
        	if(clk'event and clk='1' and load_enable='1') then
            
        		int_data_in <= conv_integer(unsigned(data_in));
                if(int_data_in=0) then 
                	int_temp_out := 0;
                    
                elsif(int_data_in=1) then
                	int_temp_out := 1;
                    
                else 
                
            		fibo_array(0) := 0;
       				fibo_array(1) := 1;
                	for i in 2 to int_data_in loop 
            			fibo_array(i) := fibo_array(i-1) + fibo_array(i-2);
                   		 demo <= fibo_array(i);
            		end loop;
                	int_temp_out := fibo_array(int_data_in);
                end if;
        
            elsif( load_enable='0') then
            	 int_temp_out := 0;
        
            end if;
            
			--unsigned_temp_out := to_unsigned(int_temp_out,10);
            data_out <= std_ulogic_vector(conv_unsigned(int_temp_out,10)); 

            
		end process cal_fib;
         
            
end behavioral;