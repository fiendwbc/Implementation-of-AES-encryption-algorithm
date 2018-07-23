LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;
USE work.type_pkg.ALL;

ENTITY key_generator IS
  PORT(previous_key: IN STATE_ARRAY; round: IN INTEGER; generated_key: OUT STATE_ARRAY);
END key_generator;
  
ARCHITECTURE dataflow OF key_generator IS
  COMPONENT first_col_key_gen
    PORT(fourth_col_key, first_col_key: IN COLUMN_STATE_ARRAY; 
      round: IN INTEGER; 
      generated_col_key: OUT COLUMN_STATE_ARRAY);
  END COMPONENT;
  COMPONENT non_first_col_key_gen
    PORT(previous_col_key, ahead_col_key: IN COLUMN_STATE_ARRAY; 
      generated_col_key: OUT COLUMN_STATE_ARRAY);
  END COMPONENT;
  SIGNAL 
    first_column_key, second_column_key, third_column_key, fourth_column_key,
    first_gen_col, second_gen_col, 
    third_gen_col, fourth_gen_col: COLUMN_STATE_ARRAY;
BEGIN
   
  ---------------------------------------
  first_column_key(0) <= previous_key(0);
  first_column_key(1) <= previous_key(4);
  first_column_key(2) <= previous_key(8);
  first_column_key(3) <= previous_key(12);
  
  ---------------------------------------
  second_column_key(0) <= previous_key(1);
  second_column_key(1) <= previous_key(5);
  second_column_key(2) <= previous_key(9);
  second_column_key(3) <= previous_key(13);
  
  ---------------------------------------
  third_column_key(0) <= previous_key(2);
  third_column_key(1) <= previous_key(6);
  third_column_key(2) <= previous_key(10);
  third_column_key(3) <= previous_key(14);
  
  ---------------------------------------
  fourth_column_key(0) <= previous_key(3);
  fourth_column_key(1) <= previous_key(7);
  fourth_column_key(2) <= previous_key(11);
  fourth_column_key(3) <= previous_key(15);
  
  -----------------------------------------------------------------------------------------
  C0: first_col_key_gen PORT MAP(fourth_column_key,first_column_key, round, first_gen_col);
  C1: non_first_col_key_gen PORT MAP(first_gen_col,second_column_key, second_gen_col);
  C2: non_first_col_key_gen PORT MAP(second_gen_col,third_column_key, third_gen_col);
  C3: non_first_col_key_gen PORT MAP(third_gen_col,fourth_column_key, fourth_gen_col);

  ---------------------------------------
  generated_key(0) <= first_gen_col(0);
  generated_key(4) <= first_gen_col(1);
  generated_key(8) <= first_gen_col(2);
  generated_key(12) <= first_gen_col(3);
  ---------------------------------------
  generated_key(1) <= second_gen_col(0);
  generated_key(5) <= second_gen_col(1);
  generated_key(9) <= second_gen_col(2);
  generated_key(13) <= second_gen_col(3);
  ---------------------------------------
  generated_key(2) <= third_gen_col(0);
  generated_key(6) <= third_gen_col(1);
  generated_key(10) <= third_gen_col(2);
  generated_key(14) <= third_gen_col(3);
  ---------------------------------------
  generated_key(3) <= fourth_gen_col(0);
  generated_key(7) <= fourth_gen_col(1);
  generated_key(11) <= fourth_gen_col(2);
  generated_key(15) <= fourth_gen_col(3);
END dataflow;
