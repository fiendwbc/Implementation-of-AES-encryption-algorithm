LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY add_round_key_process IS
  PORT(state,round_key: IN STATE_ARRAY; 
    state_after_add: OUT STATE_ARRAY);
END add_round_key_process;
  
ARCHITECTURE rtl OF add_round_key_process IS
BEGIN
  PROCESS(state,round_key)
    BEGIN
        FOR I IN 0 TO 15 LOOP
        state_after_add(I)<=state(I) XOR round_key(I);
        END LOOP;
  END PROCESS;
END rtl;