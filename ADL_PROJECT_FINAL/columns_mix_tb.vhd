LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY columns_mix_tb IS
END columns_mix_tb;
ARCHITECTURE IO OF columns_mix_tb IS
  COMPONENT columns_mix
    PORT(state: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC; state_after_mix: OUT STATE_ARRAY);
  END COMPONENT;
SIGNAL i0, oMix: STATE_ARRAY;
 SIGNAL clk: STD_LOGIC:='0';
BEGIN
  G0: columns_mix PORT MAP(i0,clk, oMix);
  clk <= NOT clk AFTER 10 NS WHEN NOW >= 0 NS;
  i0(0) <= x"d4";
  i0(1) <= x"e0";
  i0(2) <= x"b8";
  i0(3) <= x"1e";
  i0(4) <= x"bf";
  i0(5) <= x"b4";
  i0(6) <= x"41";
  i0(7) <= x"27";
  i0(8) <= x"5d";
  i0(9) <= x"52";
  i0(10) <= x"11";
  i0(11) <= x"98";
  i0(12) <= x"30";
  i0(13) <= x"ae";
  i0(14) <= x"f1";
  i0(15) <= x"e5";
END IO;





