LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY sbox_lookup_tb IS
END sbox_lookup_tb;
ARCHITECTURE IO OF sbox_lookup_tb IS
  COMPONENT sbox_lookup
    PORT(a: IN SLV_8; b: OUT SLV_8);
  END COMPONENT;
  
SIGNAL i0, o0: SLV_8;
BEGIN
  G0: sbox_lookup PORT MAP(i0, o0);
  i0 <= x"06";
END IO;
