LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY key_transform IS
  PORT(given_key: IN STATE_ARRAY; transform_key: OUT STATE_ARRAY);
END key_transform;
  
ARCHITECTURE struct OF key_transform IS
  COMPONENT sbox_lookup
    PORT(a: IN SLV_8; b: OUT SLV_8);
  END COMPONENT;
  SIGNAL r3,r7,r11,r15: SLV_8;
BEGIN
  C0: sbox_lookup PORT MAP(given_key(3), r3);
  C1: sbox_lookup PORT MAP(given_key(7), r7);
  C2: sbox_lookup PORT MAP(given_key(11), r11);
  C3: sbox_lookup PORT MAP(given_key(15), r15);
  transform_key(0) <= r7;
  transform_key(4) <= r11;
  transform_key(8) <= r15;
  transform_key(12) <= r3;
  -------------------------
	transform_key(1) <= given_key(0);
  transform_key(5) <= given_key(4);
  transform_key(9) <= given_key(8);
  transform_key(13) <= given_key(12);
  -----------------------
  transform_key(2) <= given_key(1);
  transform_key(6) <= given_key(5);
  transform_key(10) <= given_key(9);
  transform_key(14) <= given_key(13);
  -----------------------
  transform_key(3) <= given_key(2);
  transform_key(7) <= given_key(6);
  transform_key(11) <= given_key(10);
  transform_key(15) <= given_key(14);
END struct;


