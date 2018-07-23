LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY get_rcon_tb IS
END get_rcon_tb;
ARCHITECTURE IO OF get_rcon_tb IS
  COMPONENT get_rcon
    PORT(round: IN INTEGER RANGE 1 to 10; rcon: OUT SLV_8);
  END COMPONENT;
SIGNAL i1:INTEGER RANGE 1 to 10;
SIGNAL o: SLV_8;
BEGIN
  G0: get_rcon PORT MAP(i1, o);
  i1 <= 1, 2 AFTER 5 NS, 3 AFTER 10 NS, 4 AFTER 15 NS, 5 AFTER 20 NS,
    6 AFTER 25 NS, 7 AFTER 30 NS, 8 AFTER 35 NS, 9 AFTER 40 NS, 10 AFTER 45 NS;
END IO;
