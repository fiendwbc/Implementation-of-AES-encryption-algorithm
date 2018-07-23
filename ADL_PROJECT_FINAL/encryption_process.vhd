LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY encryption_process IS
  PORT(plain,key: IN STATE_ARRAY; 
    START, CLK: IN STD_LOGIC;
    DONE: OUT STD_LOGIC;
    FILE_CLOSED: OUT STD_LOGIC;
    cipher: OUT STATE_ARRAY);
END encryption_process;

ARCHITECTURE struct OF encryption_process IS
  COMPONENT CU_process
    PORT(START: IN STD_LOGIC := '0';
        CLK: IN STD_LOGIC := '0';
        round_num: IN INTEGER := 1;
        CNT_CLR: OUT STD_LOGIC; -- to reset initial number
        R_RDY: OUT STD_LOGIC;
        FILE_CLOSE: OUT STD_LOGIC
        );
  END COMPONENT;
  
  COMPONENT counter_process
    PORT(CLK,CLR: IN STD_LOGIC := '0';
        CNT10: OUT STD_LOGIC :='0';
        round_num: OUT INTEGER :=0);
  END COMPONENT;

  COMPONENT all_key_generator
    PORT(original_key: IN STATE_ARRAY; all_generated_key: OUT STATE_ARRAY2);
  END COMPONENT;
    
  COMPONENT process_first
    PORT(state_before_addin: IN STATE_ARRAY;
      key: IN STATE_ARRAY;
      CLK: IN STD_LOGIC;
      state_after_addout: OUT STATE_ARRAY); 
  END COMPONENT;

  COMPONENT mux2_1
    PORT(I0,I1:IN STATE_ARRAY;
       S:IN STD_LOGIC;
       O:OUT STATE_ARRAY);
  END COMPONENT;

  COMPONENT process_round
    PORT(state_after_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
    round: IN INTEGER; 
    state_after_addout: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT process_lastround
    PORT(state_after_addin: IN STATE_ARRAY;
    all_generated_key: IN STATE_ARRAY2;
    CLK: IN STD_LOGIC;
    state_after_addout: OUT STATE_ARRAY); 
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
--  SIGNAL COUNT: INTEGER :=0;
  SIGNAL round_num: INTEGER :=1;
  
  BEGIN
    G0: CU_process PORT MAP (START, CLK, round_num, CNT_CLR, R_RDY, FILE_CLOSE);
    G1: counter_process PORT MAP (CLK, CNT_CLR, CNT10, round_num);
    G2: all_key_generator PORT MAP (key, all_generated_key);
    G3: add_round_key PORT MAP (plain, key, CLK, state_after_addout1);
    G4: mux2_1 PORT MAP (state_after_addout, state_after_addout1, CNT_CLR, state_before_addin); 
    G5: process_round PORT MAP (state_before_addin, all_generated_key, CLK, round_num, state_after_addout);
    G6: process_lastround PORT MAP (state_after_addout, all_generated_key, CLK, state_after_done);
  	 G7: mux2_1 PORT MAP (Q, state_after_done, CNT10, muxOut); 
    G8: d_ff_process PORT MAP (muxOut, CLK, Q); 
    cipher <= Q;
    DONE <= R_RDY;
    FILE_CLOSED <= FILE_CLOSE;
    
END struct;

