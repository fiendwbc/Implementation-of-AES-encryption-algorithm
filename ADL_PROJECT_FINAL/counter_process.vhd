LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;

ENTITY counter_process IS
  PORT(CLK,CLR: IN STD_LOGIC := '0';
--       CNT8: OUT STD_LOGIC :='0';
--        CNT9: OUT STD_LOGIC :='0';
        CNT10: OUT STD_LOGIC :='0';
        round_num: OUT INTEGER :=1);
END counter_process;

ARCHITECTURE rtl OF counter_process IS
  SIGNAL COUNT: INTEGER := 1;
  BEGIN
  add:PROCESS(CLK,CLR)
  BEGIN
    IF (CLR = '1') THEN
      COUNT <= 1;
    ELSIF (CLK = '1' AND CLK' EVENT) THEN
      COUNT <= COUNT + 1;
--      IF COUNT = 10 THEN
--        COUNT <= 1;
--      ELSE
--        NULL;
--      END IF;
    ELSE
      NULL;
    END IF;
  END PROCESS;
  
  output:PROCESS(COUNT)
  BEGIN
--    CASE COUNT IS
--    WHEN 9 =>  --change the value for CNT36 at sub(36) 
--      CNT8 <= '1';
--      CNT9 <= '0';
--    WHEN 10 =>  
--      CNT8 <= '0';
--      CNT9 <= '1';
--    WHEN OTHERS =>
--      CNT8 <= '0';
--      CNT9 <= '0';
--    END CASE;
    IF COUNT = 10 THEN
      CNT10 <= '1';
    ELSE 
      CNT10 <= '0';
    END IF;
    round_num <= COUNT - (COUNT/10)*10;
  END PROCESS;
END rtl;

