----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:22:22 05/04/2023
-- Design Name: 
-- Module Name:     
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Adder32Bit_20100432 is
    Port ( In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder32Bit_20100432;

architecture Behavioral of Adder32Bit_20100432 is

begin
process(In1,In2)
begin
Sum <= In1 + In2;
end process;

end Behavioral;

