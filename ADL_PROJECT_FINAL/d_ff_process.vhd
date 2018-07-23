LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY d_ff_process IS
  PORT(D: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC; 
    Q: OUT STATE_ARRAY);
END d_ff_process;

ARCHITECTURE rtl OF d_ff_process IS
SIGNAL num: INTEGER := 0;
SIGNAL previousKey: STATE_ARRAY;
--SIGNAL num2: INTEGER := 0;
BEGIN
    count: PROCESS(CLK)
    BEGIN
    
      IF (CLK = '1' AND CLK' EVENT) THEN
        Q <= D;
      ELSE
        NULL;
      END IF;
      
    END PROCESS count;
END rtl;


