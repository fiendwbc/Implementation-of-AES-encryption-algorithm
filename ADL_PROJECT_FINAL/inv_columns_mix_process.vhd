LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;
ENTITY inv_columns_mix_process IS
  PORT(state: IN STATE_ARRAY;
  state_after_invmix: OUT STATE_ARRAY);
END inv_columns_mix_process;
  
ARCHITECTURE rtl OF inv_columns_mix_process IS
  COMPONENT multiplier_substitute PORT(a, b: IN SLV_8; c: OUT SLV_8);
  END COMPONENT;
--  FOR ALL: multiplier_substitute USE ENTITY work.multiplier_substitute(rtl);
  SIGNAL r00, r01, r02, r03, r10, r11, r12, r13, r20, r21, r22, r23, r30, r31, r32, r33, 
        r40, r41, r42, r43, r50, r51, r52, r53, r60, r61, r62, r63, r70, r71, r72, r73, 
        r80, r81, r82, r83, r90, r91, r92, r93, ra0, ra1, ra2, ra3, rb0, rb1, rb2, rb3, 
        rc0, rc1, rc2, rc3, rd0, rd1, rd2, rd3, re0, re1, re2, re3, rf0, rf1, rf2, rf3: SLV_8;
BEGIN
  
	C00: multiplier_substitute PORT MAP(x"14" ,state( 0),r00);
	C01: multiplier_substitute PORT MAP(x"11", state( 4),r01);
	C02: multiplier_substitute PORT MAP(x"13" ,state( 8),r02);
	C03: multiplier_substitute PORT MAP(x"09", state(12),r03);
	C10: multiplier_substitute PORT MAP(x"14" ,state( 1),r10);
	C11: multiplier_substitute PORT MAP(x"11", state( 5),r11);
	C12: multiplier_substitute PORT MAP(x"13" ,state( 9),r12);
	C13: multiplier_substitute PORT MAP(x"09", state(13),r13);
	C20: multiplier_substitute PORT MAP(x"14" ,state( 2),r20);
	C21: multiplier_substitute PORT MAP(x"11", state( 6),r21);
	C22: multiplier_substitute PORT MAP(x"13", state(10),r22);
	C23: multiplier_substitute PORT MAP(x"09", state(14),r23);
	C30: multiplier_substitute PORT MAP(x"14" ,state( 3),r30);
	C31: multiplier_substitute PORT MAP(x"11", state( 7),r31);
	C32: multiplier_substitute PORT MAP(x"13" ,state(11),r32);
	C33: multiplier_substitute PORT MAP(x"09", state(15),r33);
	C40: multiplier_substitute PORT MAP(x"09" ,state( 0),r40);
	C41: multiplier_substitute PORT MAP(x"14", state( 4),r41);
	C42: multiplier_substitute PORT MAP(x"11" ,state( 8),r42);
	C43: multiplier_substitute PORT MAP(x"13", state(12),r43);
	C50: multiplier_substitute PORT MAP(x"09" ,state( 1),r50);
	C51: multiplier_substitute PORT MAP(x"14", state( 5),r51);
	C52: multiplier_substitute PORT MAP(x"11" ,state( 9),r52);
	C53: multiplier_substitute PORT MAP(x"13", state(13),r53);
	C60: multiplier_substitute PORT MAP(x"09" ,state( 2),r60);
	C61: multiplier_substitute PORT MAP(x"14", state( 6),r61);
	C62: multiplier_substitute PORT MAP(x"11", state(10),r62);
	C63: multiplier_substitute PORT MAP(x"13", state(14),r63);
	C70: multiplier_substitute PORT MAP(x"09" ,state( 3),r70);
	C71: multiplier_substitute PORT MAP(x"14", state( 7),r71);
	C72: multiplier_substitute PORT MAP(x"11" ,state(11),r72);
	C73: multiplier_substitute PORT MAP(x"13", state(15),r73);
	C80: multiplier_substitute PORT MAP(x"13" ,state( 0),r80);
	C81: multiplier_substitute PORT MAP(x"09", state( 4),r81);
	C82: multiplier_substitute PORT MAP(x"14" ,state( 8),r82);
	C83: multiplier_substitute PORT MAP(x"11", state(12),r83);
	C90: multiplier_substitute PORT MAP(x"13" ,state( 1),r90);
	C91: multiplier_substitute PORT MAP(x"09", state( 5),r91);
	C92: multiplier_substitute PORT MAP(x"14" ,state( 9),r92);
	C93: multiplier_substitute PORT MAP(x"11", state(13),r93);
	CA0: multiplier_substitute PORT MAP(x"13" ,state( 2),ra0);
	CA1: multiplier_substitute PORT MAP(x"09", state( 6),ra1);
	CA2: multiplier_substitute PORT MAP(x"14", state(10),ra2);
	CA3: multiplier_substitute PORT MAP(x"11", state(14),ra3);
	CB0: multiplier_substitute PORT MAP(x"13" ,state( 3),rb0);
	CB1: multiplier_substitute PORT MAP(x"09", state( 7),rb1);
	CB2: multiplier_substitute PORT MAP(x"14" ,state(11),rb2);
	CB3: multiplier_substitute PORT MAP(x"11", state(15),rb3);
	CC0: multiplier_substitute PORT MAP(x"11" ,state( 0),rc0);
	CC1: multiplier_substitute PORT MAP(x"13", state( 4),rc1);
	CC2: multiplier_substitute PORT MAP(x"09" ,state( 8),rc2);
	CC3: multiplier_substitute PORT MAP(x"14", state(12),rc3);
	CD0: multiplier_substitute PORT MAP(x"11" ,state( 1),rd0);
	CD1: multiplier_substitute PORT MAP(x"13", state( 5),rd1);
	CD2: multiplier_substitute PORT MAP(x"09" ,state( 9),rd2);
	CD3: multiplier_substitute PORT MAP(x"14", state(13),rd3);
	CE0: multiplier_substitute PORT MAP(x"11" ,state( 2),re0);
	CE1: multiplier_substitute PORT MAP(x"13", state( 6),re1);
	CE2: multiplier_substitute PORT MAP(x"09", state(10),re2);
	CE3: multiplier_substitute PORT MAP(x"14", state(14),re3);
	CF0: multiplier_substitute PORT MAP(x"11" ,state( 3),rf0);
	CF1: multiplier_substitute PORT MAP(x"13", state( 7),rf1);
	CF2: multiplier_substitute PORT MAP(x"09" ,state(11),rf2);
	CF3: multiplier_substitute PORT MAP(x"14", state(15),rf3);

	state_after_invmix( 0) <= r00 XOR r01 XOR r02 XOR r03;
	state_after_invmix( 1) <= r10 XOR r11 XOR r12 XOR r13;
	state_after_invmix( 2) <= r20 XOR r21 XOR r22 XOR r23;
	state_after_invmix( 3) <= r30 XOR r31 XOR r32 XOR r33;
	state_after_invmix( 4) <= r40 XOR r41 XOR r42 XOR r43;
	state_after_invmix( 5) <= r50 XOR r51 XOR r52 XOR r53;
	state_after_invmix( 6) <= r60 XOR r61 XOR r62 XOR r63;
	state_after_invmix( 7) <= r70 XOR r71 XOR r72 XOR r73;
	state_after_invmix( 8) <= r80 XOR r81 XOR r82 XOR r83;
	state_after_invmix( 9) <= r90 XOR r91 XOR r92 XOR r93;
	state_after_invmix(10) <= ra0 XOR ra1 XOR ra2 XOR ra3;
	state_after_invmix(11) <= rb0 XOR rb1 XOR rb2 XOR rb3;
	state_after_invmix(12) <= rc0 XOR rc1 XOR rc2 XOR rc3;
	state_after_invmix(13) <= rd0 XOR rd1 XOR rd2 XOR rd3;
	state_after_invmix(14) <= re0 XOR re1 XOR re2 XOR re3;
	state_after_invmix(15) <= rf0 XOR rf1 XOR rf2 XOR rf3;
	
END rtl;


