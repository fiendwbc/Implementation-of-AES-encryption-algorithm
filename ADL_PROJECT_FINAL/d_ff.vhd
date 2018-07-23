LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY d_ff IS
  PORT(D: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC; 
    CNT36: IN STD_LOGIC;
    CLR: IN STD_LOGIC;
  Q: OUT STATE_ARRAY);
END d_ff;

ARCHITECTURE rtl OF d_ff IS
SIGNAL num: INTEGER := 0;
SIGNAL previousKey: STATE_ARRAY;
--SIGNAL num2: INTEGER := 0;
BEGIN
count: PROCESS(CLK)
    BEGIN
    
      IF (CLR = '1') THEN
        num <= 0;
        previousKey <= D;
      --ELSIF (CLK = '1' AND CLK' EVENT) THEN
      ELSIF (CLK = '1') THEN
        num <= num + 1;
        IF (CNT36 = '1') THEN
          Q <= previousKey;
          previousKey <= D;
          num <= 0;
        ELSE
          IF (num=2)  THEN
            Q <= previousKey;
          ELSIF (num=3)  THEN
            previousKey <= D;
            num <= 0;
          ELSE
            NULL;
          END IF;
        END IF;
      ELSE
        NULL;
      END IF;
      
    END PROCESS count;
END rtl;


