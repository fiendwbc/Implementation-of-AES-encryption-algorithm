LIBRARY IEEE;
use STD.textio.all ;
use std.textio.all;
use IEEE.std_logic_textio.all; 
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY inv_encryption_process_testbench IS
END inv_encryption_process_testbench;
ARCHITECTURE IO OF inv_encryption_process_testbench IS
  COMPONENT inv_encryption_process
  PORT(cipher,key: IN STATE_ARRAY; 
    START, CLK: IN STD_LOGIC;
    DONE: OUT STD_LOGIC;
    FILE_CLOSED: OUT STD_LOGIC;
    plain: OUT STATE_ARRAY);
  END COMPONENT;
SIGNAL cipher,key: STATE_ARRAY;
SIGNAL CLK: STD_LOGIC := '0';
SIGNAL plain: STATE_ARRAY;
SIGNAL DONE,FILE_CLOSED: STD_LOGIC := '0';
SIGNAL START: STD_LOGIC;
SIGNAL result_final,result_final1: STD_LOGIC_VECTOR(127 DOWNTO 0);
BEGIN
  E0: inv_encryption_process PORT MAP(cipher, key, START, CLK, DONE, FILE_CLOSED, plain);
  START <= '0', '1' AFTER 5 NS, '0' AFTER 100 NS;
  CLK <= NOT CLK AFTER 8 ns;
  --result_final <= "00110010100010000011000111100000010000110101101000110001001101111111011000110000100110000000011110101000100011011010001000110100";  
  result_final <= plain(15) & plain(14) & plain(13) & plain(12) & plain(11) & plain(10) & plain(9)
               & plain(8) & plain(7) & plain(6) & plain(5) & plain(4) & plain(3) & plain(2) & plain(1) & plain(0);
  result_final1 <= plain(0) & plain(1) & plain(2) & plain(3) & plain(4) & plain(5) & plain(6)
               & plain(7) & plain(8) & plain(9) & plain(10) & plain(11) & plain(12) & plain(13) & plain(14) & plain(15);

  process  
    --variable data_number : integer;
		variable data_in, data_out : STD_LOGIC_VECTOR(127 DOWNTO 0);
		file input : TEXT is in "output.txt";
		file output : TEXT is out "inv_input.txt";
		variable inline : LINE;
		variable outline : LINE;

		begin
			--data_number := 0;
      while (not endfile(input)) loop
				readline(input, inline);
				read(inline, data_in);
				cipher(0) <= data_in(7 downto 0);
				cipher(1) <= data_in(15 downto 8);
				cipher(2) <= data_in(23 downto 16);
				cipher(3) <= data_in(31 downto 24);
				cipher(4) <= data_in(39 downto 32);
				cipher(5) <= data_in(47 downto 40);
				cipher(6) <= data_in(55 downto 48);
				cipher(7) <= data_in(63 downto 56);
				cipher(8) <= data_in(71 downto 64);
				cipher(9) <= data_in(79 downto 72);
				cipher(10) <= data_in(87 downto 80);
				cipher(11) <= data_in(95 downto 88);
				cipher(12) <= data_in(103 downto 96);
				cipher(13) <= data_in(111 downto 104);
				cipher(14) <= data_in(119 downto 112);
				cipher(15) <= data_in(127 downto 120);
				wait until FILE_CLOSED = '1';
				data_out := result_final1;
				write(outline, data_out);
				writeline(output, outline);
				wait for 10 ns;
				end loop;
			  file_close(input);
			  file_close(output);
	end process;
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



