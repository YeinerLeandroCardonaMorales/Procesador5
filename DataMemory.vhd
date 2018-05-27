----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:40 05/21/2018 
-- Design Name: 
-- Module Name:    DataMemory - arq_DataMemory 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemory is
    Port ( CRD : in  STD_LOGIC_VECTOR (31 downto 0);
           addres : in  STD_LOGIC_VECTOR (31 downto 0);
           WR_Enmem : in  STD_LOGIC;
			  reset: in  STD_LOGIC;
			  clk: in  STD_LOGIC;
           out_DM : out  STD_LOGIC_VECTOR (31 downto 0)			  
			  );
end DataMemory;

architecture arq_DataMemory of DataMemory is

type rom_type is array (31 downto 0) of std_logic_vector (31 downto 0);
signal reg : rom_type := (others => x"00000000");

begin

	process (CRD,addres,WR_Enmem,reset,clk)
		
	begin
		if(rising_edge(clk))then
			if(reset = '1')then
				out_DM <= x"00000000";
				reg <=(others => x"00000000");
			else
		
				if(WR_Enmem = '1')then			
					reg(conv_integer(addres))<=CRD;
				else
					out_DM <=reg(conv_integer(addres));
				end if;
			end if;
		end if;
	
	
		--if(WR_Enmem  = '1' or reset='1')then
				--out_DM <= reg(conv_integer(addres));
				--reg <= (others => x"00000000");
		--else
			--reg(conv_integer(addres)) <= CRD;
			--out_DM <= CRD; 
		
	--end if;
	
	end process;

end arq_DataMemory;

