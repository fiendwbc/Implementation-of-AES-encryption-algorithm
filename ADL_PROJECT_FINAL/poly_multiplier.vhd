LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY poly_multiplier IS
  PORT(a, b: IN SLV_8; c: OUT SLV_8);
END poly_multiplier;
ARCHITECTURE rtl OF poly_multiplier IS
BEGIN
   P0: PROCESS(a,b)
	 BEGIN 
	   CASE a IS   
		    WHEN x"01" => 
		      c <= b; 
		    WHEN x"02" => 
		      IF (b(7) = '1') THEN
		       c <= (b(6 DOWNTO 0)&'0') xor "00011011"; 
		      ELSE
		       c <= b(6 DOWNTO 0)&'0';
		      END IF;
		    WHEN x"03" => 
		      IF (b(7) = '1') THEN
		       c <= b(6 DOWNTO 0)&'0' xor "00011011" xor b; 
		      ELSE 
		       c <= b(6 DOWNTO 0)&'0' xor b;
		      END IF;
		    WHEN OTHERS => 
		      NULL;  
	   END CASE;   
		END PROCESS P0;
END rtl;






