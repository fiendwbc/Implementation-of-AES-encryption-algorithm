LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_states_substitute IS
  PORT(state: IN STATE_ARRAY; state_after_invsub: OUT STATE_ARRAY);
END inv_states_substitute;
  
ARCHITECTURE struct OF inv_states_substitute IS
  COMPONENT inv_sbox_lookup
      PORT(a: IN SLV_8; b: OUT SLV_8);
  END COMPONENT;
  
BEGIN
	  G0: inv_sbox_lookup PORT MAP(state(0), state_after_invsub(0));
	  G1: inv_sbox_lookup PORT MAP(state(1), state_after_invsub(1));
	  G2: inv_sbox_lookup PORT MAP(state(2), state_after_invsub(2));
	  G3: inv_sbox_lookup PORT MAP(state(3), state_after_invsub(3));
	  G4: inv_sbox_lookup PORT MAP(state(4), state_after_invsub(4));
	  G5: inv_sbox_lookup PORT MAP(state(5), state_after_invsub(5));
	  G6: inv_sbox_lookup PORT MAP(state(6), state_after_invsub(6));
	  G7: inv_sbox_lookup PORT MAP(state(7), state_after_invsub(7));
	  G8: inv_sbox_lookup PORT MAP(state(8), state_after_invsub(8));
	  G9: inv_sbox_lookup PORT MAP(state(9), state_after_invsub(9));
	  G10: inv_sbox_lookup PORT MAP(state(10), state_after_invsub(10));
	  G11: inv_sbox_lookup PORT MAP(state(11), state_after_invsub(11));
	  G12: inv_sbox_lookup PORT MAP(state(12), state_after_invsub(12));
	  G13: inv_sbox_lookup PORT MAP(state(13), state_after_invsub(13));
	  G14: inv_sbox_lookup PORT MAP(state(14), state_after_invsub(14));
	  G15: inv_sbox_lookup PORT MAP(state(15), state_after_invsub(15));
END struct;


