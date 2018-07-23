LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY process_first IS
  PORT(state_before_addin: IN STATE_ARRAY;
    key: IN STATE_ARRAY;
    CLK: IN STD_LOGIC;
    state_after_addout: OUT STATE_ARRAY); 
END process_first;

ARCHITECTURE struct OF process_first IS
  COMPONENT add_round_key_process
    PORT(state,round_key: IN STATE_ARRAY; 
    num: IN INTEGER;
    state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
  
  BEGIN

    G4: add_round_key_process PORT MAP (state_before_addin, key, 1, state_after_addout);
    
END struct;

