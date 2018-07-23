LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY poly_multiplier_tb IS
END poly_multiplier_tb;

ARCHITECTURE IO OF poly_multiplier_tb IS
  COMPONENT poly_multiplier
    PORT(a,b: IN SLV_8; c: OUT SLV_8);
  END COMPONENT;
FOR ALL: poly_multiplier USE ENTITY work.poly_multiplier(rtl);
SIGNAL i0,i1, o0: SLV_8;
BEGIN
  G0: poly_multiplier PORT MAP(i0,i1, o0);
  i0 <= x"02", x"03" AFTER 10 NS;
  i1 <= x"d4", x"bf" AFTER 10 NS;
END IO;
