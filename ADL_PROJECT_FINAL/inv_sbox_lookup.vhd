LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_sbox_lookup IS
  PORT(a: IN SLV_8; b: OUT SLV_8);
END inv_sbox_lookup;
ARCHITECTURE rtl OF inv_sbox_lookup IS
BEGIN
   P0: PROCESS(a)
	BEGIN 
	CASE a IS   
			WHEN x"00" => b <= x"52";
			WHEN x"01" => b <= x"09";
			WHEN x"02" => b <= x"6a";
			WHEN x"03" => b <= x"d5";
			WHEN x"04" => b <= x"30";
			WHEN x"05" => b <= x"36";
			WHEN x"06" => b <= x"a5";
			WHEN x"07" => b <= x"38";
			WHEN x"08" => b <= x"bf";
			WHEN x"09" => b <= x"40";
			WHEN x"0a" => b <= x"a3";
			WHEN x"0b" => b <= x"9e";
			WHEN x"0c" => b <= x"81";
			WHEN x"0d" => b <= x"f3";
			WHEN x"0e" => b <= x"d7";
			WHEN x"0f" => b <= x"fb";  
			
			when x"10" => b <= x"7c";
			WHEN x"11" => b <= x"e3";
			WHEN x"12" => b <= x"39";
			WHEN x"13" => b <= x"82";
			WHEN x"14" => b <= x"9b";
			WHEN x"15" => b <= x"2f";
			WHEN x"16" => b <= x"ff";
			WHEN x"17" => b <= x"87";
			WHEN x"18" => b <= x"34";
			WHEN x"19" => b <= x"8e";
			WHEN x"1a" => b <= x"43";
			WHEN x"1b" => b <= x"44";
			WHEN x"1c" => b <= x"c4";
			WHEN x"1d" => b <= x"de";
			WHEN x"1e" => b <= x"e9";
			WHEN x"1f" => b <= x"cb";  
			
			when x"20" => b <= x"54";
			WHEN x"21" => b <= x"7b";
			WHEN x"22" => b <= x"94";
			WHEN x"23" => b <= x"32";
			WHEN x"24" => b <= x"a6";
			WHEN x"25" => b <= x"c2";
			WHEN x"26" => b <= x"23";
			WHEN x"27" => b <= x"3d";
			WHEN x"28" => b <= x"ee";
			WHEN x"29" => b <= x"4c";
			WHEN x"2a" => b <= x"95";
			WHEN x"2b" => b <= x"0b";
			WHEN x"2c" => b <= x"42";
			WHEN x"2d" => b <= x"fa";
			WHEN x"2e" => b <= x"c3";
			WHEN x"2f" => b <= x"4e";
			  
			when x"30" => b <= x"08";
			WHEN x"31" => b <= x"2e";
			WHEN x"32" => b <= x"a1";
			WHEN x"33" => b <= x"66";
			WHEN x"34" => b <= x"28";
			WHEN x"35" => b <= x"d9";
			WHEN x"36" => b <= x"24";
			WHEN x"37" => b <= x"b2";
			WHEN x"38" => b <= x"76";
			WHEN x"39" => b <= x"5b";
			WHEN x"3a" => b <= x"a2";
			WHEN x"3b" => b <= x"49";
			WHEN x"3c" => b <= x"6d";
			WHEN x"3d" => b <= x"8b";
			WHEN x"3e" => b <= x"d1";       
			WHEN x"3f" => b <= x"25";       
			
			when x"40" => b <= x"72";
			WHEN x"41" => b <= x"f8";
			WHEN x"42" => b <= x"f6";
			WHEN x"43" => b <= x"64";
			WHEN x"44" => b <= x"86";
			WHEN x"45" => b <= x"68";
			WHEN x"46" => b <= x"98";
			WHEN x"47" => b <= x"16";
			WHEN x"48" => b <= x"d4";
			WHEN x"49" => b <= x"a4";
			WHEN x"4a" => b <= x"5c";
			WHEN x"4b" => b <= x"cc";
			WHEN x"4c" => b <= x"5d";
			WHEN x"4d" => b <= x"65";
			WHEN x"4e" => b <= x"b6";
			WHEN x"4f" => b <= x"92";
			  
			when x"50" => b <= x"6c";
			WHEN x"51" => b <= x"70";
			WHEN x"52" => b <= x"48";
			WHEN x"53" => b <= x"50";
			WHEN x"54" => b <= x"fd";
			WHEN x"55" => b <= x"ed";
			WHEN x"56" => b <= x"b9";
			WHEN x"57" => b <= x"da";
			WHEN x"58" => b <= x"5e";
			WHEN x"59" => b <= x"15";
			WHEN x"5a" => b <= x"46";
			WHEN x"5b" => b <= x"57";
			WHEN x"5c" => b <= x"a7";
			WHEN x"5d" => b <= x"8d";
			WHEN x"5e" => b <= x"9d";
			WHEN x"5f" => b <= x"84";     
			
			when x"60" => b <= x"90";
			WHEN x"61" => b <= x"d8";
			WHEN x"62" => b <= x"ab";
			WHEN x"63" => b <= x"00";
			WHEN x"64" => b <= x"8c";
			WHEN x"65" => b <= x"bc";
			WHEN x"66" => b <= x"d3";
			WHEN x"67" => b <= x"0a";
			WHEN x"68" => b <= x"f7";
			WHEN x"69" => b <= x"e4";
			WHEN x"6a" => b <= x"58";
			WHEN x"6b" => b <= x"05";
			WHEN x"6c" => b <= x"b8";
			WHEN x"6d" => b <= x"b3";
			WHEN x"6e" => b <= x"45";
			WHEN x"6f" => b <= x"06";  
			
			when x"70" => b <= x"d0";
			WHEN x"71" => b <= x"2c";
			WHEN x"72" => b <= x"1e";
			WHEN x"73" => b <= x"8f";
			WHEN x"74" => b <= x"ca";
			WHEN x"75" => b <= x"3f";
			WHEN x"76" => b <= x"0f";
			WHEN x"77" => b <= x"02";
			WHEN x"78" => b <= x"c1";
			WHEN x"79" => b <= x"af";
			WHEN x"7a" => b <= x"bd";
			WHEN x"7b" => b <= x"03";
			WHEN x"7c" => b <= x"01";
			WHEN x"7d" => b <= x"13";
			WHEN x"7e" => b <= x"8a";
			WHEN x"7f" => b <= x"6b";     
			
			when x"80" => b <= x"3a";
			WHEN x"81" => b <= x"91";
			WHEN x"82" => b <= x"11";
			WHEN x"83" => b <= x"41";
			WHEN x"84" => b <= x"4f";
			WHEN x"85" => b <= x"67";
			WHEN x"86" => b <= x"dc";
			WHEN x"87" => b <= x"ea";
			WHEN x"88" => b <= x"97";
			WHEN x"89" => b <= x"f2";
			WHEN x"8a" => b <= x"cf";
			WHEN x"8b" => b <= x"ce";
			WHEN x"8c" => b <= x"f0";
			WHEN x"8d" => b <= x"b4";
			WHEN x"8e" => b <= x"e6";
			WHEN x"8f" => b <= x"73"; 
			 
			when x"90" => b <= x"96";
			WHEN x"91" => b <= x"ac";
			WHEN x"92" => b <= x"74";
			WHEN x"93" => b <= x"22";
			WHEN x"94" => b <= x"e7";
			WHEN x"95" => b <= x"ad";
			WHEN x"96" => b <= x"35";
			WHEN x"97" => b <= x"85";
			WHEN x"98" => b <= x"e2";
			WHEN x"99" => b <= x"f9";
			WHEN x"9a" => b <= x"37";
			WHEN x"9b" => b <= x"e8";
			WHEN x"9c" => b <= x"1c";
			WHEN x"9d" => b <= x"75";
			WHEN x"9e" => b <= x"df";
			WHEN x"9f" => b <= x"6e";     
			
			when x"a0" => b <= x"47";
			WHEN x"a1" => b <= x"f1";
			WHEN x"a2" => b <= x"1a";
			WHEN x"a3" => b <= x"71";
			WHEN x"a4" => b <= x"1d";
			WHEN x"a5" => b <= x"29";
			WHEN x"a6" => b <= x"c5";
			WHEN x"a7" => b <= x"89";
			WHEN x"a8" => b <= x"6f";
			WHEN x"a9" => b <= x"b7";
			WHEN x"aa" => b <= x"62";
			WHEN x"ab" => b <= x"0e";
			WHEN x"ac" => b <= x"aa";
			WHEN x"ad" => b <= x"18";
			WHEN x"ae" => b <= x"be";
			WHEN x"af" => b <= x"1b"; 
			 
			when x"b0" => b <= x"fc";
			WHEN x"b1" => b <= x"56";
			WHEN x"b2" => b <= x"3e";
			WHEN x"b3" => b <= x"4b";
			WHEN x"b4" => b <= x"c6";
			WHEN x"b5" => b <= x"d2";
			WHEN x"b6" => b <= x"79";
			WHEN x"b7" => b <= x"20";
			WHEN x"b8" => b <= x"9a";
			WHEN x"b9" => b <= x"db";
			WHEN x"ba" => b <= x"c0";
			WHEN x"bb" => b <= x"fe";
			WHEN x"bc" => b <= x"78";
			WHEN x"bd" => b <= x"cd";
			WHEN x"be" => b <= x"5a";
			WHEN x"bf" => b <= x"f4";     
			
			when x"c0" => b <= x"1f";
			WHEN x"c1" => b <= x"dd";
			WHEN x"c2" => b <= x"a8";
			WHEN x"c3" => b <= x"33";
			WHEN x"c4" => b <= x"88";
			WHEN x"c5" => b <= x"07";
			WHEN x"c6" => b <= x"c7";
			WHEN x"c7" => b <= x"31";
			WHEN x"c8" => b <= x"b1";
			WHEN x"c9" => b <= x"12";
			WHEN x"ca" => b <= x"10";
			WHEN x"cb" => b <= x"59";
			WHEN x"cc" => b <= x"27";
			WHEN x"cd" => b <= x"80";
			WHEN x"ce" => b <= x"ec";
			WHEN x"cf" => b <= x"5f"; 
			 
			when x"d0" => b <= x"60";
			WHEN x"d1" => b <= x"51";
			WHEN x"d2" => b <= x"7f";
			WHEN x"d3" => b <= x"a9";
			WHEN x"d4" => b <= x"19";
			WHEN x"d5" => b <= x"b5";
			WHEN x"d6" => b <= x"4a";
			WHEN x"d7" => b <= x"0d";
			WHEN x"d8" => b <= x"2d";
			WHEN x"d9" => b <= x"e5";
			WHEN x"da" => b <= x"7a";
			WHEN x"db" => b <= x"9f";
			WHEN x"dc" => b <= x"93";
			WHEN x"dd" => b <= x"c9";
			WHEN x"de" => b <= x"9c";
			WHEN x"df" => b <= x"ef";
			     
			when x"e0" => b <= x"a0";
			WHEN x"e1" => b <= x"e0";
			WHEN x"e2" => b <= x"3b";
			WHEN x"e3" => b <= x"4d";
			WHEN x"e4" => b <= x"ae";
			WHEN x"e5" => b <= x"2a";
			WHEN x"e6" => b <= x"f5";
			WHEN x"e7" => b <= x"b0";
			WHEN x"e8" => b <= x"c8";
			WHEN x"e9" => b <= x"eb";
			WHEN x"ea" => b <= x"bb";
			WHEN x"eb" => b <= x"3c";
			WHEN x"ec" => b <= x"83";
			WHEN x"ed" => b <= x"53";
			WHEN x"ee" => b <= x"99";
			WHEN x"ef" => b <= x"61";  
			when x"f0" => b <= x"17";
			WHEN x"f1" => b <= x"2b";
			WHEN x"f2" => b <= x"04";
			WHEN x"f3" => b <= x"7e";
			WHEN x"f4" => b <= x"ba";
			WHEN x"f5" => b <= x"77";
			WHEN x"f6" => b <= x"d6";
			WHEN x"f7" => b <= x"26";
			WHEN x"f8" => b <= x"e1";
			WHEN x"f9" => b <= x"69";
			WHEN x"fa" => b <= x"14";
			WHEN x"fb" => b <= x"63";
			WHEN x"fc" => b <= x"55";
			WHEN x"fd" => b <= x"21";
			WHEN x"fe" => b <= x"0c";
			WHEN x"ff" => b <= x"7d";    
			WHEN others => null;  
			END CASE;   
		END PROCESS P0;
END rtl;






