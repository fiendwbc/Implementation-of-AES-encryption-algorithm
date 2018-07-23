LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY add_round_key IS
  PORT(state,round_key: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC;
    state_after_add: OUT STATE_ARRAY);
END add_round_key;
  
ARCHITECTURE rtl OF add_round_key IS
BEGIN
  PROCESS(CLK)
    BEGIN
      IF (CLK = '1' AND CLK' EVENT) THEN
        FOR I IN 0 TO 15 LOOP
          state_after_add(I)<=state(I) XOR round_key(I);
        END LOOP;
        ELSE
          NULL;
      END IF;
  END PROCESS;
END rtl;