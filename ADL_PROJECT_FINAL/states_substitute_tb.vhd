LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY states_substitute_tb IS
END states_substitute_tb;
ARCHITECTURE IO OF states_substitute_tb IS
  COMPONENT states_substitute
    PORT(state: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC;
    state_after_sub: OUT STATE_ARRAY);
  END COMPONENT;
  --COMPONENT inv_states_substitute
    --PORT(state: IN STATE_ARRAY; state_after_sub: OUT STATE_ARRAY);
  --END COMPONENT;
SIGNAL i0, o0: STATE_ARRAY;
SIGNAL clk: STD_LOGIC:='0';
BEGIN
  G0: states_substitute PORT MAP(i0,clk, o0);
  --G1: inv_states_substitute PORT MAP(i0, oInv);
  clk <= NOT clk AFTER 10 NS WHEN NOW >= 0 NS;
  i0(0) <= x"32";
  i0(1) <= x"88";
  i0(2) <= x"31";
  i0(3) <= x"e0";
  i0(4) <= x"43";
  i0(5) <= x"5a";
  i0(6) <= x"31";
  i0(7) <= x"37";
  i0(8) <= x"f6";
  i0(9) <= x"30";
  i0(10) <= x"98";
  i0(11) <= x"07";
  i0(12) <= x"a8";
  i0(13) <= x"8d";
  i0(14) <= x"a2";
  i0(15) <= x"34";
END IO;


