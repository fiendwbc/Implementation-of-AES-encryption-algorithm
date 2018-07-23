LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

--2-to-1 multiplexer
ENTITY mux2_1 IS
  PORT(I0,I1:IN STATE_ARRAY;
       S:IN STD_LOGIC;
       O:OUT STATE_ARRAY);
END mux2_1;
ARCHITECTURE rtl OF mux2_1 IS
  BEGIN
    P0: PROCESS(S,I0,I1)
    BEGIN
      IF (S='1') THEN
        O<=I1;
      ELSE
        O<=I0;
      END IF;
    END PROCESS P0;
END rtl;
