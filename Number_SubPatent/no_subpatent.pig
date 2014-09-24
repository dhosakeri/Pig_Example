A = LOAD '/pig_example/no_subpatents_input' USING PigStorage(' ') AS(patent:int,subpatent:float);
B = GROUP A BY patent;
C = FOREACH B GENERATE group,COUNT(A.subpatent);
STORE C INTO '/pig_example/no_subpatents_output';
