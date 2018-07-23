LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_add_round_key IS
  PORT(state: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC;
--    CNT_CLR: IN STD_LOGIC; -- to reset initial number
    INIT_ROUND: IN INTEGER :=0; -- to init round number
    all_generated_key: IN STATE_ARRAY2;
    first_key: IN STATE_ARRAY;
--    a: OUT SLV_8;
    state_after_add: OUT STATE_ARRAY);
END inv_add_round_key;

  
ARCHITECTURE rtl OF inv_add_round_key IS
--SIGNAL generated_key: STATE_ARRAY ;
SIGNAL roundtmp: INTEGER := 9; 


BEGIN

--  a <= all_generated_key(9)(2);
  PROCESS(CLK)
    BEGIN
--      IF (CLK = '1' AND CLK' EVENT) THEN
      IF (CLK = '1' AND CLK' EVENT) THEN
--        IF roundtmp =9 THEN
--          generated_key <= all_generated_key(roundtmp);
--        ELSE NULL;
--        END IF;

        FOR I IN 0 TO 15 LOOP
            state_after_add(I)<=state(I) XOR all_generated_key(roundtmp)(I);
        END LOOP;
         
        IF roundtmp > 0 and roundtmp <10 THEN
          IF INIT_ROUND = 1 THEN
            roundtmp <= roundtmp -1;
          ELSE
            NULL;
          END IF;
        ELSE NULL;
        END IF;
      ELSE NULL;
      END IF;
  END PROCESS;


--  PROCESS(roundtmp)
--  BEGIN
--        IF roundtmp > 0 and roundtmp <10 THEN
--          generated_key <= all_generated_key(roundtmp);
--        ELSE NULL;
--        END IF;
--  END PROCESS;
END rtl;