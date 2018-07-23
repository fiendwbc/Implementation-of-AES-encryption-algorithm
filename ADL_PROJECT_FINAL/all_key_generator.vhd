LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY all_key_generator IS
  PORT(original_key: IN STATE_ARRAY; all_generated_key: OUT STATE_ARRAY2);
END all_key_generator;
  
ARCHITECTURE dataflow OF all_key_generator IS
  COMPONENT key_generator
    PORT(previous_key: IN STATE_ARRAY; round: IN INTEGER; generated_key: OUT STATE_ARRAY);
  END COMPONENT;
  
--  SIGNAL previous_key: STATE_ARRAY ;
--  SIGNAL generated_key: STATE_ARRAY ;
--  BEGIN
--      all_generated_key(0) <= original_key;
--      previous_key <= original_key;
--      C1: key_generator PORT MAP(previous_key, 1, generated_key);
--      all_generated_key(1) <= generated_key;
--      previous_key <= generated_key;
--      C2: key_generator PORT MAP(previous_key, 2, generated_key);
--      all_generated_key(2) <= generated_key;
--      previous_key <= generated_key;
--      C3: key_generator PORT MAP(previous_key, 3, generated_key);
--      all_generated_key(3) <= generated_key;
--      previous_key <= generated_key;
--      C4: key_generator PORT MAP(previous_key, 4, generated_key);
--      all_generated_key(4) <= generated_key;
--      previous_key <= generated_key;
--      C5: key_generator PORT MAP(previous_key, 5, generated_key);
--      all_generated_key(5) <= generated_key;
--      previous_key <= generated_key;
--      C6: key_generator PORT MAP(previous_key, 6, generated_key);
--      all_generated_key(6) <= generated_key;
--      previous_key <= generated_key;
--      C7: key_generator PORT MAP(previous_key, 7, generated_key);
--      all_generated_key(7) <= generated_key;
--      previous_key <= generated_key;
--      C8: key_generator PORT MAP(previous_key, 8, generated_key);
--      all_generated_key(8) <= generated_key;
--      previous_key <= generated_key;
--      C9: key_generator PORT MAP(previous_key, 9, generated_key);
--      all_generated_key(9) <= generated_key;
--      previous_key <= generated_key;
--      C10: key_generator PORT MAP(previous_key, 10, generated_key);
--      all_generated_key(10) <= generated_key;
      
  SIGNAL previous_key: STATE_ARRAY ;
  SIGNAL generated_key1: STATE_ARRAY ;
  SIGNAL generated_key2: STATE_ARRAY ;
  SIGNAL generated_key3: STATE_ARRAY ;
  SIGNAL generated_key4: STATE_ARRAY ;
  SIGNAL generated_key5: STATE_ARRAY ;
  SIGNAL generated_key6: STATE_ARRAY ;
  SIGNAL generated_key7: STATE_ARRAY ;
  SIGNAL generated_key8: STATE_ARRAY ;
  SIGNAL generated_key9: STATE_ARRAY ;
  SIGNAL generated_key10: STATE_ARRAY ;
  BEGIN
			C1: key_generator PORT MAP(original_key, 1, generated_key1);
			C2: key_generator PORT MAP(generated_key1, 2, generated_key2);
			C3: key_generator PORT MAP(generated_key2, 3, generated_key3);
			C4: key_generator PORT MAP(generated_key3, 4, generated_key4);
			C5: key_generator PORT MAP(generated_key4, 5, generated_key5);
			C6: key_generator PORT MAP(generated_key5, 6, generated_key6);
			C7: key_generator PORT MAP(generated_key6, 7, generated_key7);
			C8: key_generator PORT MAP(generated_key7, 8, generated_key8);
			C9: key_generator PORT MAP(generated_key8, 9, generated_key9);
			C10: key_generator PORT MAP(generated_key9, 10, generated_key10);

			all_generated_key(0) <= original_key;		      
			all_generated_key(1) <= generated_key1;	
			all_generated_key(2) <= generated_key2;	
			all_generated_key(3) <= generated_key3;	
			all_generated_key(4) <= generated_key4;	
			all_generated_key(5) <= generated_key5;	
			all_generated_key(6) <= generated_key6;	
			all_generated_key(7) <= generated_key7;	
			all_generated_key(8) <= generated_key8;	
			all_generated_key(9) <= generated_key9;	
			all_generated_key(10) <= generated_key10; 
  END dataflow;
