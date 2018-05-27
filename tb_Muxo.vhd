--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:07:08 05/24/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador4ConConexxion/tb_MUXO.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Muxo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_MUXO IS
END tb_MUXO;
 
ARCHITECTURE behavior OF tb_MUXO IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Muxo
    PORT(
         DM : IN  std_logic_vector(31 downto 0);
         addres_Alu : IN  std_logic_vector(31 downto 0);
         SDR : IN  STD_LOGIC;
         out_Muxo : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DM : std_logic_vector(31 downto 0) := (others => '0');
   signal addres_Alu : std_logic_vector(31 downto 0) := (others => '0');
	signal SDR : STD_LOGIC := '0';
   --signal SDR_UC : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal out_Muxo : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Muxo PORT MAP (
          DM => DM,
          addres_Alu => addres_Alu,
          SDR => SDR,
          out_Muxo => out_Muxo
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin	

		DM <= x"00000001";
      addres_Alu <= "00000011";
      SDR <= '1' ;
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
