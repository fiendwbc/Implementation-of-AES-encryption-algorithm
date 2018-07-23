LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY encrytion_tb IS
END encrytion_tb;
ARCHITECTURE IO OF encrytion_tb IS
  COMPONENT encryption
    PORT(plain,key: IN STATE_ARRAY; 
    START, CLK: IN STD_LOGIC;
    cipher: OUT STATE_ARRAY);
  END COMPONENT;
SIGNAL plain,key: STATE_ARRAY;
SIGNAL CLK: STD_LOGIC := '0';
SIGNAL cipher: STATE_ARRAY;
SIGNAL START: STD_LOGIC;
BEGIN
  G0: encryption PORT MAP(plain, key, START, CLK, cipher);
  START <= '0', '1' AFTER 25 NS, '0' AFTER 125 NS;
  CLK <= NOT CLK AFTER 8 ns;
  
  plain(0) <= x"32";
  plain(1) <= x"88";
  plain(2) <= x"31";
  plain(3) <= x"e0";
  plain(4) <= x"43";
  plain(5) <= x"5a";
  plain(6) <= x"31";
  plain(7) <= x"37";
  plain(8) <= x"f6";
  plain(9) <= x"30";
  plain(10) <= x"98";
  plain(11) <= x"07";
  plain(12) <= x"a8";
  plain(13) <= x"8d";
  plain(14) <= x"a2";
  plain(15) <= x"34";
  
  key(0) <= x"2b";
  key(1) <= x"28";
  key(2) <= x"ab";
  key(3) <= x"09";
  key(4) <= x"7e";
  key(5) <= x"ae";
  key(6) <= x"f7";
  key(7) <= x"cf";
  key(8) <= x"15";
  key(9) <= x"d2";
  key(10) <= x"15";
  key(11) <= x"4f";
  key(12) <= x"16";
  key(13) <= x"a6";
  key(14) <= x"88";
  key(15) <= x"3c";
END IO;


