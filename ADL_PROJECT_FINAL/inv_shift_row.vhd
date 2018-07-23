--TODO modify
LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_shift_row IS
  PORT(state: IN STATE_ARRAY; state_after_invshift: OUT STATE_ARRAY);
END inv_shift_row;
  
ARCHITECTURE dataflow OF inv_shift_row IS
BEGIN
      state_after_invshift(15) <= state(12);    --s15 
      state_after_invshift(14) <= state(15);    --s14 
			state_after_invshift(13) <= state(14);    --s13 
			state_after_invshift(12) <= state(13);    --s12  

			state_after_invshift(11)  <=  state(9);    --s11 
			state_after_invshift(10)  <=  state(8);    --s10 
			state_after_invshift(9)   <=  state(11);    --s9 
			state_after_invshift(8)   <=  state(10);    --s8  

			state_after_invshift(7)   <=  state(6);    --s7 
			state_after_invshift(6)   <=  state(5);    --s6 
			state_after_invshift(5)   <=  state(4);  --s5 
			state_after_invshift(4)   <=  state(7);  --s4  

			state_after_invshift(3)   <=  state(3);  --s3 
			state_after_invshift(2)   <=  state(2);  --s2
			state_after_invshift(1)   <=  state(1);  --s1
			state_after_invshift(0)   <=  state(0);  --s0 
END dataflow;
