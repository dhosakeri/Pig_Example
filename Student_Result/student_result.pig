
A = LOAD '/pig_example/student' USING PigStorage(' ')AS (a1:chararray,a2:int);
B=  LOAD '/pig_example/results' USING PigStorage('\t')AS (b1:int,b2:chararray);
C= JOIN A BY a2,B BY b1;
D= FOREACH C GENERATE a1,b2;
E= FILTER D BY b2 matches 'pass';
STORE E INTO '/pig_example/student_result_output';
