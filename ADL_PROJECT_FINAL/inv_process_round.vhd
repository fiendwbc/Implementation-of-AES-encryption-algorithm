LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_process_round IS
  PORT(state_after_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
--    CNT_CLR: IN STD_LOGIC; -- to reset initial number
    INIT_ROUND: IN INTEGER; -- to init round number
--    round: IN INTEGER; 
    state_after_invsub: OUT STATE_ARRAY); 
END inv_process_round;

ARCHITECTURE struct OF inv_process_round IS
  COMPONENT inv_states_substitute
    PORT(state: IN STATE_ARRAY; 
      state_after_invsub: OUT STATE_ARRAY);
  END COMPONENT;

  COMPONENT inv_shift_row
    PORT(state: IN STATE_ARRAY; 
      state_after_invshift: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT inv_columns_mix_process
    PORT(state: IN STATE_ARRAY; 
  state_after_invmix: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT inv_add_round_key
    PORT(state: IN STATE_ARRAY; 
--    round_key: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC;
--    CNT_CLR: IN STD_LOGIC; -- to reset initial number
    INIT_ROUND: IN INTEGER; -- to init round number
    all_generated_key: IN STATE_ARRAY2;
    first_key: IN STATE_ARRAY;
--    roundtmp: IN INTEGER; 
--    a: OUT SLV_8;
    state_after_add: OUT STATE_ARRAY);
 END COMPONENT;
  
  COMPONENT add_round_key
    PORT(state,round_key: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC;
    state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
  
  SIGNAL state_after_invshift, state_after_invmix, state_after_addout, generated_key, first_key: STATE_ARRAY ;
  SIGNAL key_output, key_output1: STATE_ARRAY ;
--  SIGNAL roundtmp: Integer :=0 ;
--  SIGNAL a: slv_8;

  BEGIN
--    roundtmp <= 10 - round;
    first_key <= all_generated_key(9);
--    R1: add_round_key PORT MAP (state_after_addin, generated_key, CLK, state_after_addout);
--    R1: inv_add_round_key PORT MAP (state_after_addin, generated_key, CLK, INIT_ROUND, roundtmp, state_after_addout);
    R1: inv_add_round_key PORT MAP (state_after_addin, CLK, INIT_ROUND, all_generated_key, first_key, state_after_addout);
    R2: inv_columns_mix_process PORT MAP (state_after_addout, state_after_invmix);
    R3: inv_shift_row PORT MAP (state_after_invmix, state_after_invshift);
    R4: inv_states_substitute PORT MAP (state_after_invshift, state_after_invsub);
    
END struct;

