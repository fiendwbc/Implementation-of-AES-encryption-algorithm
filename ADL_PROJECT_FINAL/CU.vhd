LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.ALL;

ENTITY CU IS
  PORT(START, CLK: IN STD_LOGIC := '0';
--        CNT35: IN STD_LOGIC; 
        CNT36: IN STD_LOGIC; 
        CNT37: IN STD_LOGIC; --when CNT37 is asserted, the 10th round is processing and there is no MIX in this round.
        CNT38: IN STD_LOGIC; --10 rounds are done
        CNT_CLR: OUT STD_LOGIC; -- to reset counter
        INIT_CLR: OUT STD_LOGIC; -- to reset initial number
        R_NUM: OUT INTEGER; -- the round number
        R_RDY: OUT STD_LOGIC;
--        o35, o37, o38: OUT STD_LOGIC); -- to indicate whether encryption process is done
        o36: OUT STD_LOGIC; -- to indicate d_ff
        o37, o38: OUT STD_LOGIC); -- to indicate whether encryption process is done
END CU;
ARCHITECTURE rtl OF CU IS
  TYPE STATE IS (INIT, ADD, SUB, SHIFT, MIX, DONE);
  SIGNAL nSTATE, cSTATE: STATE;
  SIGNAL rountTemp: INTEGER := 0;
  BEGIN
    trans: PROCESS(CLK)
    BEGIN
      IF (CLK = '1' AND CLK' EVENT) THEN
        cSTATE <= nSTATE;
      ELSE
        NULL;
      END IF;
    END PROCESS;
    
--    decoding: PROCESS(START, CNT35, CNT37, CNT38, cSTATE)
--    decoding: PROCESS(START, CNT37, CNT38, cSTATE)
    decoding: PROCESS(START, cSTATE)
    BEGIN
      CASE cSTATE IS
      WHEN INIT =>
        IF START = '1' THEN
          nSTATE <= ADD;
        ELSE
          NULL;
        END IF;
      WHEN ADD =>
--        IF nSTATE /= DONE THEN
          rountTemp <= rountTemp + 1;
--        
          IF rountTemp = 11 THEN
            rountTemp <= 0;
          ELSE
            NULL;
          END IF;
--        ELSE
--          NULL;
--        END IF;
          

        IF CNT38 = '1' THEN
          nSTATE <= DONE;
        ELSE
          nSTATE <= SUB;
        END IF;
      WHEN SUB =>
        nSTATE <= SHIFT;
      WHEN SHIFT =>
        IF CNT36 = '1' THEN
          nSTATE <= ADD;
        ELSE
          nSTATE <= MIX;
        END IF;
      WHEN MIX =>
        nSTATE <= ADD;
      WHEN DONE =>
        nSTATE <= INIT;
      END CASE;
    END PROCESS;
    
    output: PROCESS(cSTATE)
    BEGIN
    CASE cSTATE IS
    WHEN INIT =>
      R_RDY <= '0';
      CNT_CLR <= '1';
      INIT_CLR <= '1';
    WHEN ADD =>
      R_RDY <= '0';
--      CNT_CLR <= '0';
      INIT_CLR <= '0';
    WHEN SUB =>
      R_RDY <= '0';
      CNT_CLR <= '0';
      INIT_CLR <= '0';
    WHEN SHIFT =>
      R_RDY <= '0';
      CNT_CLR <= '0';
      INIT_CLR <= '0';
    WHEN MIX =>
      R_RDY <= '0';
      CNT_CLR <= '0';
      INIT_CLR <= '0';
    WHEN DONE =>
      R_RDY <= '1';
      CNT_CLR <= '0';
      INIT_CLR <= '0';
    END CASE;
    R_NUM <= rountTemp;
--    o35 <= CNT35;
    o36 <= CNT36;
    o37 <= CNT37;
    o38 <= CNT38;
  END PROCESS;
END rtl;


