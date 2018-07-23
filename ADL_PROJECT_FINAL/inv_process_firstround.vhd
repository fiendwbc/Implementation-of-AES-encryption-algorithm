LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_process_firstround IS
  PORT(state_before_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
    state_after_invsub: OUT STATE_ARRAY); 
END inv_process_firstround;

ARCHITECTURE struct OF inv_process_firstround IS
  COMPONENT inv_states_substitute
    PORT(state: IN STATE_ARRAY; 
      state_after_invsub: OUT STATE_ARRAY);
  END COMPONENT;

  COMPONENT inv_shift_row
    PORT(state: IN STATE_ARRAY; 
      state_after_invshift: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT add_round_key
    PORT(state,round_key: IN STATE_ARRAY; 
     CLK: IN STD_LOGIC;
    state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
  
  SIGNAL state_after_invshift, state_after_addout, generated_key: STATE_ARRAY ;

  BEGIN
    generated_key <= all_generated_key(10);
    
    F1: add_round_key PORT MAP (state_before_addin, generated_key, CLK, state_after_addout);
    F2: inv_shift_row PORT MAP (state_after_addout, state_after_invshift);
    F3: inv_states_substitute PORT MAP (state_after_invshift, state_after_invsub);
    
END struct;

