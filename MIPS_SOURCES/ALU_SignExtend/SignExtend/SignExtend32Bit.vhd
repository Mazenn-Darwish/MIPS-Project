----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:53:10 05/24/2023 
-- Design Name: 
-- Module Name:    SignExtend32Bit - Behavioral 
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
entity SignExt_20100432 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExt_20100432;

architecture Behavioral of SignExt_20100432 is

begin
process(A)
begin
if (A(15)='0') then B <= X"00000000" + A;
elsif (A(15)='1')then B <= X"ffff0000" + A;
end if;
end process;

end Behavioral;

