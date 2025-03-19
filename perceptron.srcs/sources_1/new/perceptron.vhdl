----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2025 05:21:55 PM
-- Design Name: 
-- Module Name: perceptron - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity perceptron is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Input_Value : in std_logic_vector(31 downto 0);
           Enable : in STD_LOGIC;
           Output_Value : out std_logic_vector(31 downto 0);
           Valid : out std_logic_vector);
           
     
end perceptron;
architecture Behavioral of perceptron is
    --signal Weights : std_logic_vector[][31,0];
    
    signal N : natural := 10;
    
    type weightarray is array (natural range <>) of std_logic_vector(31 downto 0) ;
    signal Weights : weightarray(0 to N);
    signal mul : std_logic_vector(31 downto 0);
    signal add : std_logic_vector(31 downto 0);
    
    
    
begin
process --sensibilité aux signaux ???
    begin
        
        
        -- Starting clock if enable is set
        wait until Clock'event and Clock='1' ;
        if Reset= '0' then mul <= (others => '0');
        elsif Enable='0' then
           
           -- multiply
           mul <= Input_Value;
           for i in 0 to N loop
                --mul <= std_logic_vector(unsigned(Weights(i))*unsigned(mul));
                add <= std_logic_vector(unsigned(add) + unsigned(Weights(i))*unsigned(Input_Value));
           end loop
        end if;
    end process;
    Output_Value<=mul;
end Behavioral;
