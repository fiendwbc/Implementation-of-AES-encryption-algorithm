LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY shift_row IS
  PORT(state: IN STATE_ARRAY; 
  CLK: IN STD_LOGIC;
  state_after_shift: OUT STATE_ARRAY);
END shift_row;
  
ARCHITECTURE dataflow OF shift_row IS
BEGIN
  PROCESS(CLK)
    BEGIN
      IF (CLK = '1' AND CLK' EVENT) THEN
        state_after_shift(15) <= state(14);    --s15 
        state_after_shift(14) <=  state(13);    --s14 
    				state_after_shift(13) <= state(12);    --s13 
				state_after_shift(12) <=  state(15);    --s12  

				state_after_shift(11)  <=  state(9);    --s11 
				state_after_shift(10)  <=  state(8);    --s10 
				state_after_shift(9)   <=  state(11);    --s9 
				state_after_shift(8)   <=  state(10);    --s8  

				state_after_shift(7)   <=  state(4);    --s7 
				state_after_shift(6)   <=  state(7);    --s6 
				state_after_shift(5)   <=  state(6);  --s5 
				state_after_shift(4)   <=  state(5);  --s4  

				state_after_shift(3)   <=  state(3);  --s3 
				state_after_shift(2)   <=  state(2);  --s2
				state_after_shift(1)   <=  state(1);  --s1
				state_after_shift(0)   <=  state(0);  --s0 
ELSE
          NULL;
           END IF;
END PROCESS;
END dataflow;

