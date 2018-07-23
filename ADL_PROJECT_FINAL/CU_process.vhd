LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.ALL;

ENTITY CU_process IS
  PORT(START: IN STD_LOGIC := '0';
        CLK: IN STD_LOGIC := '0';
        round_num: IN INTEGER := 1;
        CNT_CLR: OUT STD_LOGIC; -- to reset initial number
        R_RDY: OUT STD_LOGIC;
        FILE_CLOSE: OUT STD_LOGIC
        );
END CU_process;
ARCHITECTURE rtl OF CU_process IS
  TYPE STATE IS (INIT, FIRST, ROUND, LAST, DONE, AFTERDONE);
  SIGNAL nSTATE, cSTATE: STATE;
  BEGIN
    trans: PROCESS(CLK)
    BEGIN
      IF (CLK = '1' AND CLK' EVENT) THEN
        cSTATE <= nSTATE;
      ELSE
        NULL;
      END IF;
    END PROCESS;
    
    decoding: PROCESS(CLK)
    BEGIN
      CASE cSTATE IS
      WHEN INIT =>
        IF START = '1' THEN
          nSTATE <= FIRST;
        ELSE
          NULL;
        END IF;
      WHEN FIRST =>
          nSTATE <= ROUND;
      WHEN ROUND =>
        IF round_num = 9 THEN
          nSTATE <= LAST;
          
        ELSE
          NULL;
        END IF;
      WHEN LAST =>
        nSTATE <= DONE;
      WHEN DONE =>
--        nSTATE <= INIT;
        nSTATE <= AFTERDONE;
    WHEN AFTERDONE =>
        nSTATE <= AFTERDONE;
      END CASE;

    END PROCESS;

    output: PROCESS(cSTATE)
    BEGIN
      CASE cSTATE IS
      WHEN INIT =>
        R_RDY <= '0';
        CNT_CLR <= '1';
        FILE_CLOSE <= '0';
      WHEN FIRST =>
        R_RDY <= '0';
        CNT_CLR <= '1';
        FILE_CLOSE <= '0';
      WHEN ROUND =>
        R_RDY <= '0';
        CNT_CLR <= '0';
        FILE_CLOSE <= '0';
      WHEN LAST =>
        R_RDY <= '0';
        CNT_CLR <= '0';
        FILE_CLOSE <= '0';
      WHEN DONE =>
        R_RDY <= '1';
        CNT_CLR <= '0';
        FILE_CLOSE <= '0';
      WHEN AFTERDONE =>
        R_RDY <= '1';
        CNT_CLR <= '0';
        FILE_CLOSE <= '1';
      END CASE;

    END PROCESS;

END rtl;


