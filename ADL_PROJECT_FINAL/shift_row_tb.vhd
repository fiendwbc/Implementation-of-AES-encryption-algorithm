LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY shift_row_tb IS
END shift_row_tb;
ARCHITECTURE IO OF shift_row_tb IS
  COMPONENT shift_row
    PORT(state: IN STATE_ARRAY; state_after_shift: OUT STATE_ARRAY);
  END COMPONENT;
SIGNAL i0, oShift: STATE_ARRAY;
BEGIN
  G0: shift_row PORT MAP(i0, oShift);
  i0(0) <= x"d4";
  i0(1) <= x"e0";
  i0(2) <= x"b8";
  i0(3) <= x"1e";
  i0(4) <= x"27";
  i0(5) <= x"bf";
  i0(6) <= x"b4";
  i0(7) <= x"41";
  i0(8) <= x"11";
  i0(9) <= x"98";
  i0(10) <= x"5d";
  i0(11) <= x"52";
  i0(12) <= x"ae";
  i0(13) <= x"f1";
  i0(14) <= x"e5";
  i0(15) <= x"30";
END IO;




