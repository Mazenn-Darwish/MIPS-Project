----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:29 05/28/2023 
-- Design Name: 
-- Module Name:    MIPS_Mazen_20100432 - Behavioral 
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

entity MIPS_Mazen_20100432 is
    Port ( CLK1 : in  STD_LOGIC);
end MIPS_Mazen_20100432;

architecture Behavioral of MIPS_Mazen_20100432 is
---------------------------------------			  
COMPONENT Adder32Bit_20100432 is
    Port ( In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0));
end component ;
---------------------------------------			  
COMPONENT MUX5_20100432 is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           OUTM : out  STD_LOGIC_VECTOR (4 downto 0);
           S : in  STD_LOGIC);
end COMPONENT;
---------------------------------------			  
component Adder4Bit_20100432 is
    Port ( INPUT1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTPUT1 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
---------------------------------------			  
component ALU4Bit_m is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUin : in  STD_LOGIC_VECTOR (3 downto 0);
           zero : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
---------------------------------------			  
component ALU_Control_20100432 is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (1 downto 0);
           FuncField : in  STD_LOGIC_VECTOR (5 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end component ;
---------------------------------------			  
component Control_20100432 is
    Port ( OP : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOP0 : out  STD_LOGIC;
			  ALUOP1 : out  STD_LOGIC);
end component ;
---------------------------------------			  
component InstructionMemory_20100432 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0);
			  CLK : in STD_LOGIC);
end component ;
---------------------------------------			  
component Memory_Unit_20100432 is
    Port ( MemRead : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
           DataWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           DataRead : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC);
