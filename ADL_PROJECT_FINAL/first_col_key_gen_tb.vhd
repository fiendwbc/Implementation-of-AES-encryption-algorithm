LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY first_col_key_gen_tb IS
END first_col_key_gen_tb;
ARCHITECTURE IO OF first_col_key_gen_tb IS
  COMPONENT first_col_key_gen
  PORT(fourth_col_key, first_col_key: IN COLUMN_STATE_ARRAY; 
      round: IN INTEGER RANGE 1 to 10; 
      generated_col_key: OUT COLUMN_STATE_ARRAY);
  END COMPONENT;
SIGNAL i0, i1, oKey: COLUMN_STATE_ARRAY; 
BEGIN
  ----first
  i0(0) <= x"2b";
  i0(1) <= x"7e";
  i0(2) <= x"15";
  i0(3) <= x"16";
  
  
  i1(0) <= x"09";
  i1(1) <= x"cf";
  i1(2) <= x"4f";
  i1(3) <= x"3c";
  
  G0: first_col_key_gen PORT MAP(i1,i0,1, oKey);
END IO;









