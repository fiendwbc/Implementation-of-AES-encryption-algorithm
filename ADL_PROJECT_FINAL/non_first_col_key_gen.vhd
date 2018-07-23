LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY non_first_col_key_gen IS
  PORT(previous_col_key, ahead_col_key: IN COLUMN_STATE_ARRAY; 
      generated_col_key: OUT COLUMN_STATE_ARRAY);
END non_first_col_key_gen;
  
ARCHITECTURE struct OF non_first_col_key_gen IS
BEGIN
  generated_col_key(0) <= previous_col_key(0) XOR ahead_col_key(0);
  generated_col_key(1) <= previous_col_key(1) XOR ahead_col_key(1);
  generated_col_key(2) <= previous_col_key(2) XOR ahead_col_key(2);
  generated_col_key(3) <= previous_col_key(3) XOR ahead_col_key(3); 
END struct;






