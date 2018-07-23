LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY columns_mix_process IS
  PORT(state: IN STATE_ARRAY;
  state_after_mix: OUT STATE_ARRAY);
END columns_mix_process;
  
ARCHITECTURE rtl OF columns_mix_process IS
  COMPONENT poly_multiplier PORT(a, b: IN SLV_8; c: OUT SLV_8);
  END COMPONENT;
  FOR ALL: poly_multiplier USE ENTITY work.poly_multiplier(rtl);
  SIGNAL r00,r01,r02,r03,r04,r05,r06,r07,
         r10,r11,r12,r13,r14,r15,r16,r17,
         r20,r21,r22,r23,r24,r25,r26,r27,
         r30,r31,r32,r33,r34,r35,r36,r37: SLV_8;
BEGIN
  
	C0: poly_multiplier PORT MAP(x"02" ,state(0),r00);
	C1: poly_multiplier PORT MAP(x"03", state(4),r01);

	C2: poly_multiplier PORT MAP(x"02" ,state(1),r02);
	C3: poly_multiplier PORT MAP(x"03", state(5),r03);

	C4: poly_multiplier PORT MAP(x"02" ,state(2),r04);
	C5: poly_multiplier PORT MAP(x"03", state(6),r05);

	C6: poly_multiplier PORT MAP(x"02" ,state(3),r06);
	C7: poly_multiplier PORT MAP(x"03", state(7),r07);
	-------------------------------------------------
	C8: poly_multiplier PORT MAP(x"02" ,state(4),r10);
	C9: poly_multiplier PORT MAP(x"03", state(8),r11);

	C10: poly_multiplier PORT MAP(x"02" ,state(5),r12);
	C11: poly_multiplier PORT MAP(x"03", state(9),r13);

	C12: poly_multiplier PORT MAP(x"02" ,state(6),r14);
	C13: poly_multiplier PORT MAP(x"03", state(10),r15);

	C14: poly_multiplier PORT MAP(x"02" ,state(7),r16);
	C15: poly_multiplier PORT MAP(x"03", state(11),r17);

	-------------------------------------------------
	C16: poly_multiplier PORT MAP(x"02" ,state(8),r20);
	C17: poly_multiplier PORT MAP(x"03", state(12),r21);

	C18: poly_multiplier PORT MAP(x"02" ,state(9),r22);
	C19: poly_multiplier PORT MAP(x"03", state(13),r23);

	C20: poly_multiplier PORT MAP(x"02" ,state(10),r24);
	C21: poly_multiplier PORT MAP(x"03", state(14),r25);

	C22: poly_multiplier PORT MAP(x"02" ,state(11),r26);
	C23: poly_multiplier PORT MAP(x"03", state(15),r27);

	-------------------------------------------------
	C24: poly_multiplier PORT MAP(x"02" ,state(12),r30);
	C25: poly_multiplier PORT MAP(x"03", state(0),r31);

	C26: poly_multiplier PORT MAP(x"02" ,state(13),r32);
	C27: poly_multiplier PORT MAP(x"03", state(1),r33);

	C28: poly_multiplier PORT MAP(x"02" ,state(14),r34);
	C29: poly_multiplier PORT MAP(x"03", state(2),r35);

	C30: poly_multiplier PORT MAP(x"02" ,state(15),r36);
	C31: poly_multiplier PORT MAP(x"03", state(3),r37);


	-------------------------------------------------------------
	state_after_mix(0) <= r00 XOR r01 XOR state(8) XOR state(12);
	state_after_mix(1) <= r02 XOR r03 XOR state(9) XOR state(13);
	state_after_mix(2) <= r04 XOR r05 XOR state(10) XOR state(14);
	state_after_mix(3) <= r06 XOR r07 XOR state(11) XOR state(15);
	-------------------------------------------------------------
	state_after_mix(4) <= r10 XOR r11 XOR state(0) XOR state(12);
	state_after_mix(5) <= r12 XOR r13 XOR state(1) XOR state(13);
	state_after_mix(6) <= r14 XOR r15 XOR state(2) XOR state(14);
	state_after_mix(7) <= r16 XOR r17 XOR state(3) XOR state(15);
	-------------------------------------------------------------
	state_after_mix(8) <= r20 XOR r21 XOR state(0) XOR state(4);
	state_after_mix(9) <= r22 XOR r23 XOR state(1) XOR state(5);
	state_after_mix(10) <= r24 XOR r25 XOR state(2) XOR state(6);
	state_after_mix(11) <= r26 XOR r27 XOR state(3) XOR state(7);
	-------------------------------------------------------------
	state_after_mix(12) <= r30 XOR r31 XOR state(8) XOR state(4);
	state_after_mix(13) <= r32 XOR r33 XOR state(9) XOR state(5);
	state_after_mix(14) <= r34 XOR r35 XOR state(10) XOR state(6);
	state_after_mix(15) <= r36 XOR r37 XOR state(11) XOR state(7);
	
END rtl;


