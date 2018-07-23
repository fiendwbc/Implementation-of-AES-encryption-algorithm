LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;

ENTITY counter6 IS
  PORT(CLK,CLR: IN STD_LOGIC := '0';
--       CNT35: OUT STD_LOGIC :='0');
       CNT36: OUT STD_LOGIC :='0';
        CNT37, CNT38: OUT STD_LOGIC :='0');
END counter6;

ARCHITECTURE struct OF counter6 IS
  SIGNAL COUNT: UNSIGNED (5 DOWNTO 0) := "000000";
  BEGIN
  add:PROCESS(CLK,CLR)
  BEGIN
    IF (CLR = '1') THEN
      COUNT <= "000000";
    ELSIF (CLK = '1' AND CLK' EVENT) THEN
      COUNT <= COUNT + 1;
    ELSE
      NULL;
    END IF;
  END PROCESS;
  
  output:PROCESS(COUNT)
  BEGIN
    CASE COUNT IS
--      WHEN "100011" =>
--     CNT35 <='1'; 
--      CNT37 <= '0';
--      CNT38 <= '0';
    WHEN "100100" =>  --change the value for CNT36 at sub(36) 
--      CNT35 <='0'; 
      CNT36 <= '1';
      CNT37 <= '0';
      CNT38 <= '0';
    WHEN "100101" =>  
--     CNT35 <='0'; 
      CNT36 <= '0';
      CNT37 <= '1';
      CNT38 <= '1';
    WHEN "100110" =>
--     CNT35 <='0'; 
      CNT37 <= '0';
      CNT38 <= '1';
    WHEN OTHERS =>
--     CNT35 <='0'; 
      CNT37 <= '0';
      CNT38 <= '0';
    END CASE;
  END PROCESS;
END struct;

