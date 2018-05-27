--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:48:59 05/23/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador4ConConexxion/tb_DataMemory.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
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
 
ENTITY tb_DataMemory IS
END tb_DataMemory;
 
ARCHITECTURE behavior OF tb_DataMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         CRD : IN  std_logic_vector(31 downto 0);
         addres : IN  std_logic_vector(31 downto 0);
         WR_Enmem : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         out_DM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRD : std_logic_vector(31 downto 0) := (others => '0');
   signal addres : std_logic_vector(31 downto 0) := (others => '0');
   signal WR_Enmem : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal out_DM : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          CRD => CRD,
          addres => addres,
          WR_Enmem => WR_Enmem,
          reset => reset,
          clk => clk,
          out_DM => out_DM
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		reset <='0';
		WR_Enmem <= '0';
		CRD <= x"00000002";
      addres <= x"00000003";
		 
      wait for 100 ns;	

     wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
