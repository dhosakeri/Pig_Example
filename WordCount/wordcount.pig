A = LOAD '/pig_example/wordcount_input' AS (f1:chararray);
B = FOREACH A GENERATE flatten(TOKENIZE(f1)) as word;
C = GROUP B BY word;
D = FOREACH C GENERATE COUNT(B), group;
STORE D INTO '/pig_example/wordcount_output';
