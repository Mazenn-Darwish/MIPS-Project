----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:23 05/24/2023 
-- Design Name: 
-- Module Name:    PCCounter - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_20100432 is
    Port ( Pc_In : in  STD_LOGIC_VECTOR (31 downto 0);
			CLK : in  STD_LOGIC;
           Pc_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end PC_20100432;

architecture Behavioral of PC_20100432 is
signal temp : STD_LOGIC_VECTOR (31 downto 0):= X"00000000";

begin
process(CLK, temp,Pc_In)
begin
Pc_Out<= temp;
if FALLING_EDGE(CLK) THEN temp <= Pc_In;
END IF;
end process;


end Behavioral;

