LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY add_round_key_tb IS
END add_round_key_tb;
ARCHITECTURE IO OF add_round_key_tb IS
  COMPONENT add_round_key
    PORT(state, round_key: IN STATE_ARRAY; 
    CLK: IN STD_LOGIC; 
    state_after_add: OUT STATE_ARRAY);
  END COMPONENT;
SIGNAL i0, i1, oAdd: STATE_ARRAY;
SIGNAL clk: STD_LOGIC:='0';
BEGIN
  G0: add_round_key PORT MAP(i0,i1,clk, oAdd);
  clk <= NOT clk AFTER 10 NS WHEN NOW >= 0 NS;
  i0(0) <= x"04";
  i0(1) <= x"e0";
  i0(2) <= x"48";
  i0(3) <= x"28";
  i0(4) <= x"66";
  i0(5) <= x"cb";
  i0(6) <= x"f8";
  i0(7) <= x"06";
  i0(8) <= x"81";
  i0(9) <= x"19";
  i0(10) <= x"d3";
  i0(11) <= x"26";
  i0(12) <= x"e5";
  i0(13) <= x"9a";
  i0(14) <= x"7a";
  i0(15) <= x"4c";
  ----------------
  
 	i1(0) <= x"a0";
  i1(1) <= x"88";
  i1(2) <= x"23";
  i1(3) <= x"2a";
  
  i1(4) <= x"fa";
  i1(5) <= x"54";
  i1(6) <= x"a3";
  i1(7) <= x"6c";
  
  i1(8) <= x"fe";
  i1(9) <= x"2c";
  i1(10) <= x"39";
  i1(11) <= x"76";
  
  i1(12) <= x"17";
  i1(13) <= x"b1";
  i1(14) <= x"39";
  i1(15) <= x"05";
END IO;





