LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY process_lastround IS
  PORT(state_after_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
    state_after_addout: OUT STATE_ARRAY); 
END process_lastround;

ARCHITECTURE struct OF process_lastround IS
  COMPONENT states_substitute
    PORT(state: IN STATE_ARRAY; 
     CLK: IN STD_LOGIC;
      state_after_sub: OUT STATE_ARRAY);
  END COMPONENT;

  COMPONENT shift_row_process
    PORT(state: IN STATE_ARRAY; 
      state_after_shift: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT add_round_key_process
    PORT(state,round_key: IN STATE_ARRAY; 
    state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
  
  SIGNAL state_after_shift, state_after_sub, generated_key: STATE_ARRAY ;

  BEGIN
    generated_key <= all_generated_key(10);
    
    G1: states_substitute PORT MAP (state_after_addin, CLK, state_after_sub);
    G2: shift_row_process PORT MAP (state_after_sub, state_after_shift);
    G3: add_round_key_process PORT MAP (state_after_shift, generated_key, state_after_addout);
    
END struct;

