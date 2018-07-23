LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY first_col_key_gen IS
  PORT(fourth_col_key, first_col_key: IN COLUMN_STATE_ARRAY; 
      round: IN INTEGER; 
      generated_col_key: OUT COLUMN_STATE_ARRAY);
END first_col_key_gen;
  
ARCHITECTURE struct OF first_col_key_gen IS
  COMPONENT sbox_lookup
    PORT(a: IN SLV_8; b: OUT SLV_8);
  END COMPONENT;
  COMPONENT get_rcon
    PORT(round: IN INTEGER; rcon: OUT SLV_8);
  END COMPONENT;
  SIGNAL r0,r1,r2,r3, rcon: SLV_8;
BEGIN
  C0: sbox_lookup PORT MAP(fourth_col_key(0), r0);
  C1: sbox_lookup PORT MAP(fourth_col_key(1), r1);
  C2: sbox_lookup PORT MAP(fourth_col_key(2), r2);
  C3: sbox_lookup PORT MAP(fourth_col_key(3), r3);
  C4: get_rcon PORT MAP(round, rcon);
    
  generated_col_key(0) <= r1 XOR first_col_key(0) XOR rcon;
  generated_col_key(1) <= r2 XOR first_col_key(1);
  generated_col_key(2) <= r3 XOR first_col_key(2);
  generated_col_key(3) <= r0 XOR first_col_key(3); 
END struct;




