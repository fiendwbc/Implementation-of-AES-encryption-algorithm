LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY key_transform_tb IS
END key_transform_tb;
ARCHITECTURE IO OF key_transform_tb IS
  COMPONENT key_transform
    PORT(given_key: IN STATE_ARRAY; transform_key: OUT STATE_ARRAY);
  END COMPONENT;
SIGNAL i0, oKey: STATE_ARRAY; 
BEGIN
  G0: key_transform PORT MAP(i0, oKey);
  i0(0) <= x"2b";
  i0(1) <= x"28";
  i0(2) <= x"ab";
  i0(3) <= x"09";
  i0(4) <= x"7e";
  i0(5) <= x"ae";
  i0(6) <= x"f7";
  i0(7) <= x"cf";
  i0(8) <= x"15";
  i0(9) <= x"d2";
  i0(10) <= x"15";
  i0(11) <= x"4f";
  i0(12) <= x"16";
  i0(13) <= x"a6";
  i0(14) <= x"88";
  i0(15) <= x"3c";
END IO;









