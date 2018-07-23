LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_encryption_process IS
  PORT(cipher,key: IN STATE_ARRAY; 
    START, CLK: IN STD_LOGIC;
    DONE: OUT STD_LOGIC;
    FILE_CLOSED: OUT STD_LOGIC;
    plain: OUT STATE_ARRAY);
END inv_encryption_process;

ARCHITECTURE struct OF inv_encryption_process IS
  COMPONENT inv_CU_process
    PORT(START: IN STD_LOGIC := '0';
        CLK: IN STD_LOGIC := '0';
        round_num: IN INTEGER := 1;
        CNT_CLR: OUT STD_LOGIC; -- to reset initial number
        INIT_ROUND: OUT INTEGER; -- to init round number
        R_RDY: OUT STD_LOGIC;
        FILE_CLOSE: OUT STD_LOGIC);
  END COMPONENT;
  
  COMPONENT counter_process
    PORT(CLK,CLR: IN STD_LOGIC := '0';
        CNT10: OUT STD_LOGIC :='0';
        round_num: OUT INTEGER :=0);
  END COMPONENT;

  COMPONENT all_key_generator
    PORT(original_key: IN STATE_ARRAY; all_generated_key: OUT STATE_ARRAY2);
  END COMPONENT;
    
  COMPONENT mux2_1
    PORT(I0,I1:IN STATE_ARRAY;
       S:IN STD_LOGIC;
       O:OUT STATE_ARRAY);
  END COMPONENT;

  COMPONENT inv_process_round
  PORT(state_after_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
--    CNT_CLR: IN STD_LOGIC; -- to reset initial number
    INIT_ROUND: IN INTEGER; -- to init round number
--    round: IN INTEGER; 
    state_after_invsub: OUT STATE_ARRAY); 
  END COMPONENT;
  
  COMPONENT inv_process_firstround
    PORT(state_before_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
    state_after_invsub: OUT STATE_ARRAY); 
  END COMPONENT;
  
  COMPONENT add_round_key
    PORT(state,round_key: IN STATE_ARRAY; 
      CLK: IN STD_LOGIC;
      state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT d_ff_process
   	PORT(D: IN STATE_ARRAY; 
      CLK: IN STD_LOGIC; 
      Q: OUT STATE_ARRAY);
  END COMPONENT;

  SIGNAL CNT10: STD_LOGIC := '0';
  SIGNAL CNT_CLR, R_RDY,FILE_CLOSE: STD_LOGIC := '0';
  SIGNAL state_before_addin, state_after_addout, state_after_addout1, state_after_done, Q: STATE_ARRAY ;
  SIGNAL muxOut: STATE_ARRAY ;
  SIGNAL all_generated_key: STATE_ARRAY2 ;
  SIGNAL round_num: INTEGER :=1;
  SIGNAL INIT_ROUND: INTEGER :=0;
  
  BEGIN
    G0: inv_CU_process PORT MAP (START, CLK, round_num, CNT_CLR, INIT_ROUND, R_RDY, FILE_CLOSE);
    G1: counter_process PORT MAP (CLK, CNT_CLR, CNT10, round_num);
    G2: all_key_generator PORT MAP (key, all_generated_key);
    G3: inv_process_firstround PORT MAP (cipher, all_generated_key, CLK, state_after_addout1);
    G4: mux2_1 PORT MAP (state_after_addout, state_after_addout1, CNT_CLR, state_before_addin); 
    G5: inv_process_round PORT MAP (state_before_addin, all_generated_key, CLK, INIT_ROUND, state_after_addout);
    G6: add_round_key PORT MAP (state_after_addout, key, CLK, state_after_done);
  	 G7: mux2_1 PORT MAP (Q, state_after_done, CNT10, muxOut); 
    G8: d_ff_process PORT MAP (muxOut, CLK, Q); 

    plain <= Q;
    DONE <= R_RDY;
    FILE_CLOSED <= FILE_CLOSE;
END struct;

