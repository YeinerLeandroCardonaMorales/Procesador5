----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:25 05/21/2018 
-- Design Name: 
-- Module Name:    Muxo - arq_muxo 
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

entity Muxo is
    Port ( DM : in  STD_LOGIC_VECTOR (31 downto 0);
           addres_Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           SDR : in  STD_LOGIC;
           out_Muxo : out  STD_LOGIC_VECTOR (31 downto 0));
end Muxo;

architecture arq_muxo of Muxo is

begin

	process (DM,addres_Alu,SDR)
	
	begin
	
		if(SDR = '0')then
		out_Muxo <= addres_Alu;
		elsif(SDR = '1')then	
		out_Muxo <= DM;
		end if;
	
	
	
	
	
		--if(SDR_UC="11")then 
		--out_Muxo <= DM;
		--else
		--out_Muxo <= addres_Alu;
		--end if;	
	
	end process;


end arq_muxo;