end component;
---------------------------------------			  
component MUX2_1_20100432 is
    Port ( IN1 : in  STD_LOGIC_VECTOR (31 downto 0);
           IN2 : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC;
           OUTMUX : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
---------------------------------------			  
component PC_20100432 is
    Port ( Pc_In : in  STD_LOGIC_VECTOR (31 downto 0);
			CLK : in  STD_LOGIC;
           Pc_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
---------------------------------------			  
component Register_20100432 is
    Port ( ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  CLK : in  STD_LOGIC);
end component;
---------------------------------------			  
component ShiftLeft_20100432 is
    Port ( Inshift : in  STD_LOGIC_VECTOR (31 downto 0);
           Outshift : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
---------------------------------------			  
component SignExt_20100432 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end component ;
---------------------------------------			  

SIGNAL PC_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL PC_ADDER_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL PC_NEW_ADDRESS : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL INSTRUCTION1: STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL OPCODE_CU : STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL RS : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL RT : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL RD : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL FUNCTION_FIELD : STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL INST15_0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL REGISTER_MUX : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL R1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL R2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL IMMEDIATE : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SHIFTLEFT_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL R2_IMMEDIATE_MUX : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL ALUCONTROL_OUT : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL ALU_RES_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL ZERO_CU : STD_LOGIC;
SIGNAL NEW_BRANCH : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL BRANCH_CONTROLLER : STD_LOGIC;
SIGNAL MEM_READ_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL WRITE_REG : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL REGDST_CU : STD_LOGIC;
SIGNAL BRANCH_CU : STD_LOGIC;
SIGNAL MEMREAD_CU : STD_LOGIC;
SIGNAL MEMTOREG_CU : STD_LOGIC;
SIGNAL MEMWRITE_CU : STD_LOGIC;
SIGNAL ALUSRC_CU : STD_LOGIC;
SIGNAL REGWRITE_CU : STD_LOGIC;
SIGNAL ALUOP_CU : STD_LOGIC_VECTOR (1 DOWNTO 0);

begin
		
OPCODE_CU <= INSTRUCTION1(31 DOWNTO 26);
RS <= INSTRUCTION1(25 DOWNTO 21);
RT <= INSTRUCTION1(20 DOWNTO 16);
RD <= INSTRUCTION1(15 DOWNTO 11);
INST15_0 <= INSTRUCTION1(15 DOWNTO 0);
FUNCTION_FIELD <= INSTRUCTION1(5 DOWNTO 0);
---------------------------------------			  
BRANCH_CONTROLLER <=  (BRANCH_CU AND ZERO_CU);
---------------------------------------			  
BRANCH_ADDRESS_20100432 : Adder32Bit_20100432 
    Port MAP( In1 => PC_ADDER_OUT,
           In2 => SHIFTLEFT_OUT,
           Sum => NEW_BRANCH);
---------------------------------------			  
PC4_20100432 : Adder4Bit_20100432 
    Port MAP( INPUT1  => PC_OUT ,
           OUTPUT1 => PC_ADDER_OUT );
---------------------------------------			  
MUX_Branch_20100432 : MUX2_1_20100432 
    Port MAP( IN1 => PC_ADDER_OUT,
           IN2 => NEW_BRANCH,
           S => BRANCH_CONTROLLER,
           OUTMUX => PC_NEW_ADDRESS );
---------------------------------------			  
INSTRUCTION_MEMORY_20100432 : InstructionMemory_20100432
    Port MAP( Address => PC_OUT ,
           Instruction => INSTRUCTION1,
			  CLK => CLK1);
---------------------------------------			  
SIGN_EXT_20100432 : SignExt_20100432 
    Port MAP( A => INST15_0 ,
           B => IMMEDIATE);	
---------------------------------------			  
REGISTER_MUX_20100432 : MUX5_20100432 
    Port MAP ( A => RT ,
           B => RD ,
           OUTM => REGISTER_MUX,
           S => REGDST_CU);
---------------------------------------			  
REGISTER_20100432_mm : Register_20100432 
    Port MAP( ReadReg1 => RS,
           ReadReg2 => RT,
           WriteReg => REGISTER_MUX,
           WriteData => WRITE_REG,
           ReadData1 => R1,
           ReadData2 => R2,
			  RegWrite => REGWRITE_CU,
			  CLK => CLK1);
---------------------------------------			  
ALU_CONTROL_20100432_Mazen : ALU_Control_20100432
    Port MAP( ALUOP => ALUOP_CU ,
           FuncField => FUNCTION_FIELD ,
           Operation => ALUCONTROL_OUT );
---------------------------------------			  
ALU_MUX_20100432 : MUX2_1_20100432 
    Port MAP( IN1 => R2,
           IN2 => IMMEDIATE,
           S => ALUSRC_CU,
           OUTMUX => R2_IMMEDIATE_MUX );
---------------------------------------			  
ALU_20100432_Mazen : ALU4Bit_m
    Port MAP( A => R1,
           B => R2_IMMEDIATE_MUX,
           ALUin => ALUCONTROL_OUT ,
           zero => ZERO_CU,
           result => ALU_RES_OUT );
---------------------------------------			  
MEMORY_UNIT20100432_mm : Memory_Unit_20100432 
    Port MAP( 
			  MemRead => MEMREAD_CU,
           MemWrite => MEMWRITE_CU,
           Address => ALU_RES_OUT,
           DataWrite => R2,
           DataRead => MEM_READ_OUT,
           CLK => CLK1);
---------------------------------------			  
MEMORY_MUX_20100432 :  MUX2_1_20100432 
    Port MAP( IN1 => ALU_RES_OUT,
           IN2 => MEM_READ_OUT,
           S => MEMTOREG_CU,
           OUTMUX => WRITE_REG);
---------------------------------------			  
CONTROL_UNIT_20100432 : Control_20100432 
    Port MAP( OP => OPCODE_CU ,
           RegDst => REGDST_CU,
           ALUSrc => ALUSRC_CU,
           MemtoReg => MEMTOREG_CU,
           RegWrite => REGWRITE_CU,
           MemRead => MEMREAD_CU,
           MemWrite => MEMWRITE_CU,
           Branch => BRANCH_CU,
           ALUOP0 => ALUOP_CU(1),
			  ALUOP1 => ALUOP_CU(0));
---------------------------------------			  
SHIFT_LEFT_20100432 : ShiftLeft_20100432 
    Port MAP( Inshift => IMMEDIATE ,
           Outshift => SHIFTLEFT_OUT );

---------------------------------------			  
PC_COUNT_20100432 : PC_20100432 
    Port MAP( Pc_In => PC_NEW_ADDRESS,
			CLK => CLK1,
           Pc_Out => PC_OUT  );
	
end Behavioral;

