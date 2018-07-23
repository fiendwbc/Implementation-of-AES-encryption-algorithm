LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY encryption IS
  PORT(plain,key: IN STATE_ARRAY; 
    START, CLK: IN STD_LOGIC;
    DONE: OUT STD_LOGIC;
    cipher: OUT STATE_ARRAY);
END encryption;

ARCHITECTURE struct OF encryption IS
  COMPONENT CU
    PORT(START, CLK: IN STD_LOGIC := '0';
--        CNT35: IN STD_LOGIC; 
       CNT36: IN STD_LOGIC; 
       CNT37: IN STD_LOGIC; 
       CNT38: IN STD_LOGIC; 
       CNT_CLR: OUT STD_LOGIC; 
       INIT_CLR: OUT STD_LOGIC;
       R_NUM: OUT INTEGER; 
       R_RDY: OUT STD_LOGIC;
--       o35, o37, o38: OUT STD_LOGIC);
       o36: OUT STD_LOGIC;
       o37, o38: OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT add_round_key
    PORT(state,round_key: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC;
    state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT columns_mix
    PORT(state: IN STATE_ARRAY; 
  CLK: IN STD_LOGIC;
  state_after_mix: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT counter6
    PORT(CLK,CLR: IN STD_LOGIC := '0';
--       CNT35: OUT STD_LOGIC :='0');
       CNT36: OUT STD_LOGIC :='0';
       CNT37, CNT38: OUT STD_LOGIC :='0');
  END COMPONENT;
  
  COMPONENT d_ff 
    PORT(D: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC; 
    CNT36: IN STD_LOGIC;
    CLR: IN STD_LOGIC;
    Q: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT key_generator
    PORT(previous_key: IN STATE_ARRAY; round: IN INTEGER; generated_key: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT mux2_1
    PORT(I0,I1:IN STATE_ARRAY;
       S:IN STD_LOGIC;
       O:OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT shift_row
    PORT(state: IN STATE_ARRAY; 
      CLK: IN STD_LOGIC;
      state_after_shift: OUT STATE_ARRAY);
  END COMPONENT;
  
  COMPONENT states_substitute
    PORT(state: IN STATE_ARRAY; 
     CLK: IN STD_LOGIC;
      state_after_sub: OUT STATE_ARRAY);
  END COMPONENT;
  
  
  SIGNAL CNT_CLR, INIT_CLR, CNT, CNT36, CNT37, CNT38, R_RDY, o36, o37, o38: STD_LOGIC := '0';
  SIGNAL round_key, state_after_add, state_after_shift, state_after_sub, state_after_mix, Q, generated_key: STATE_ARRAY ;
  SIGNAL muxOut1, muxOut2, muxOut3: STATE_ARRAY ;
  SIGNAL round: INTEGER :=0;
  
  --SIGNAL QB: STD_LOGIC :='1';
  --SIGNAL SEL_P, SEL_A: STD_LOGIC_VECTOR(1 DOWNTO 0);
  --SIGNAL ADD_RESULT, R_P, R_B, R_A, R_XOR, R1_MUX, R2_MUX, INV_B: STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
  --SIGNAL ZERO: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
  BEGIN
--    G0: CU PORT MAP (START, CLK, CNT35, CNT37, CNT38, CNT_CLR, INIT_CLR, round, R_RDY, o35, o37, o38);
--    G0: CU PORT MAP (START, CLK, CNT37, CNT38, CNT_CLR, INIT_CLR, round, R_RDY, o37, o38);
    G0: CU PORT MAP (START, CLK, CNT36, CNT37, CNT38, CNT_CLR, INIT_CLR, round, R_RDY, o36, o37, o38);
--    G1: counter6 PORT MAP (CLK, CNT_CLR, CNT35, CNT37, CNT38);
--    G1: counter6 PORT MAP (CLK, CNT_CLR, CNT37, CNT38);
    G1: counter6 PORT MAP (CLK, CNT_CLR, CNT36, CNT37, CNT38);
    G2: mux2_1 PORT MAP (muxOut3, plain, CNT_CLR, muxOut1); --muxOut1
    G3: mux2_1 PORT MAP (generated_key, key, CNT_CLR, muxOut2); --muxOut2
    G4: add_round_key PORT MAP (muxOut1, muxOut2, CLK, state_after_add);
    G5: states_substitute PORT MAP (state_after_add, CLK, state_after_sub);
    G6: shift_row PORT MAP (state_after_sub, CLK, state_after_shift);
    G7: columns_mix PORT MAP (state_after_shift, CLK, state_after_mix);
    G8: mux2_1 PORT MAP (state_after_mix, state_after_shift, o37, muxOut3); --muxOut3
    G9: d_ff PORT MAP (muxOut2, CLK, o36, INIT_CLR, Q);
    G10: key_generator PORT MAP (Q, round, generated_key);
    --G9: adder32 PORT MAP (R2_MUX, R_P, GT, ADD_RESULT, Cout);
    cipher <= state_after_add;
    DONE <= R_RDY;
    
END struct;

