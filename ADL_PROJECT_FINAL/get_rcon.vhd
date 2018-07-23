LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY get_rcon IS
  PORT(round: IN INTEGER; rcon: OUT SLV_8);
END get_rcon;
  
ARCHITECTURE rtl OF get_rcon IS
BEGIN
   P0: PROCESS(round)
	 BEGIN 
	   CASE round IS   
		    WHEN 1 => 
		      rcon <= x"01";
		    WHEN 2 => 
		      rcon <= x"02";
		    WHEN 3 => 
		      rcon <= x"04";
		    WHEN 4 => 
		      rcon <= x"08";
		    WHEN 5 => 
		      rcon <= x"10";
		    WHEN 6 => 
		      rcon <= x"20";
		    WHEN 7 => 
		      rcon <= x"40";
		    WHEN 8 => 
		      rcon <= x"80";
		    WHEN 9 => 
		      rcon <= x"1b";
		    WHEN 10 => 
		      rcon <= x"36";
		    WHEN OTHERS => 
		      NULL;  
	   END CASE;
		END PROCESS P0;
END rtl;


