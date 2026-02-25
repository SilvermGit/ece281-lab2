----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2026 04:56:23 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
--  Port ( );
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
    component sevenseg_decoder is
        Port ( i_HEx : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

  -- create wire to connect button to 7SD enable (active-low)
    signal w_HEx : std_logic_vector(3 downto 0) := x"0";
    signal w_seg_n : std_logic_vector(6 downto 0);
begin
    sevenseg_uut : sevenseg_decoder 
        port map (
        i_HEx => w_HEx(3 downto 0),
        o_seg_n => w_seg_n(6 downto 0)
    );
    test_process : process
    begin
        w_HEx <= x"B"; wait for 10ns;
            assert (w_seg_n = "0000011") report "bad with the button off" severity failure;
        w_HEx <= x"A"; wait for 10ns;
            assert (w_seg_n = "0001000") report "bad with 10" severity failure;
        w_HEx <= x"1"; wait for 10ns;
            assert (w_seg_n = "1111001") report "bad with 1" severity failure;
        w_HEx <= x"5"; wait for 10ns;
            assert (w_seg_n = "0010010") report "bad with 5" severity failure;
        w_HEx <= x"6"; wait for 10ns;
            assert (w_seg_n = "0000010") report "bad with 6" severity failure;
        w_HEx <= x"8"; wait for 10ns;
            assert (w_seg_n = "0000000") report "bad with 8" severity failure;
        w_HEx <= x"E"; wait for 10ns;
            assert (w_seg_n = "0000110") report "bad with 14" severity failure;
        w_HEx <= x"9"; wait for 10ns;
            assert (w_seg_n = "0011000") report "bad with 9" severity failure;
        wait;
    end process;
end test_bench;
